var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN user_request ON users.id = user_request.user_id WHERE users.id = ?;", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER") {
                res.render('user_page/request_official', {
                    users: rows,
                    name: rows[0].name,
                    role: rows[0].role,
                    header:req.session.header,
                    user_name: rows[0].user_name,
                    email: rows[0].email,
                    profile_image: req.session.profile_image,
                    save_topic:req.session.save_topic,

                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            } else {
                res.redirect('/')
            }
        });
});
router.post('/:id', ifNotLoggedin, (req, res) => {
    let params = { ...req.body, user_id: req.params.id };
    dbConnection.query("INSERT INTO user_request SET ?", [params])
        .then(() => {
            res.redirect('/setting_profile');
            req.session.message = 'บันทึกสำเร็จ';
        })
        .catch(err => {
            console.log(err);
            res.redirect('404page');
        });
});
module.exports = router;