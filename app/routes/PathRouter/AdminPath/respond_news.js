var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));


router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `news` WHERE ?", [req.session.userID])
        .then(([rows]) => {
            if (req.session.role === "ADMIN") {
                res.render('admin_page/request_page', {
                    users: rows,
                    name: rows[0].name,
                    role: rows[0].role,
                    user_name: rows[0].user_name,
                    email: rows[0].email,
                    profile_image: req.session.profile_image,
                });
            } else if (rows[0].role === "USER") {
                res.render('404page')
            } else {
                res.redirect('/')
            }
        });
});
module.exports = router;