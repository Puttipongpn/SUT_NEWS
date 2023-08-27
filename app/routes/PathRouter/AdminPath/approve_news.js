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
                });
            } else if (rows[0].role === "USER") {
                res.render('404page')
            } else {
                res.redirect('/')
            }
        });
});


router.get('/:news_id', ifNotLoggedin, (req, res, next) => {
    const news_id = req.params.news_id;
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON users.id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE news.news_id  = ?", [news_id])
        .then(([rows]) => {
            if (rows) {
                    res.render('admin_page/approve', {
                    approve: rows,
                    header:req.session.header,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                });   
                
            } else {
                console.error(error);
            }
        });
});


module.exports = router;