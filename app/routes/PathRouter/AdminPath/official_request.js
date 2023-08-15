var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

// router.get('/', ifNotLoggedin, (req, res, next) => {      //ตั้งชื่อเส้นทาง
//     dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
//         .then(([rows]) => {
//             if (rows[0].role === "ADMIN") {  //เมื่อได้ข้อมูลที่ลอคอินเข้ามา นำ ROW มาเปรียบเทียบเพิ่อแบ่งเส้นทางที่ถูกต้อง
//                 res.render('admin_page/request_page', {
//                     users: rows,
//                     name: rows[0].name,
//                     role: rows[0].role,
//                     user_name: rows[0].user_name,
//                     email: rows[0].email,
//                     profile_image: req.session.profile_image,
//                 });
//             } else if (rows[0].role === "USER") {
//                 res.render('404page')
//             } else {
//                 res.render('404page')
//             }
//         });
// });

router.get('/:id', ifNotLoggedin, (req, res, next) => {
    const userId = req.params.id;
    // ใช้ userId เพื่อดึงข้อมูลของผู้ใช้จากฐานข้อมูล
    dbConnection.execute("SELECT * FROM users JOIN user_request ON users.id = user_request.user_id WHERE user_id = ?;", [userId])
        .then(([rows]) => {
            // แสดงหน้าเว็บ view พร้อมข้อมูลของผู้ใช้
            res.render('admin_page/view_user', {
                users: rows,
                user_name: rows[0].user_name,
                email: rows[0].email,
                profile_image: req.session.profile_image,
            });
        })
        .catch(err => {
            console.log(err);
            res.render('404page');
        });
});

router.post('/:id', ifNotLoggedin, (req, res) => {
    const userId = req.params.id;
    dbConnection.execute("UPDATE users SET role = ?  WHERE id = ?", ["OFFICIAL USER", userId])
        .then(() => {
            return dbConnection.execute("UPDATE user_request SET request_status = ? WHERE user_id = ?", ["approve", userId]);
        })
        .then(() => {
            res.redirect('/manage_users');
            req.session.message = 'บันทึกสำเร็จ';
        })
        .catch(err => {
            console.log(err);
            res.redirect('404page');
        });
});
module.exports = router;