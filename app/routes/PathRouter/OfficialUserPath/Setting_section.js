var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));


router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `section` LEFT JOIN users ON users.id = section.section_user_id")
        .then(([rows]) => {
            if (req.session.role === "OFFICIAL USER" || req.session.role === "ADMIN") {
                res.render('official_user_page/setting_section', {
                    section: rows,
                    id:req.session.userID,
                    header:req.session.header,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                    home_website:req.session.website,
                    save_topic:req.session.save_topic,
                    
                });
            }else {
                res.render('home/page1')
            }
        });
});

router.post('/', ifNotLoggedin, (req, res) => {
    let params = req.body;
    params.section_user_id = req.session.userID;
    dbConnection.query("INSERT INTO section SET ?", [params])
        .then(() => {
            res.redirect('/section');
            req.session.message = 'บันทึกสำเร็จ';
        })
        .catch(err => {
            console.log(err);
            res.redirect('404page');
        });
});

// สร้างเส้นทาง DELETE สำหรับลบ section
router.post('/delete/:id', ifNotLoggedin, (req, res) => {
    let sectionId = req.params.id; // ใช้ req.params ไม่ใช่ req.body
    dbConnection.query("DELETE FROM `section` WHERE section_id = ?", [sectionId])
        .then(([rows]) => {
            res.json(rows);
            //res.redirect('/section');
        })
        .catch(err => {
            console.log(err);
            res.redirect('/404page');
        });
});


module.exports = router;