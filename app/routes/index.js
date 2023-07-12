var express = require('express');
const router = express.Router();
//let conn = require('./connect')
const path = require('path');
const cookieSession = require('cookie-session');
const bcrypt = require('bcrypt');
const dbConnection = require('./connect');
const { body, validationResult, Result } = require('express-validator');
const session = require('express-session');
let numeral = require('numeral');
let dayjs = require('dayjs');
let dayFormat = 'DD/MM/YYYY';

//const app = express();
router.use(express.urlencoded({ extended: false }));

router.get('/centerpage', function (req, res, next) {
    res.render('home/centerpage', {
        name: 'PLEASE LOGIN',
        role: 'GUEST'
    });
});

router.get('/page1', function (req, res, next) {
    res.render('home/page1');
});



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

// APPLY SESSION MIDDLEWARE
// // APPLY COOKIE SESSION MIDDLEWARE
router.use(session({
    secret: 'sessionforprojectecommerce',
    resave: false,
    saveUninitialized: false,
    cookie: {
        maxAge: 30 * 24 * 60 * 60 * 1000
    }
}))
router.use((req, res, next) => {
    res.locals.session = req.session;
    res.locals.numeral = numeral;
    res.locals.dayjs = dayjs;
    res.locals.dayFormat = dayFormat;
    next();
});

// ROOT PAGE
router.get('/', ifNotLoggedin, (req, res, next) => {
    console.log('Session expires at:', req.session.cookie.expires); // แสดงเวลาหมดอายุของเซสชันในรูปแบบ timestamp
    console.log('Session max age:', req.session.cookie.maxAge); // แสดงค่าเวลาที่เหลืออยู่ในเซสชันในรูปแบบมิลลิวินาที

    dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            res.render('home/centerpage', {
                name: rows[0].name,
                role: rows[0].role
            });
        });

});// END OF ROOT PAGE


//USER---------------------------------------------------------------------------------------

router.get('/setting_profile', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER" || rows[0].role === "OFFICIAL USER" || rows[0].role === "ADMIN") {
                res.render('user_page/setting_profile', {
                    users: rows,
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else {
                res.redirect('/')
            }
        });
});

// router.get('/request_official', ifNotLoggedin, (req, res) => {
//     res.render('user_page/request_official', {users: {}});
//   }) 

router.get('/request_official', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN user_request ON users.id = user_request.user_id WHERE users.id = ?;", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER") {
                res.render('user_page/request_official', {
                    users: rows,
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            } else {
                res.redirect('/')
            }
        });
});

// router.post('/addrequest_official/:id', ifNotLoggedin, (req, res) => {
//     let sql = 'INSERT INTO user_request SET ?';
//     let params = { ...req.body, user_id: req.params.id }; //เพื่อรวมข้อมูลที่มาจาก req.body และเพิ่ม user_id จาก req.params.id เข้าไปในพารามิเตอร์ params
//     dbConnection.query(sql, params, (err, result) => {
//       if (err) throw err;
//       res.redirect('/setting_profile');
//     })
//   })

router.post('/addrequest_official/:id', ifNotLoggedin, (req, res) => {
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

// UPDATE `users` SET `id`='[value-1]',`role`='[value-2]',`user_name`='[value-3]',`name`='[value-4]',`email`='[value-5]',`password`='[value-6]',`user_request`='[value-7]' WHERE 1
router.post('/update_profile/:id', ifNotLoggedin, (req, res) => {
    const userId = req.params.id;
    const user_name = req.body['user_name'] || req.session.user_name;
    const name = req.body['name'] || req.session.name;
    const email = req.body['email'] || req.session.email;
    const gender = req.body['gender'] || req.session.gender;
    dbConnection.execute("UPDATE users SET user_name= ?,name= ? ,email= ? ,gender= ? WHERE id = ?", [user_name, name, email, gender, userId])
        .then(() => {
            res.redirect('/setting_profile');
            req.session.message = 'บันทึกสำเร็จ';
        })
        .catch(err => {
            console.log(err);
            res.redirect('404page');
        });
});

//SELECT * FROM bookmark LEFT JOIN news_type ON bookmark.news_id = news_type.news_type_id WHERE bookmark.users_id = ?
router.get('/bookmake', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN bookmark ON users.id = bookmark.users_id LEFT JOIN news ON bookmark.news_id = news.news_id  LEFT JOIN news_type ON bookmark.news_id = news_type.news_type_id  LEFT JOIN topic ON bookmark.news_id = topic.topic_id WHERE bookmark.users_id = ?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER") {
                res.render('user_page/bookmake', {
                    bookmark: rows,
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });
});


router.get('/addnews', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "OFFICIAL USER") {
                res.render('user_page/add_news', {
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });

});

