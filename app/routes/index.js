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

//middel part-----------------------------------------------------------------
const header = require('./PathRouter/MiddelPath/Header')
router.use('header',header);

//center component




//center part----------------------------------------------------------
const SetProfileRouter = require('./PathRouter/MiddelPath/SetProfileRouter');
router.use('/setting_profile', SetProfileRouter);

const Profile = require('./PathRouter/MiddelPath/Profile')
router.use('/profile', Profile);

const Bookmark = require('./PathRouter/MiddelPath/Bookmark')
router.use('/bookmark', Bookmark);

const Like = require('./PathRouter/MiddelPath/Like')
router.use('/like', Like);

const Detaails_news = require('./PathRouter/MiddelPath/Details_news')
router.use('/details', Detaails_news);

const Home_tags = require('./PathRouter/MiddelPath/Home_Tags')
router.use('/tags', Home_tags);

const subscriber = require('./PathRouter/MiddelPath/subscriber')
router.use('/subscriber', subscriber);

const sut_map = require('./PathRouter/MiddelPath/sut_map')
router.use('/sut_map', sut_map);

const calendar = require('./PathRouter/MiddelPath/calendar')
router.use('/calendar', calendar);

const scholarship = require('./PathRouter/MiddelPath/scholarship')
router.use('/scholarship', scholarship);

const elective_subject = require('./PathRouter/MiddelPath/elective_subject')
router.use('/elective_subject', elective_subject);

const general_education_program = require('./PathRouter/MiddelPath/general_education_program')
router.use('/general_education_program', general_education_program);

const news_type = require('./PathRouter/MiddelPath/Home_Type')
router.use('/news_type', news_type);

const news_topic = require('./PathRouter/MiddelPath/Home_Topic')
router.use('/news_topic', news_topic);

const comment = require('./PathRouter/MiddelPath/comment')
router.use('/comment', comment);

const save_tags = require('./PathRouter/MiddelPath/user_save_tags')
router.use('/save_tags', save_tags);

const setting_save_tags = require('./PathRouter/MiddelPath/user_setting_tags')
router.use('/setting_save_tags', setting_save_tags);

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

const approve_news = require('./PathRouter/AdminPath/approve_news')
router.use('/approve',approve_news);

const official_request = require('./PathRouter/AdminPath/official_request')
router.use('/official_request',official_request);

const manage_users = require('./PathRouter/AdminPath/manage_users')
router.use('/manage_users',manage_users);

const setting_page = require('./PathRouter/AdminPath/setting_page')
router.use('/setting_page',setting_page)


module.exports = router;

