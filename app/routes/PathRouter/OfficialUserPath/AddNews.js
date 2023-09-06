var express = require('express');
const router = express.Router();
//let conn = require('./connect')
const path = require('path');
const dbConnection = require('../../connect');
const { body, validationResult, Result } = require('express-validator');
const multer = require('multer');
const { group } = require('console');
const { DateTime } = require('luxon'); // นำเข้าแพ็คเกจ luxon
//const app = express();
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/news_type_combobox', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM news_type")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/news_topic_combobox', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM topic")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});
// tags กับ section คือตัวเดียวกัน
router.get('/tags', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM section")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM users WHERE users.id = ?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "OFFICIAL USER" || rows[0].role === "ADMIN") {
                res.render('official_user_page/add_news', {
                    users: rows,
                    header:req.session.header,
                    description: rows[0].description,
                    name: rows[0].name,
                    role: rows[0].role,
                    user_name: rows[0].user_name,
                    email: rows[0].email,
                    profile_image: req.session.profile_image,
                });
            } else if (rows[0].role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });
});

const upload_card = multer({
    storage: multer.diskStorage({
      destination: (req, file, cb) => {
        cb(null, 'public/images/card_picture');
      },
      filename: (req, file, cb) => {
        cb(null, file.originalname);
      }
    })
  });


router.post('/:id', upload_card.single('card_picture'), ifNotLoggedin, (req, res) => {
    const { section_id, ...newsData } = req.body;

    const newsDataWithUserId = {
        user_id: req.params.id,
        time_stamp: DateTime.local().setZone('Asia/Bangkok'),
        card_picture: req.file.path,
        ...newsData
    }; 
        imagePath = req.file.path;
    dbConnection.query("INSERT INTO news SET ?", newsDataWithUserId)
        .then(result => {
            req.session.card_picture = imagePath;
            const newsId = result[0].insertId;
            dbConnection.query("INSERT INTO approve_news SET news_id = ?, status_id = ?",[newsId,'1'])
            if (section_id) {
                const sectionIds = JSON.parse(section_id); // แปลง JSON string กลับเป็น Array
                const groupSectionData = sectionIds.map(id => ({
                    news_id: newsId,
                    section_id: id
                }));
                return Promise.all(groupSectionData.map(data =>
                    dbConnection.query("INSERT INTO group_section SET ?", data)
                ));
            }
        })
        .then(() => {
            res.redirect('/addnews');
            req.session.message = 'บันทึกสำเร็จ';
        })
        .catch(err => {
            console.log(err);
            res.redirect('404page');
        });
});
module.exports = router;