var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 1")
        .then(([rows]) => {
            if (req.session.role === "ADMIN") {
                const formattedRows = rows.map(row => {
                    const date = row.time_stamp;
                    const newDate = new Date(date);
                    newDate.setHours(newDate.getHours() + 7);
                    const formattedDate = new Date(newDate).toISOString().substring(0, 19).replace('T', ' ');
                    return {
                        ...row,
                        formattedDate: formattedDate
                    };
                });

                res.render('admin_page/approve_news', {
                    header: req.session.header,
                    approve: formattedRows,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                    home_website:req.session.website,
                    save_topic:req.session.save_topic,
                    
                });
            } else if (rows[0].role === "USER") {
                res.render('404page')
            } else {
                res.redirect('/')
            }
        });
});

router.get('/his_approve', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN status ON approve_news.status_id = status.status_id WHERE approve_news.status_id = 2 || approve_news.status_id = 3 || approve_news.status_id = 4")
        .then(([rows]) => {
            if (req.session.role === "ADMIN") {
                const formattedRows = rows.map(row => {
                    const date = row.time_stamp;
                    const newDate = new Date(date);
                    newDate.setHours(newDate.getHours() + 7);
                    const formattedDate = new Date(newDate).toISOString().substring(0, 19).replace('T', ' ');
                    return {
                        ...row,
                        formattedDate: formattedDate
                    };
                });

                res.render('admin_page/history_approve', {
                    header: req.session.header,
                    approve: formattedRows,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                    home_website:req.session.website,
                    save_topic:req.session.save_topic,

                });
            } else if (rows[0].role === "USER") {
                res.render('404page')
            } else {
                res.redirect('/')
            }
        });
});

router.get('/status_combobox', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM status")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/location_combobox', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM location_post")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/:news_id', ifNotLoggedin, (req, res, next) => {
    const news_id = req.params.news_id;
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN user_request ON news.user_id = user_request.user_id WHERE news.news_id  = ?", [news_id])
        .then(([rows]) => {
            if (rows) {
                res.render('admin_page/approve', {
                    approve: rows,
                    header: req.session.header,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                    home_website:req.session.website,
                    save_topic:req.session.save_topic,

                });

            } else {
                console.error(error);
            }
        });
});


router.post('/:news_id', ifNotLoggedin, (req, res, next) => {
    const news_id = req.params.news_id;
    const status_id = req.body['status_id']|| null;
    const response = req.body['response'] || null;
    const location_post_id = req.body['location_post_id'] || null;
    const admin_id = req.session.userID || null;
    const approve_id = req.body['approve_id']|| null;
    dbConnection.execute("UPDATE approve_news SET status_id = ?,response = ?,location_post_id = ?,admin_id = ?  WHERE news_id = ?", [ status_id, response, location_post_id, admin_id,news_id,  ])
        .then(() => {
            res.redirect('/approve');
        });
});


module.exports = router;