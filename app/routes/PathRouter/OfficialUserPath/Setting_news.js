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
            if (req.session.role === "OFFICIAL USER"||req.session.role === "ADMIN") {
                const Rows = rows.map(row => {
                    const date = row.time_stamp;
                    const newDate = new Date(date);
                    newDate.setHours(newDate.getHours() + 7);
                    const Rows = new Date(newDate).toISOString().substring(0, 19).replace('T', ' ');
                    return {
                        ...row,
                        formattedDate: Rows
                    };
                });
                res.render('official_user_page/setting_news', {
                    settingnews: Rows,
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