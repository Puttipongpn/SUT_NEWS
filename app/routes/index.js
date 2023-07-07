const express = require('express');
const app = express.Router();
//let conn = require('./connect')
const path = require('path');
const cookieSession = require('cookie-session');
const bcrypt = require('bcrypt');
const dbConnection = require('./connect');
const { body, validationResult, Result } = require('express-validator');
//const session = require('express-session');

//const app = express();
app.use(express.urlencoded({ extended: false }));

app.get('/centerpage', function (req, res, next) {
    res.render('home/centerpage', {
        name: 'PLEASE LOGIN',
        row: 'GUEST'
    });
});

app.get('/page1', function (req, res, next) {
    res.render('home/page1');
});

// APPLY COOKIE SESSION MIDDLEWARE
app.use(cookieSession({
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
    dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            res.render('home/centerpage', {
                name: rows[0].name,
                row: rows[0].row
            });
        });

});// END OF ROOT PAGE


//USER---------------------------------------------------------------------------------------

app.get('/setting_profile', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "USER") {
                res.render('user_page/setting_profile', {
                    users:rows,
                    name: rows[0].name,
                    row: rows[0].row,
                });
            } else if (rows[0].row === "ADMIN") {
                res.render('404page')
            } else {
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
                res.render('404page')
            }
            else {
                res.render('plelog')
            }
        });

});

app.get('/page1', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0]) {
                res.render('home/page1', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            }else {
                req.session.isLoggedIn === true;
                res.render('home/page1',{
                    name: 'PLEASE LOGIN',
                    row: 'GUEST'
                })
            }
        });
});
//USER---------------------------------------------------------------------------------------

//ADMIN--------------------------------------------------------------------------------------
app.get('/request', ifNotLoggedin, (req, res, next) => {      //ตั้งชื่อเส้นทาง
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "ADMIN") {  //เมื่อได้ข้อมูลที่ลอคอินเข้ามา นำ ROW มาเปรียบเทียบเพิ่อแบ่งเส้นทางที่ถูกต้อง
                res.render('admin_page/request_page', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            } else if (rows[0].row === "USER") {
                res.render('404page')
            } else {
                res.render('plelog')
            }
        });
});

app.get('/setting', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`row` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "ADMIN") {
                res.render('admin_page/setting_page', {
                    name: rows[0].name,
                    row: rows[0].row,
                });
            } else if (rows[0].row === "USER") {
                res.render('404page')
            } else {
                res.render('plelog')
            }
        });
});

app.get('/manage_users', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users ORDER BY id", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].row === "ADMIN") {
                res.render('admin_page/manage_account', {
                    users:rows,
                    name: rows[0].name,
                    row: rows[0].row,
                });
            } else if (rows[0].row === "USER") {
                res.render('404page')
            } else {
                res.render('plelog')
            }
        });
});

app.get('/view_user/:id', ifNotLoggedin, (req, res, next) => {
    const userId = req.params.id;

    // ใช้ userId เพื่อดึงข้อมูลของผู้ใช้จากฐานข้อมูล
    dbConnection.execute("SELECT * FROM users WHERE id = ?", [userId])
        .then(([rows]) => {
            // แสดงหน้าเว็บ view พร้อมข้อมูลของผู้ใช้
            res.render('admin_page/view_user', {
                users:rows,
                user: rows[0],
                name: rows[0].name
            });
        })
        .catch(err => {
            console.log(err);
            res.render('404page');
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
        return dbConnection.execute('SELECT email FROM users WHERE email=?', [value])
            .then(([rows]) => {
                if (rows.length == 1) {
                    return true;

                }
                return Promise.reject('Invalid Email Address!');

            });
    }),
    body('user_pass', 'Password is empty!').trim().not().isEmpty(),
], (req, res) => {
    const validation_result = validationResult(req);
    const { user_pass, user_email } = req.body;
    if (validation_result.isEmpty()) {

        dbConnection.execute("SELECT * FROM `users` WHERE `email`=?", [user_email])
            .then(([rows]) => {
                bcrypt.compare(user_pass, rows[0].password).then(compare_result => {
                    if (compare_result === true) {
                        req.session.isLoggedIn = true;
                        req.session.userID = rows[0].id;

                        res.redirect('/');
                    }
                    else {
                        res.render('login2', {
                            login_errors: ['Invalid Password!']
                        });
                    }
                })
                    .catch(err => {
                        if (err) throw err;
                    });


            }).catch(err => {
                if (err) throw err;
            });
    }
    else {
        let allErrors = validation_result.errors.map((error) => {
            return error.msg;
        });
        // REDERING login-register PAGE WITH LOGIN VALIDATION ERRORS
        res.render('login2', {
            login_errors: allErrors
        });
    }
});
// END OF LOGIN PAGE

// LOGOUT
app.get('/logout', (req, res) => {
    //session destroy
    req.session = null;
    res.redirect('/');
});
// END OF LOGOUT

app.use('/', (req, res) => {
    res.render('404page')
});

module.exports = app;

