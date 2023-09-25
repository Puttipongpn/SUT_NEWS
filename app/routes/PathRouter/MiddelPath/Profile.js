var express = require('express');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN news ON users.id = news.user_id LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id WHERE users.id = ?;", [req.session.userID])
        .then(([rows]) => {
            console.log(req.session.bookmark_id)
            if (rows.length > 0) {
                dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                    .then(([Bookmark]) => {
                        res.render('center/profile', {
                            bookmark_id: Bookmark,
                            profile: rows,
                            Profile: rows,
                            header: req.session.header,
                            users: rows,
                            card_picture: rows[0].card_picture,
                            name: rows[0].name,
                            role: rows[0].role,
                            user_name: rows[0].user_name,
                            email: rows[0].email,
                            profile_image: req.session.profile_image,
                        });
                    })
            } else {
                res.render('404page')
            }
        });
});

router.get('/:id', ifNotLoggedin, async (req, res, next) => {
    try {
        const user_id = req.params.id;
        const sub = await dbConnection.execute("SELECT * FROM `subscribe` WHERE subscribe.user_id = ?", [req.session.userID]);
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        dbConnection.execute("SELECT * FROM users LEFT JOIN news ON users.id = news.user_id LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE users.id = ? and approve_news.status_id = 2;", [user_id])
            .then(([rows]) => {
                if (rows.length > 0) {
                    dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                        .then(([Bookmark]) => {
                            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                                .then(([likeRows]) => {
                                    const likeCounts = likeRows.reduce((acc, like) => {
                                        acc[like.like_news_id] = like.like_count;
                                        console.log(acc)
                                        return acc;
                                    }, {});
                                    res.render('center/profile', {
                                        header: req.session.header,
                                        bookmark_id: Bookmark,
                                        _user_id: req.session.userID,
                                        Profile: rows,
                                        profile: rows[0],
                                        card_picture: rows[0].card_picture,
                                        newsname: rows[0].name,
                                        newsrole: rows[0].role,
                                        newsuser_name: rows[0].user_name,
                                        newsemail: rows[0].email,
                                        newsprofile_image: rows[0].profile_image,
                                        subscribe: sub[0],
                                        like: Like[0],
                                        likeCounts: likeCounts
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