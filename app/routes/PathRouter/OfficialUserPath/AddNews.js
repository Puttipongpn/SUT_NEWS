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

router.get('/section/:id', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    news_id = req.params.id;
    dbConnection.execute("SELECT * FROM `group_section`LEFT JOIN section ON section.section_id =group_section.section_id WHERE group_section.news_id = ?", [news_id])
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
                    header: req.session.header,
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
            dbConnection.query("INSERT INTO approve_news SET news_id = ?, status_id = ?", [newsId, '1'])
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

router.get('/:news_id', ifNotLoggedin, (req, res, next) => {
    news_id = req.params.news_id;
    dbConnection.execute("SELECT * FROM `news` LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON  news.news_type_id = news_type.news_type_id LEFT JOIN group_section ON news.news_id = group_section.news_id LEFT JOIN section ON group_section.section_id = section.section_id LEFT JOIN users ON news.user_id = users.id LEFT JOIN user_request ON news.user_id = user_request.user_id WHERE news.news_id = ?", [news_id])
        .then(([rows]) => {
            if (rows) {
                res.render('official_user_page/edit_news', {
                    users: rows,
                    header: req.session.header,
                    description: rows.description,
                    name: rows.name,
                    role: rows.role,
                    user_name: rows.user_name,
                    email: rows.email,
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



router.post('/update/:id', upload_card.single('card_picture'), ifNotLoggedin, (req, res) => {
    const { section_id, ...newsData } = req.body;
    const news_type_id = req.body['news_type_id'] || null;
    const topic_id = req.body['topic_id'] || null;
    const title = req.body['title'] || null;
    const welding_para = req.body['welding_para'] || null;
    const news_content = req.body['news_content'] || null;
    const explain = req.body['explain'] || null;
    const start = req.body['start'] || null;
    const end = req.body['end'] || null;
    const time_stamp = DateTime.local().setZone('Asia/Bangkok').toString() || null;
    const news_id = req.params.id;
    // const newsDataWithUserId = {
    //     news_id: req.params.id,
    //     time_stamp: DateTime.local().setZone('Asia/Bangkok') || null,
    //     card_picture: req.file.path || null,
    //     ...newsData
    // };
    if (req.file) {
        const card_picture = req.file.path;
        console.log('Cardddddddddd');
        imagePath = req.file.path;
        dbConnection.query("UPDATE `news` SET `news_type_id`=?, `topic_id`=?, `title`=?, `welding_para`=?, `card_picture`=?, `news_content`=?, `explain`=?, `start`=?, `end`=?, `time_stamp`=? WHERE `news_id` = ?", [news_type_id, topic_id, title, welding_para, card_picture, news_content, explain, start, end, time_stamp, news_id])
            .then(result => {
                req.session.card_picture = imagePath;
                const newsId = req.params.id;
                dbConnection.query("UPDATE approve_news SET status_id = ? WHERE news_id = ?", ['1', newsId])
                if (section_id) {
                    console.log("section")
                    const sectionIds = JSON.parse(section_id); // แปลง JSON string กลับเป็น Array
                    const groupSectionData = sectionIds.map(id => ({
                        news_id: newsId,
                        section_id: id
                    }));
                    return Promise.all(groupSectionData.map(data =>
                        dbConnection.query("UPDATE group_section SET ?", data)
                    ));
                }
            })
            .then(() => {
                res.redirect('/setting_news');
                req.session.message = 'บันทึกสำเร็จ';
            })
            .catch(err => {
                console.log(err);
                res.redirect('404page');
            });
    }else{
        dbConnection.query("UPDATE `news` SET `news_type_id`=?, `topic_id`=?, `title`=?, `welding_para`=?, `news_content`=?, `explain`=?, `start`=?, `end`=?, `time_stamp`=? WHERE `news_id` = ?", [news_type_id, topic_id, title, welding_para, news_content, explain, start, end, time_stamp, news_id])
            .then(result => {
                const newsId = req.params.id;
                dbConnection.query("UPDATE approve_news SET status_id = ? WHERE news_id = ?", ['1', newsId])
                if (section_id) {
                    console.log("section")
                    const sectionIds = JSON.parse(section_id); // แปลง JSON string กลับเป็น Array
                    console.log(sectionIds);
                    const groupSectionData = sectionIds.map(id => ({
                        news_id: newsId,
                        section_id: id
                    }));
                    return Promise.all(groupSectionData.map(data =>
                        dbConnection.query("UPDATE group_section SET ?", data)
                    ));
                }
            })
            .then(() => {
                res.redirect('/setting_news');
                req.session.message = 'บันทึกสำเร็จ';
            })
            .catch(err => {
                console.log(err);
                res.redirect('404page');
            });
    }
});






module.exports = router;