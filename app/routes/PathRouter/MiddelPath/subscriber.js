var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', async (req, res) => {
    try {
        // ดึงข้อมูลจากฐานข้อมูล
        user_id = req.session.userID
        news = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN subscribe ON subscribe.sub_user_id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND subscribe.user_id = ? ORDER BY news.news_id DESC;",[user_id]);
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        const Count_comment = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
        const CommentCounts = Count_comment[0].reduce((bcc, comment) => {
            bcc[comment.c_news_id] = comment.comment_count;
            return bcc;
        }, {});
        dbConnection.execute("SELECT * FROM `subscribe` LEFT JOIN users ON subscribe.sub_user_id = users.id WHERE user_id = ?", [user_id])
            .then(([rows]) => {
                dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                        .then(([Bookmark]) => {
                            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                                .then(([likeRows]) => {
                                    const likeCounts = likeRows.reduce((acc, like) => {
                                        acc[like.like_news_id] = like.like_count;
                                        console.log(acc)
                                        return acc;
                                    }, {});
                                    res.render('center/subscriber', {
                                        news : news[0],
                                        bookmark_id: Bookmark,
                                        subHome: rows,
                                        header: req.session.header,
                                        like: Like[0],
                                        likeCounts: likeCounts,
                                        CommentCounts: CommentCounts
                                    });
                                });
                        })
            })
            .catch(err => {
                console.error(err);
                res.status(500).json({ error: 'Internal Server Error' });
            });
    } catch (error) {

    }
});

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        sub_user_id: req.params.id,
        user_id: req.session.userID
    };
    dbConnection.query("INSERT INTO `subscribe` SET ?", [newsDataWithUserId])
        .then(([rows]) => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.delete('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        sub_user_id: req.params.id,
        user_id: req.session.userID
    };
    dbConnection.query("DELETE FROM `subscribe` WHERE `sub_user_id` = ? AND `user_id` = ?; ", [newsDataWithUserId.sub_user_id, newsDataWithUserId.user_id])
        .then(([rows]) => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});


module.exports = router;