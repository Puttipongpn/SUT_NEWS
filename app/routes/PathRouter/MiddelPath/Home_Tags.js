var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/:section_id', ifNotLoggedin, (req, res, next) => {
    const section_id = req.params.section_id;
    dbConnection.execute("SELECT * FROM `group_section` LEFT JOIN news ON group_section.news_id = news.news_id WHERE section_id = ?", [section_id])
        .then(([rows]) => {
            if (rows) {
                res.render('center/tags', {
                    tags: rows,
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