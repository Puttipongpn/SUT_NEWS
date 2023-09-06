var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM news LEFT JOIN approve_news ON news.news_id = approve_news.news_id WHERE user_id = ?", [req.session.userID])
        .then(([rows]) => {
            if (req.session.role === "OFFICIAL USER") {
                res.render('official_user_page/setting_news', {
                    settingnews: rows,
                    header:req.session.header,
                    users: req.session,
                    description: req.session.description,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                });
            } else if (req.session.role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });
});
module.exports = router;