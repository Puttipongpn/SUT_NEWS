var express = require('express');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

// router.get('/', ifNotLoggedin, (req, res, next) => {
//     dbConnection.execute("SELECT * FROM users LEFT JOIN news ON users.id = news.user_id LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id WHERE users.id = ? ORDER BY news.news_id DESC;", [req.session.userID])
//         .then(([rows]) => {
//             console.log(req.session.bookmark_id)
//             if (rows.length > 0) {
//                 dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
//                     .then(([Bookmark]) => {
//                         res.render('center/profile', {
//                             bookmark_id: Bookmark,
//                             profile: rows,
//                             Profile: rows,
//                             header: req.session.header,
//                             users: rows,
//                             card_picture: rows[0].card_picture,
//                             name: rows[0].name,
//                             role: rows[0].role,
//                             user_name: rows[0].user_name,
//                             email: rows[0].email,
//                             profile_image: req.session.profile_image,
//                         });
//                     })
//             } else {
//                 res.render('404page')
//             }
//         });
// });

router.get('/', ifNotLoggedin, async (req, res, next) => {
    try {
        const sub = await dbConnection.execute("SELECT * FROM `subscribe` WHERE subscribe.user_id = ? ", [req.session.userID]);
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        const Count_comment = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
        const CommentCounts = Count_comment[0].reduce((bcc, comment) => {
            bcc[comment.c_news_id] = comment.comment_count;
            return bcc;
        }, {});
        dbConnection.execute("SELECT * FROM users LEFT JOIN news ON users.id = news.user_id LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id  WHERE users.id = ? and approve_news.status_id = 2 ORDER BY news.news_id DESC;", [req.session.userID])
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
                                    res.render('center/profile_session', {
                                        header: req.session.header,
                                        bookmark_id: Bookmark,
                                        _user_id: req.session.userID,
                                        Profile: rows,
                                        user_name:req.session.user_name,
                                        name:req.session.name,
                                        email:req.session.email,
                                        role:req.session.role,
                                        description:req.session.description,
                                        profile: rows[0],
                                        profile_image:req.session.profile_image ,
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


router.get('/:id', ifNotLoggedin, async (req, res, next) => {
    try {
        const user_id = req.params.id;
        const sub = await dbConnection.execute("SELECT * FROM `subscribe` WHERE subscribe.user_id = ? ", [req.session.userID]);
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        const Count_comment = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
        const CommentCounts = Count_comment[0].reduce((bcc, comment) => {
            bcc[comment.c_news_id] = comment.comment_count;
            return bcc;
        }, {});
        dbConnection.execute("SELECT * FROM users LEFT JOIN news ON users.id = news.user_id LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN user_request ON user_request.user_id = users.id WHERE users.id = ? and approve_news.status_id = 2 ORDER BY news.news_id DESC;", [user_id])
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
                                    res.render('center/profile', {
                                        header: req.session.header,
                                        bookmark_id: Bookmark,
                                        profile_image:req.session.profile_image,
                                        user_post_id:user_id,
                                        _user_id: req.session.userID,
                                        Profile: rows,
                                        user_name:req.session.user_name,
                                        name:req.session.name,
                                        email:req.session.email,
                                        role:req.session.role,
                                        profile: rows[0],
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
// Export router
module.exports = router;