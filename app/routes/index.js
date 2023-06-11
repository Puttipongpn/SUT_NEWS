const express = require('express');
const app = express.Router();
//let conn = require('./connect')
const path = require('path');
const cookieSession = require('cookie-session');
const bcrypt = require('bcrypt');
const dbConnection = require('./connect');
const { body, validationResult, Result } = require('express-validator');

//const app = express();
app.use(express.urlencoded({ extended: false }));
// SET OUR VIEWS AND VIEW ENGINE
//  app.set('views', path.join(__dirname,'views'));
//  app.set('view engine','ejs');

/* GET home page. */

// router.get('/login', function (req, res, next) {
//   res.render('login', { title: 'Express' });
// });

// router.get('/login2', function (req, res, next) {
//   res.render('login2', { title: 'Express' });
// });

// router.get('/', function (req, res, next) {
//   res.render('home/centerpage', { title: 'Express' });
// });

// router.get('/adminpage', function (req, res, next) {
//   res.render('home/adminpage', { title: 'Express' });
// });

// app.set('views', path.join(__dirname, 'views'));
// app.set('view engine', 'ejs');

// APPLY COOKIE SESSION MIDDLEWARE
app.use(cookieSession({     //เป็นการตั้งอายุของการล็อคอิน ซึ่งจะหมดอายุภายใน 1 ชม. แล้วต้อง login ใหม่
    name: 'session',
    keys: ['key1', 'key2'],
    maxAge: 3600 * 1000 // 1hr
}));

// DECLARING CUSTOM MIDDLEWARE
const ifNotLoggedin = (req, res, next) => {
    if (!req.session.isLoggedIn) {
        return res.render('login2');
    }
    next();
}
const ifLoggedin = (req, res, next) => {
    if (req.session.isLoggedIn) {
        return res.redirect('home/centerpage');
    }
    next();
}
// END OF CUSTOM MIDDLEWARE
// ROOT PAGE
app.get('/', ifNotLoggedin, (req, res, next) => {
    //req.session = null;
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            res.render('home/centerpage', {
                name: rows[0].name,
                row: rows[0].row,
            });
        });

});
//GUEST-----------------------------------------------------------------------------------
app.get('/guest', function (req, res, next) {
    res.render('home/guest', { title: 'Express' });
});
app.get('/guest_page1', function (req, res, next) {
    res.render('home/page1', { title: 'Express' });
});
//GUEST-----------------------------------------------------------------------------------
//USER---------------------------------------------------------------------------------------

app.get('/user', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "USER") {
                res.render('home/centerpage', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            }else if (rows[0].row === "ADMIN") {
                res.status(404).send('<h1>404 Page Not Found!</h1>');
            }else{
                res.render('plelog')
            }
        });

});
app.get('/bookmake', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "USER") {
                res.render('user_page/bookmake', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            } else if (rows[0].row === "ADMIN") {
                res.status(404).send('<h1>404 Page Not Found!</h1>');
            }
            else {
                res.render('plelog')
            }
        });

});
//USER---------------------------------------------------------------------------------------
//ADMIN--------------------------------------------------------------------------------------
app.get('/admin', ifNotLoggedin, (req, res, next) => {      //ตั้งชื่อเส้นทาง
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "ADMIN") {  //เมื่อได้ข้อมูลที่ลอคอินเข้ามา นำ ROW มาเปรียบเทียบเพิ่อแบ่งเส้นทางที่ถูกต้อง
                res.render('home/adminpage', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            }else if (rows[0].row === "USER") {
                res.status(404).send('<h1>404 Page Not Found!</h1>');
            }else {
                res.render('plelog')
            }
        });
});

app.get('/empower', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "ADMIN") {
                res.render('admin_page/empower', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            }else if (rows[0].row === "USER") {
                res.status(404).send('<h1>404 Page Not Found!</h1>');
            }else {
                res.render('plelog')
            }
        });
});
//ADMIN--------------------------------------------------------------------------------------------

