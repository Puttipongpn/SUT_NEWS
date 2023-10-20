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

router.get('/', ifNotLoggedin, async (req, res, next) => {
    try {
        console.log('Session expires at:', req.session.cookie.expires);
        console.log('Session max age:', req.session.cookie.maxAge);

        // ดึงข้อมูลจาก SQL และดึงข้อมูลการ์ด
        const rows = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 ORDER BY news.news_id DESC");
        // ทำคำสั่ง SQL ดึงข้อมูลสไลด์บาร์ข่าวหลัก
        const top_slidebar = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND approve_news.location_post_id = 1 ORDER BY news.news_id DESC");

        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม 
        //const attention = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND ( news.end IS NULL OR news.end < DATE_SUB(NOW(), INTERVAL 7 DAY)) ORDER BY news.view_count DESC LIMIT 10 ");
        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม หรือข่าวที่ไม่ได้ใส่วันสิ้นสุดกิจกรรม จะหายไปเมื่อครบ 7 วัน
        const attention = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND (news.end IS NULL OR(news.end > DATE_SUB(NOW(), INTERVAL 7 DAY) AND news.time_stamp > DATE_SUB(NOW(), INTERVAL 7 DAY)))ORDER BY news.view_count DESC LIMIT 10");

        if (req.session.role == "ADMIN" || req.session.role == "USER" || req.session.role == "OFFICIAL USER" || req.session.role == "GUEST") {
            const Bookmark = await dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID]);
            const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
            const Count_Like = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
            const save_topic = await dbConnection.execute("SELECT * FROM `save_topic` LEFT JOIN topic ON topic.topic_id = save_topic.s_topic_id");
            const tags = await dbConnection.execute("SELECT * FROM `section`");
            const CommentCounts = Count_Like[0].reduce((bcc, comment) => {
                bcc[comment.c_news_id] = comment.comment_count;
                return bcc;
            }, {});
            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                .then(([likeRows]) => {
                    const likeCounts = likeRows.reduce((acc, like) => {
                        acc[like.like_news_id] = like.like_count;
                        return acc;
                    }, {});

                    req.session.save_topic=save_topic[0];
                    
                    // ส่งข้อมูลจำนวนการกดไลค์ไปยัง template
                    res.render('home/centerpage', {
                        // อื่น ๆ ของข่าว...
                        save_topic:req.session.save_topic,
                        bookmark_id: Bookmark[0],
                        like: Like[0],
                        center: rows,
                        Center: rows[0],
                        attention:attention[0],
                        Top_slidebar: top_slidebar,
                        top_slidebar: top_slidebar[0],
                        role:req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        likeCounts: likeCounts,
                        CommentCounts:CommentCounts,
                        home_website:req.session.website,
                        tags: tags[0]
                    });
                })
        } else {
            const [rows] = await dbConnection.execute("SELECT * FROM news LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN users ON users.id = news.user_id ;");
            res.render('home/centerpage', {
                
                center: rows,
                name: "Guest",
                role: "Guest",
                user_name: "Guest",
                email: "Guest",
            });
        }
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
});

// เส้นทางสำหรับเข้าสู่ระบบเป็นผู้เยี่ยมชม (Guest)
// router.get('/login-as-guest', async (req, res, next) => {
//     try {
//         const guestData = {
//             id: 5,
//             role: 'OFFICIAL USER',
//             user_name: "P'Cream Sudarat",
//             name: 'Cream',
//             email: 'c@gmail.com',
//             gender: 'female',
//             password: '$2b$12$d5G7emhWbrTzJtpbBTdtVOqEZ1IaQez1FgxCqwCWHchUizaFsBqy6',
//             profile_image: 'public\\images\\users_picture\\205551038_516695639758007_8769628568148858641_n.jpg'
//         };
//         req.session.header = guestData;
//         req.session.isLoggedIn = true;

