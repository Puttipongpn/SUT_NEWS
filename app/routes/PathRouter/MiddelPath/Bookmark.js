var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

//SELECT * FROM bookmark LEFT JOIN news_type ON bookmark.news_id = news_type.news_type_id WHERE bookmark.users_id = ?

router.get('/', ifNotLoggedin, async (req, res, next) => {
    try {
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        dbConnection.execute("SELECT users.* , bookmark.*, news.* FROM bookmark LEFT JOIN news ON bookmark.b_news_id = news.news_id LEFT JOIN users ON news.user_id = users.id WHERE bookmark.b_users_id = ?;", [req.session.userID])
            .then(([rows]) => {
                if (req.session.role === "OFFICIAL USER" || req.session.role === "USER" || req.session.role === "ADMIN") {
                    dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                        .then(([Bookmark]) => {
                            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                                .then(([likeRows]) => {
                                    const likeCounts = likeRows.reduce((acc, like) => {
                                        acc[like.like_news_id] = like.like_count;
                                        console.log(acc)
                                        return acc;
                                    }, {});
                                    res.render('center/bookmake', {
                                        bookmark_id: Bookmark,
                                        users: rows,
                                        header: req.session.header,

                                        bookmark: rows,
                                        name: req.session.name,
                                        role: req.session.role,
                                        user_name: req.session.user_name,
                                        email: req.session.email,
                                        profile_image: req.session.profile_image,
                                        like: Like[0],
                                        likeCounts: likeCounts
                                    });
                                });
                        })
                } else {
                    console.error(error);
                }
            });
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
});

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        b_news_id: req.params.id,
        b_users_id: req.session.userID
    };
    dbConnection.query("INSERT INTO bookmark SET ?", [newsDataWithUserId])
        .then(([rows]) => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.delete('/:id', ifNotLoggedin, (req, res, next) => {
    const deleteData = {
        news_id: req.params.id, // แก้ไขตรงนี้
        users_id: req.session.userID
    };

    dbConnection.query("DELETE FROM `bookmark` WHERE b_news_id = ? AND b_users_id = ?", [deleteData.news_id, deleteData.users_id])
        .then(([rows]) => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});

router.get('/setting_bookmark', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN bookmark ON users.id = bookmark.b_users_id LEFT JOIN news ON bookmark.b_news_id = news.news_id  LEFT JOIN news_type ON bookmark.b_news_id = news_type.news_type_id  LEFT JOIN topic ON bookmark.news_id = topic.topic_id WHERE bookmark.b_users_id = ?", [req.session.userID])
        .then(([rows]) => {
            if (req.session.role === "USER" || req.session.role === "OFFICIAL USER" || req.session.role === "ADMIN") {
                res.render('center/setting_bookmark', {
                    users: rows,
                    bookmark: rows,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                });
            } else {
                res.render('home/404page')
            }
        });
});

// Export router
module.exports = router;