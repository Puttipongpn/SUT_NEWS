var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    
            res.render('home/calendar',{
                header:req.session.header,
                profile_image: req.session.profile_image,
                home_website:req.session.website,
                save_topic:req.session.save_topic,

            });
});

module.exports = router;