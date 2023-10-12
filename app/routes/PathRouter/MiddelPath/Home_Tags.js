var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/:section_id', ifNotLoggedin, (req, res, next) => {
    const section_id = req.params.section_id;
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN group_section ON group_section.news_id = news.news_id LEFT JOIN section ON section.section_id = group_section.section_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE section.section_id = ? and approve_news.status_id = 2 ORDER BY news.news_id DESC", [section_id])
        .then(([rows]) => {
            if (rows) {
                dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                .then(([Bookmark]) => {
                    res.render('center/tags', {
                    bookmark_id:Bookmark,
                    tags: rows,
                    header:req.session.header,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                    home_website:req.session.website,
                });   
                })
                
            } else {
                console.error(error);
            }
        });
});
module.exports = router;