// REGISTER PAGE
app.post('/register', ifLoggedin,
    // post data validation(using express-validator)
    [
        body('user_email', 'Invalid email address!').isEmail().custom((value) => {
            return dbConnection.execute('SELECT `email` FROM `users` WHERE `email`=?', [value])
                .then(([rows]) => {
                    if (rows.length > 0) {
                        return Promise.reject('This E-mail already in use!');
                    }
                    return true;
                });
        }),
        body('user_name', 'Username is Empty!').trim().not().isEmpty(),
        body('user_pass', 'The password must be of minimum length 6 characters').trim().isLength({ min: 6 }),
    ],// end of post data validation
    (req, res, next) => {

        const validation_result = validationResult(req);
        const { user_name, user_pass, user_email } = req.body;

        // IF validation_result HAS NO ERROR
        if (validation_result.isEmpty()) {
            // password encryption (using bcryptjs)
            bcrypt.hash(user_pass, 12).then((hash_pass) => {
                // INSERTING USER INTO DATABASE
                dbConnection.execute("INSERT INTO `users`(`row`,`name`,`email`,`password`) VALUES(?,?,?,?)", ["USER", user_name, user_email, hash_pass])
                    .then(result => {
                        res.send(`your account has been created successfully, Now you can <a href="/">Login</a>`);
                    }).catch(err => {
                        // THROW INSERTING USER ERROR'S
                        if (err) throw err;
                    });
            })
                .catch(err => {
                    // THROW HASING ERROR'S
                    if (err) throw err;
                })
        }
        else {
            // COLLECT ALL THE VALIDATION ERRORS
            let allErrors = validation_result.errors.map((error) => {
                return error.msg;
            });
            // REDERING login-register PAGE WITH VALIDATION ERRORS
            res.render('login2', {
                register_error: allErrors,
                old_data: req.body
            });
        }
    });// END OF REGISTER PAGE


// LOGIN PAGE
app.post('/', ifLoggedin, [
    body('user_email').custom((value) => {
        return dbConnection.execute('SELECT email FROM users WHERE email=?', [value])  //ค้นหาจาก DB ว่ามี Email นี้จริงใหม
            .then(([rows]) => {
                if (rows.length == 1) {     //ถ้ามีส่ง TURE
                    return true;
                }
                return Promise.reject('Invalid Email Address!');    //ไม่มีแจ้ง ERROR

            });
    }),
    body('user_pass', 'Password is empty!').trim().not().isEmpty(), //ตรวจสอบ Password ที่รับเข้ามาถูกฟอร์แมทหรือไม่ เป็นค่าว่างไหม
], (req, res) => {
    const validation_result = validationResult(req);    
    const { user_pass, user_email } = req.body;
    if (validation_result.isEmpty()) {
        dbConnection.execute("SELECT * FROM `users` WHERE `email`=?", [user_email]) 
            .then(([rows]) => {
                bcrypt.compare(user_pass, rows[0].password).then(compare_result => {    //นำ Password ที่รับเข้ามา เทียบกับ Password ใน DB ที่ตำแหน่ง Email เดียวกัน เก็บค่าใน compare_result
                    if (compare_result === true) {  //ถ้าเป็นจริง เก็บตัวแปลต่างๆลง session
                        req.session.isLoggedIn = true;
                        req.session.userID = rows[0].id;
                        req.session.row = rows[0].row;
                        let user_row = rows[0].row  //เก็บตัวแปล row แยก เพื่อนำไปใช้ในการแบ่ง part เส้นทางหน้าเพจ
                        console.log(rows[0].row);   //ตรวจสอบ
                        if (user_row === "USER") {      //ตรวจสอบ row ของผู้ login ถ้าเป็น USER ให้สั่งรันหน้าเฉพาะของ USER
                            res.redirect('/user');
                            // res.redirect('/bookmake');
                        } else if (user_row === "ADMIN") {
                            res.redirect('/admin');
                            //console.log("ADMIN");
                        }
                    }
                    else {                 //ถ้า Password ที่รับเข้ามาไม่ถูกต้องให้แจ้ง error
                        res.render('login2', {
                            login_errors: ['Invalid Password!']
                        });
                    }
                })
                    .catch(err => {     //ดักจับ error
                        if (err) throw err;
                    });


            }).catch(err => { //ดักจับ error
                if (err) throw err;
            });
    }
    else {
        let allErrors = validation_result.errors.map((error) => {   
            return error.msg;
        });
        // REDERING login PAGE WITH LOGIN VALIDATION ERRORS
        res.render('login2', {
            login_errors: allErrors
        });
    }
});
// END OF LOGIN PAGE

// LOGOUT
app.get('/logout', (req, res) => {
    //session destroy
    req.session = null;     //ล้างค่า session ที่เก็บค่าชื่อผู้เข้าใช้งาน
    res.redirect('/');
});
// END OF LOGOUT

app.use('/', (req, res) => {
    res.status(404).send('<h1>404 Page Not Found!</h1>');
});

module.exports = app;