router.get('/setting_bookmark', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users LEFT JOIN bookmark ON users.id = bookmark.users_id LEFT JOIN news ON bookmark.news_id = news.news_id  LEFT JOIN news_type ON bookmark.news_id = news_type.news_type_id  LEFT JOIN topic ON bookmark.news_id = topic.topic_id WHERE bookmark.users_id = ?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER") {
                res.render('user_page/setting_bookmark', {
                    bookmark: rows,
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });

});

router.get('/topic', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER") {
                res.render('user_page/topic', {
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });
});

router.get('/news_doom', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER") {
                res.render('user_page/news_doom', {
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });
});

router.get('/page1', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0]) {
                res.render('home/page1', {
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else {
                req.session.isLoggedIn === true;
                res.render('home/page1', {
                    name: 'PLEASE LOGIN',
                    role: 'GUEST'
                })
            }
        });
});
//USER---------------------------------------------------------------------------------------

//ADMIN--------------------------------------------------------------------------------------
router.get('/request', ifNotLoggedin, (req, res, next) => {      //ตั้งชื่อเส้นทาง
    dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "ADMIN") {  //เมื่อได้ข้อมูลที่ลอคอินเข้ามา นำ ROW มาเปรียบเทียบเพิ่อแบ่งเส้นทางที่ถูกต้อง
                res.render('admin_page/request_page', {
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "USER") {
                res.render('404page')
            } else {
                res.render('404page')
            }
        });
});
//SELECT * FROM users ORDER BY CASE WHEN user_request = 'request' THEN 0 ELSE 1 END, id; sql ที่โชว์ตารางทุกคน


router.get('/setting', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "ADMIN") {
                res.render('admin_page/setting_page', {
                    name: rows[0].name,
                    role: rows[0].role,
                });
            } else if (rows[0].role === "USER") {
                res.render('404page')
            } else {
                res.render('404page')
            }
        });
});

router.get('/manage_users', ifNotLoggedin, (req, res, next) => {
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


router.get('/view_user/:id', ifNotLoggedin, (req, res, next) => {
    const userId = req.params.id;
    // ใช้ userId เพื่อดึงข้อมูลของผู้ใช้จากฐานข้อมูล
    dbConnection.execute("SELECT * FROM users JOIN user_request ON users.id = user_request.user_id WHERE user_id = ?;", [userId])
        .then(([rows]) => {
            // แสดงหน้าเว็บ view พร้อมข้อมูลของผู้ใช้
            res.render('admin_page/view_user', {
                users: rows,
            });
        })
        .catch(err => {
            console.log(err);
            res.render('404page');
        });
});

router.post('/update_user/:id', ifNotLoggedin, (req, res) => {
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



//ADMIN--------------------------------------------------------------------------------------------

// REGISTER PAGE
router.post('/register', ifLoggedin,
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
                dbConnection.execute("INSERT INTO `users`(`role`,`name`,`email`,`password`,`gender`) VALUES(?,?,?,?)", ["USER", user_name, user_email, hash_pass, "no gender"])
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
router.post('/', ifLoggedin, [
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
                        req.session.name = rows[0].name; // กำหนดค่าชื่อผู้ใช้ใน session
                        req.session.user_name = rows[0].user_name;
                        req.session.email = rows[0].email;
                        req.session.role = rows[0].role; // กำหนดค่าบทบาทผู้ใช้ใน session 
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
router.get('/logout', (req, res) => {
    //session destroy
    req.session.destroy(),
        res.redirect('/');
});
// END OF LOGOUT

router.use('/', (req, res) => {
    res.render('404page')
});

module.exports = router;

