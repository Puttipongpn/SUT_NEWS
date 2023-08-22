var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const path = require('path');
const bcrypt = require('bcrypt');
const dbConnection = require('../connect');
const { body, validationResult, Result } = require('express-validator');
const { ifLoggedin } = require('./ifLoggedin');
const { ifNotLoggedin } = require('./ifNotLoggedin');
let numeral = require('numeral');
let dayjs = require('dayjs');
let dayFormat = 'DD/MM/YYYY';
//const app = express();
router.use(express.urlencoded({ extended: false }));

router.use(session({
    secret: 'sessionforprojectecommerce',
    resave: false,
    saveUninitialized: true,
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
// Middleware functions


// Root Page
router.get('/', ifNotLoggedin, (req, res, next) => {
  // Your code here
  console.log('Session expires at:', req.session.cookie.expires); // แสดงเวลาหมดอายุของเซสชันในรูปแบบ timestamp
    console.log('Session max age:', req.session.cookie.maxAge); // แสดงค่าเวลาที่เหลืออยู่ในเซสชันในรูปแบบมิลลิวินาที

    dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows) {
              res.render('home/centerpage', {
                users: rows,
                name: req.session.name,
                role: req.session.role,
                user_name: req.session.user_name,
                email: req.session.email,
                profile_image: req.session.profile_image,
            });  
            }else{
                res.render('home/centerpage', {
                name: "Guest",
                role: "Guest",
                user_name: "Guest",
                email: "Guest",
            })
            }
        });
});

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
                dbConnection.execute("INSERT INTO `users`(`role`,`name`,`email`,`password`,`gender`) VALUES(?,?,?,?,?)", ["USER", user_name, user_email, hash_pass, "no gender"])
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


// Login Route
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
  // Validation and authentication logic
], (req, res) => {
  // Your code here
  const validation_result = validationResult(req);
    const { user_pass, user_email } = req.body;
    if (validation_result.isEmpty()) {
        dbConnection.execute("SELECT * FROM `users` WHERE `email`=?", [user_email])
            .then(([rows]) => {
                bcrypt.compare(user_pass, rows[0].password).then(compare_result => {
                    if (compare_result === true) {
                        dbConnection.execute("SELECT * FROM `bookmark` WHERE users_id = ?",[rows[0].id])
                        .then(([Bookmark]) => {
                        req.session.bookmark_id = Bookmark;
                        req.session.isLoggedIn = true;
                        req.session.userID = rows[0].id;
                        req.session.name = rows[0].name; // กำหนดค่าชื่อผู้ใช้ใน session
                        req.session.user_name = rows[0].user_name;
                        req.session.email = rows[0].email;
                        req.session.role = rows[0].role; // กำหนดค่าบทบาทผู้ใช้ใน session 
                        req.session.profile_image = rows[0].profile_image;
                        res.redirect('/');
                    })}
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
// LOGOUT
router.get('/logout', (req, res) => {
    //session destroy
    req.session.destroy(),
        res.redirect('/');
});
// END OF LOGOUT

// router.use('/', (req, res) => {
//     res.render('home/404page')
// });
// Export router
module.exports = router;
