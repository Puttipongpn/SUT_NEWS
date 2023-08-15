var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));
router.get('/', ifNotLoggedin, (req, res, next) => {
    const message = req.session.message;
    req.session.message = undefined;
    dbConnection.execute("SELECT * FROM users LEFT JOIN user_request ON users.id = user_request.user_id WHERE user_request.request_status = 'waiting for approval';")
        .then(([rows]) => {
            console.log(req.session.role)
            const isAdmin = req.session.role === "ADMIN";
            if (isAdmin) {
                res.render('admin_page/manage_account', {
                    users: rows,
                    name: req.session.name,
                    role: req.session.role,
                    profile_image: req.session.profile_image,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    message: message  // เพิ่ม message ในข้อมูลที่ส่งไปยังหน้า view
                });
            } else {
                res.render('404page');
            }
        })
        .catch(err => {
            console.log(err);
            res.render('404page');
        });
});
module.exports = router;