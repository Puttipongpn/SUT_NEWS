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
        const tags = await dbConnection.execute("SELECT * FROM `save_section`LEFT JOIN section ON section.section_id = save_section.tags_id WHERE save_section.t_user_id = ? ;", [req.session.userID]);
        const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
        const Count_Like = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
            const CommentCounts = Count_Like[0].reduce((bcc, comment) => {
                bcc[comment.c_news_id] = comment.comment_count;
                return bcc;
            }, {});
        dbConnection.execute("SELECT DISTINCT news.*,users.* FROM news LEFT JOIN group_section ON group_section.news_id = news.news_id LEFT JOIN section ON section.section_id = group_section.section_id LEFT JOIN save_section ON save_section.tags_id = group_section.section_id LEFT JOIN users ON users.id = news.user_id WHERE save_section.t_user_id = ? ORDER BY news.news_id DESC;", [req.session.userID])
            .then(([rows]) => {
                if (req.session.role === "OFFICIAL USER" || req.session.role === "USER" || req.session.role === "ADMIN") {
                    dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                        .then(([Bookmark]) => {
                            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                                .then(([likeRows]) => {
                                    const likeCounts = likeRows.reduce((acc, like) => {
                                        acc[like.like_news_id] = like.like_count;
                                        return acc;
                                    }, {});
                                    res.render('center/save_tags', {
                                        bookmark_id: Bookmark,
                                        users: rows,
                                        header: req.session.header,
                                        tags: tags,
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


// Export router
module.exports = router;