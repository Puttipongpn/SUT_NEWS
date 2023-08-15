var express = require('express');
const router = express.Router();
router.use(express.urlencoded({ extended: false }));



router.get('/centerpage', function (req, res, next) {
    res.render('home/centerpage', {
        name: 'PLEASE LOGIN',
        role: 'GUEST',
        user_name: 'PLEASE LOGIN',
        email: 'PLEASE LOGIN',
        profile_image: '',
    });
});

//login part------------------------------------------------------------------
const loginRouter = require('./loginRouter/loginRouter');
router.use('/', loginRouter);


//center part----------------------------------------------------------
const SetProfileRouter = require('./PathRouter/MiddelPath/SetProfileRouter');
router.use('/setting_profile', SetProfileRouter);

const Profile = require('./PathRouter/MiddelPath/Profile')
router.use('/profile', Profile);

const Bookmark = require('./PathRouter/MiddelPath/Bookmark')
router.use('/bookmark', Bookmark);

const Detaails_news = require('./PathRouter/MiddelPath/Details_news')
router.use('/details', Detaails_news);


//Official || user part------------------------------------------------------
const Official_request = require('./PathRouter/UserPath/Official_request')
router.use('/request_official', Official_request);

const news_doom = require('./PathRouter/UserPath/doom')
router.use('/news_doom', news_doom);

const AddNews = require('./PathRouter/OfficialUserPath/AddNews')
router.use('/addnews', AddNews);

const Section = require('./PathRouter/OfficialUserPath/Setting_section')
router.use('/section', Section);

const setting_news = require('./PathRouter/OfficialUserPath/Setting_news')
router.use('/setting_news', setting_news);


//admin part-------------------------------------------------------------
const Respond_news = require('./PathRouter/AdminPath/respond_news')
router.use('/respond',Respond_news);

const official_request = require('./PathRouter/AdminPath/official_request')
router.use('/official_request',official_request);

const manage_users = require('./PathRouter/AdminPath/manage_users')
router.use('/manage_users',manage_users);

const setting_page = require('./PathRouter/AdminPath/setting_page')
router.use('/setting_page',setting_page)


module.exports = router;

