var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/:section_id', ifNotLoggedin, async (req, res, next) => {
    try {
        const section_id = req.params.section_id;
        const sub = await dbConnection.execute("SELECT * FROM `subscribe` WHERE subscribe.user_id = ? ", [req.session.userID]);
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        const Count_comment = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
        const CommentCounts = Count_comment[0].reduce((bcc, comment) => {
            bcc[comment.c_news_id] = comment.comment_count;
            return bcc;
        }, {});

        dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN group_section ON group_section.news_id = news.news_id LEFT JOIN section ON section.section_id = group_section.section_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE section.section_id = ? and approve_news.status_id = 2 ORDER BY news.news_id DESC", [section_id])
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
                                    res.render('center/tags', {
                                        bookmark_id: Bookmark,
                                        Profile: rows,
                                        tags: rows,
                                        header: req.session.header,
                                        name: req.session.name,
                                        role: req.session.role,
                                        user_name: req.session.user_name,
                                        email: req.session.email,
                                        profile_image: req.session.profile_image,
                                        subscribe: sub[0],
                                        like: Like[0],
                                        likeCounts: likeCounts,
                                        CommentCounts: CommentCounts,
                                        home_website:req.session.website,
                                        save_topic:req.session.save_topic,

                                    });
                                });
                        })

                } else {
                    res.render('404page')
                }
            });
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }

});
module.exports = router;