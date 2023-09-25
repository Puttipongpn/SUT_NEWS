var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/:topic_id', ifNotLoggedin, (req, res, next) => {
    const topic_id = req.params.topic_id;
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN group_section ON group_section.news_id = news.news_id LEFT JOIN section ON section.section_id = group_section.section_id WHERE  news.topic_id = ? ORDER BY news.news_id DESC", [topic_id])
        .then(([rows]) => {
            if (rows) {
                dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID])
                .then(([Bookmark]) => {
                    res.render('center/Home_topic', {
                    bookmark_id:Bookmark,
                    topic: rows,
                    header:req.session.header,
                    
                });   
                })
                
            } else {
                console.error(error);
            }
        });
});
module.exports = router;