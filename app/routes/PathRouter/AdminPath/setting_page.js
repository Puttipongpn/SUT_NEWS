var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));
const multer = require('multer');
const { and } = require('sequelize');


router.get('/setting_page_1', ifNotLoggedin, async (req, res, next) => {
    try {
        const website = await dbConnection.execute("SELECT * FROM `website`");
        dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
            .then(([rows]) => {
                if (rows[0].role === "ADMIN") {
                    res.render('admin_page/setting_page_1', {
                        users: rows,
                        website: website[0],
                        header: req.session.header,
                        name: rows[0].name,
                        role: rows[0].role,
                        user_name: rows[0].user_name,
                        email: rows[0].email,
                        profile_image: req.session.profile_image,
                        home_website:req.session.website,
                    });
                } else if (rows[0].role === "USER") {
                    res.render('404page')
                } else {
                    res.render('404page')
                }
            });
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }

});

router.get('/setting_page_2', ifNotLoggedin, async (req, res, next) => {
    try {
        const website = await dbConnection.execute("SELECT * FROM `website`");
        dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
            .then(([rows]) => {
                if (rows[0].role === "ADMIN") {
                    res.render('admin_page/setting_page_2', {
                        users: rows,
                        website: website[0],
                        header: req.session.header,
                        name: rows[0].name,
                        role: rows[0].role,
                        user_name: rows[0].user_name,
                        email: rows[0].email,
                        profile_image: req.session.profile_image,
                        home_website:req.session.website,
                    });
                } else if (rows[0].role === "USER") {
                    res.render('404page')
                } else {
                    res.render('404page')
                }
            });
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }

});
router.get('/setting_page_3', ifNotLoggedin, async (req, res, next) => {
    try {
        const topic = await dbConnection.execute("SELECT * FROM `topic`");
        dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
            .then(([rows]) => {
                if (rows[0].role === "ADMIN") {

                    res.render('admin_page/setting_page_3', {
                        users: rows,
                        topic: topic,
                        header: req.session.header,
                        name: rows[0].name,
                        role: rows[0].role,
                        user_name: rows[0].user_name,
                        email: rows[0].email,
                        profile_image: req.session.profile_image,
                        home_website:req.session.website,
                    });
                } else if (rows[0].role === "USER") {
                    res.render('404page')
                } else {
                    res.render('404page')
                }
            });
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }

});
router.get('/setting_page_4', ifNotLoggedin, async (req, res, next) => {
    try {
        const save_topic = await dbConnection.execute("SELECT * FROM `save_topic` LEFT JOIN topic ON topic.topic_id = save_topic.s_topic_id");
        const topic = await dbConnection.execute("SELECT * FROM `topic`");
        dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
            .then(([rows]) => {
                if (rows[0].role === "ADMIN") {

                    res.render('admin_page/setting_page_4', {
                        users: rows,
                        topic: topic[0],
                        save_topic: save_topic[0],
                        header: req.session.header,
                        name: rows[0].name,
                        role: rows[0].role,
                        user_name: rows[0].user_name,
                        email: rows[0].email,
                        profile_image: req.session.profile_image,
                        home_website:req.session.website,
                    });
                } else if (rows[0].role === "USER") {
                    res.render('404page')
                } else {
                    res.render('404page')
                }
            });
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }

});


router.get('/topic', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM `topic`")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/save_topic', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM `menu` LEFT JOIN topic ON topic.topic_id = menu.menu_topic_id")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});
router.post('/topic', ifNotLoggedin, (req, res, next) => {
    let params = req.body;
    dbConnection.query("INSERT INTO topic SET ?", [params])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        s_topic_id: req.params.id,
    };
    dbConnection.query("INSERT INTO save_topic SET ?", [newsDataWithUserId])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

// สร้างเส้นทาง DELETE สำหรับลบ section
router.delete('/:id', ifNotLoggedin, (req, res, next) => {
    const topic_id = req.params.id // แก้ไขตรงนี้
    dbConnection.query("DELETE FROM `topic` WHERE topic_id  = ?", [topic_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});

router.delete('/save_topic/:id', ifNotLoggedin, (req, res, next) => {

    const save_topic_id = req.params.id // แก้ไขตรงนี้

    dbConnection.query("DELETE FROM `save_topic` WHERE save_topic_id   = ?", [save_topic_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});

const upload_profile = multer({
    storage: multer.diskStorage({
        destination: (req, file, cb) => {
            cb(null, 'public/images/users_picture');
        },
        filename: (req, file, cb) => {
            cb(null, file.originalname);
        }
    })
});

router.post('/update_website/:id', upload_profile.single('website_picture'), ifNotLoggedin, (req, res) => {
    const website_id = req.params.id;
    const website_name = req.body['website_name'] || null;
    const website_about = req.body['website_about'] || null;
    const website_contacts = req.body['website_contacts'] || null;

    // เช็คว่ามีการอัปโหลดรูปภาพหรือไม่
    if (req.file && website_name) { // แก้ไขเป็น req.file แทน req.files
        console.log("if!");
        const imagePath = req.file.path; // เส้นทางไฟล์ภาพที่อัปโหลด
        // ทำการบันทึกเส้นทางไฟล์ภาพลงในฐานข้อมูล หรือในที่นี้คืออัปโหลดไฟล์ภาพไปยังโฟลเดอร์เซิร์ฟเวอร์และบันทึกเส้นทางไฟล์ลงในฐานข้อมูล
        dbConnection.execute("UPDATE website SET website_picture= ? ,website_name= ? WHERE website_id = ?", [imagePath, website_name, website_id])
            .then(() => {
                // ลบไฟล์รูปภาพเดิมออกจากโฟลเดอร์อัปโหลด (ถ้าต้องการ)
                // fs.unlinkSync(req.session.profile_image);
                req.session.message = 'บันทึกสำเร็จ';
                req.session.profile_image = imagePath; // อัปเดตเส้นทางไฟล์รูปภาพใน session
                res.send('<script>window.location="/setting_page/setting_page_1";alert("บันทึกสำเร็จ");</script>');
            })
            .catch(err => {
                console.log(err);
                res.redirect('404page');
            });
    } else if (website_name) {
        dbConnection.execute("UPDATE website SET website_name= ?  WHERE website_id = ?", [website_name, website_id])
            .then(() => {
                res.send('<script>window.location="/setting_page/setting_page_1";alert("บันทึกสำเร็จ");</script>');
            })
            .catch(err => {
                console.log(err);
                res.redirect('404page');
            });
    }else {
        console.log("else!");
        // ถ้าไม่มีการอัปโหลดรูปภาพ ให้แก้ไขข้อมูลอื่นๆ โดยไม่เปลี่ยนแปลงรูปภาพ
        dbConnection.execute("UPDATE website SET website_about= ?, website_contacts = ? WHERE website_id = ?", [website_about, website_contacts, website_id])
            .then(() => {
                res.send('<script>window.location="/setting_page/setting_page_2";alert("บันทึกสำเร็จ");</script>');
            })
            .catch(err => {
                console.log(err);
                res.redirect('404page');
            });
    }
});

module.exports = router;