//         res.render('home/centerpage', {
//             header:  req.session.header,
//             profile_image:guestData.profile_image,
//         });
//     } catch (error) {
//         // จัดการข้อผิดพลาดที่เกิดขึ้น
//         console.error(error);
//         res.status(500).send("Internal Server Error");
//     }
// });





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
        dbConnection.execute("SELECT * FROM `users` LEFT JOIN user_request ON user_request.user_id = users.id WHERE `email`=?", [user_email])
            .then(([rows]) => {
                bcrypt.compare(user_pass, rows[0].password).then(compare_result => {
                    if (compare_result === true) {
                        dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [rows[0].id])
                            .then(([Bookmark]) => {
                                dbConnection.execute("SELECT * FROM `website`")
                                .then(([website]) => {
                                req.session.bookmark_id = Bookmark;
                                req.session.isLoggedIn = true;
                                req.session.header = rows[0];
                                req.session.userID = rows[0].id;
                                req.session.name = rows[0].name; // กำหนดค่าชื่อผู้ใช้ใน session
                                req.session.user_name = rows[0].user_name;
                                req.session.email = rows[0].email;
                                req.session.description = rows[0].description;
                                req.session.role = rows[0].role; // กำหนดค่าบทบาทผู้ใช้ใน session 
                                req.session.profile_image = rows[0].profile_image;
                                req.session.website = website[0];
                                res.redirect('/'); 
                                })
                            })
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


// Login Route

router.post('/login-as-guest', ifLoggedin, (req, res) => {
    // Your code here
    const validation_result = validationResult(req);
    const user_pass = "123456";
    const user_email = "guest2";
    //const { user_pass, user_email } = req.body;
    if (validation_result.isEmpty()) {
        dbConnection.execute("SELECT * FROM `users` LEFT JOIN user_request ON user_request.user_id = users.id WHERE `email`=?", [user_email])
            .then(([rows]) => {
                bcrypt.compare(user_pass, rows[0].password).then(compare_result => {
                    if (compare_result === true) {
                        dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [rows[0].id])
                            .then(([Bookmark]) => {
                                dbConnection.execute("SELECT * FROM `website`")
                                .then(([website]) => {
                                req.session.bookmark_id = Bookmark;
                                req.session.isLoggedIn = true;
                                req.session.header = rows[0];
                                req.session.userID = rows[0].id;
                                req.session.name = rows[0].name; // กำหนดค่าชื่อผู้ใช้ใน session
                                req.session.user_name = rows[0].user_name;
                                req.session.email = rows[0].email;
                                req.session.description = rows[0].description;
                                req.session.role = rows[0].role; // กำหนดค่าบทบาทผู้ใช้ใน session 
                                req.session.profile_image = rows[0].profile_image;
                                req.session.website = website[0];
                                res.redirect('/'); 
                                })
                            })
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


// // เส้นทางสำหรับล็อกอินผู้เยี่ยมชม
// router.post('/login-as-guest', ifNotLoggedin, [
//     body('user_pass', 'Password is empty!').trim().not().isEmpty(),
//     // Validation and authentication logic
// ], (req, res) => {
//     // กำหนดชื่อผู้ใช้ที่คุณต้องการเป็นค่าคงที่
//     const guestUserName = "Guest2"; // ตั้งค่าชื่อผู้ใช้ที่คุณต้องการ

//     const validation_result = validationResult(req);
//     const { user_pass } = req.body;

//     if (validation_result.isEmpty()) {
//         // ในกรณีนี้คุณไม่ต้องตรวจสอบชื่อผู้ใช้
//         // เพราะคุณกำหนดชื่อผู้ใช้ไว้ใน guestUserName แล้ว
//         // ตรวจสอบรหัสผ่านเท่านั้น

//         // เช็ครหัสผ่านที่คุณต้องการ เช่นเช็ครหัสผ่านกับรหัสผ่าน Guest
//         const isPasswordValid = (user_pass === '123456'); // ตั้งค่ารหัสผ่าน Guest ที่คุณต้องการ

//         if (isPasswordValid) {
//             // ถ้ารหัสผ่านถูกต้อง กำหนดข้อมูลผู้เยี่ยมชม
//             const guestData = {
//                 id: 20,
//                 role: 'GUEST',
//                 user_name: "GUEST",
//                 name: 'GUEST',
//                 email: 'Guest2@gmail.com',
//                 gender: 'GUEST',
//                 password: '$2b$12$c36ho0JftBlqblhGeghpvuBdDkvCvbPgomWf940pLNHy2j.jt0hZ6',
//                 profile_image: 'public\\images\\users_picture\\205551038_516695639758007_8769628568148858641_n.jpg'
//             };

//             // เก็บข้อมูลผู้เยี่ยมชมใน req.session.header
//             req.session.header = guestData;
//             req.session.isLoggedIn = true;
//             req.session.userID = guestData.id;
//             req.session.name = guestData.name;
//             req.session.user_name = guestData.user_name;
//             req.session.email = guestData.email;
//             req.session.role = guestData.role;
//             req.session.profile_image = guestData.profile_image;

//             res.redirect('/');
//         } else {
//             res.render('login2', {
//                 login_errors: ['Invalid Password!']
//             });
//         }
//     } else {
//         let allErrors = validation_result.errors.map((error) => {
//             return error.msg;
//         });
//         // REDERING login-register PAGE WITH LOGIN VALIDATION ERRORS
//         res.render('login2', {
//             login_errors: allErrors
//         });
//     }
// });

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
