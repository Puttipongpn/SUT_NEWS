var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, async (req, res, next) => {
    try {
        const tags = await dbConnection.execute("SELECT * FROM `scholarship`LEFT JOIN section ON section.section_id = scholarship.sc_section_id ");
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        const Count_Like = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
            const CommentCounts = Count_Like[0].reduce((bcc, comment) => {
                bcc[comment.c_news_id] = comment.comment_count;
                return bcc;
            }, {});
        dbConnection.execute("SELECT DISTINCT news.*,users.* FROM news LEFT JOIN group_section ON group_section.news_id = news.news_id LEFT JOIN section ON section.section_id = group_section.section_id LEFT JOIN scholarship ON scholarship.sc_section_id = group_section.section_id LEFT JOIN users ON users.id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE scholarship.sc_section_id = group_section.section_id AND approve_news.status_id = 2  ORDER BY news.news_id DESC;")
            .then(([rows]) => {
                if (rows) {
                    dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                        .then(([Bookmark]) => {
                            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                                .then(([likeRows]) => {
                                    const likeCounts = likeRows.reduce((acc, like) => {
                                        acc[like.like_news_id] = like.like_count;
                                        return acc;
                                    }, {});
                                    res.render('home/scholarship', {
                                        bookmark_id: Bookmark,
                                        users: rows,
                                        header: req.session.header,
                                        tags: tags[0],
                                        bookmark: rows,
                                        name: req.session.name,
                                        role: req.session.role,
                                        user_name: req.session.user_name,
                                        email: req.session.email,
                                        profile_image: req.session.profile_image,
                                        like: Like[0],
                                        likeCounts: likeCounts,
                                        CommentCounts: CommentCounts,
                                        home_website:req.session.website,
                                        save_topic:req.session.save_topic,
                                        home_website:req.session.website,
                                        save_topic:req.session.save_topic,

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






router.get('/scholarship_add', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `scholarship`LEFT JOIN section ON section.section_id = scholarship.sc_section_id  ;")
        .then(([rows]) => {
            if (rows) {
                res.render('admin_page/scholarship_add', {
                    tags: rows,
                    header: req.session.header,
                    profile_image:req.session.profile_image,
                    home_website:req.session.website,
                    save_topic:req.session.save_topic,
                });
            } else if (rows[0].role === "USER" || rows[0].role === "ADMIN") {
                res.render('404page');
            }
            else {
                res.render('404page', {
                    name: 'PLEASE LOGIN',
                    role: 'GUEST'
                })
            }
        });
});

router.get('/tags', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM section LEFT JOIN users ON users.id = section_user_id WHERE users.role = 'ADMIN'")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.post('/scholarship_save_tags/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        sc_section_id: req.params.id,
    };
    dbConnection.query("INSERT INTO scholarship SET ?", [newsDataWithUserId])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});


// สร้างเส้นทาง DELETE สำหรับลบ section
router.delete('/scholarship_delete_tags/:id', ifNotLoggedin, (req, res, next) => {

    const tags_id = req.params.id // แก้ไขตรงนี้
    
    dbConnection.query("DELETE FROM `scholarship` WHERE scholarship_id  = ?", [tags_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});


module.exports = router;