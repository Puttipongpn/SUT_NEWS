var express = require('express');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN news ON users.id = news.user_id LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id WHERE users.id = ?;", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER" || rows[0].role === "OFFICIAL USER" || rows[0].role === "ADMIN") {
                res.render('center/profile', {
                    profile: rows,
                    users: rows,
                    card_picture: rows[0].card_picture,
                    name: rows[0].name,
                    role: rows[0].role,
                    user_name: rows[0].user_name,
                    email: rows[0].email,
                    profile_image: req.session.profile_image,
                });
            } else {
                res.render('404page')
            }
        });
});
// Export router
module.exports = router;