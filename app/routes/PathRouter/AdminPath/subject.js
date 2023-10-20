var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/subject_details/:id', ifNotLoggedin,async (req, res, next) => {
    try {
        const s_id = req.params.id
        const comment = await dbConnection.execute("SELECT * FROM `subject_review` LEFT JOIN users ON users.id = subject_review.r_user_id WHERE subject_review.r_subject_id = ? ORDER BY subject_review.review_id DESC;", [s_id]);
        dbConnection.execute("SELECT * FROM `subject` LEFT JOIN subject_type ON subject.subject_type_id =subject_type.s_type_id WHERE s_id = ?",[s_id])
            .then(([rows]) => {
                if (rows) {
                    res.render('center/subject_details', {
                        subject: rows,
                        comment: comment[0],
                        id:req.session.userID,
                        role: req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        home_website:req.session.website,
                    });
                } else {
                    res.render('404page', {
                        name: 'PLEASE LOGIN',
                        role: 'GUEST'
                    })
                }
            });
    } catch (error) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get('/home_elective_subject', ifNotLoggedin, (req, res, next) => {
    try {
        dbConnection.execute("SELECT * FROM `subject` WHERE subject_type_id = 1 ORDER BY subject_status_id = 1 DESC;")
            .then(([rows]) => {
                if (rows) {
                    res.render('center/elective_subject', {
                        tags: rows,
                        role: req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        home_website:req.session.website,
                        save_topic:req.session.save_topic,
                    });
                } else {
                    res.render('404page', {
                        name: 'PLEASE LOGIN',
                        role: 'GUEST'
                    })
                }
            });
    } catch (error) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get('/elective', ifNotLoggedin, (req, res, next) => {
    try {
        dbConnection.execute("SELECT * FROM `subject` WHERE subject_type_id = 1 and subject_status_id = 1;")
            .then(([rows]) => {
                if (req.session.role === "ADMIN") {
                    res.render('admin_page/elective_subject', {
                        tags: rows,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        home_website:req.session.website,
                        save_topic:req.session.save_topic,

                    });
                } else {
                    res.render('404page', {
                        name: 'PLEASE LOGIN',
                        role: 'GUEST'
                    })
                }
            });
    } catch (error) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});



router.get('/elective_subject', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM `subject` WHERE subject_type_id = 1 AND subject_status_id = 2")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.post('/elective_subject/:id', ifNotLoggedin, (req, res, next) => {
    const s_id = req.params.id
    dbConnection.query("UPDATE `subject` SET `subject_status_id`= 1 WHERE s_id = ?", [s_id])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.post('/close_elective_subject/:id', ifNotLoggedin, (req, res, next) => {
    const s_id = req.params.id
    dbConnection.query("UPDATE `subject` SET `subject_status_id`= 2 WHERE s_id = ?", [s_id])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});


router.get('/add_subject', ifNotLoggedin, (req, res, next) => {
    try {
        dbConnection.execute("SELECT * FROM `subject` LEFT JOIN subject_type ON subject.subject_type_id = subject_type.s_type_id ORDER BY subject.s_id DESC;")
            .then(([rows]) => {
                if (req.session.role === "ADMIN") {
                    res.render('admin_page/subject_setting', {
                        tags: rows,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        home_website:req.session.website,
                        save_topic:req.session.save_topic,

                    });
                } else {
                    res.render('404page', {
                        name: 'PLEASE LOGIN',
                        role: 'GUEST'
                    })
                }
            });
    } catch (error) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


router.get('/subject_type', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM `subject_type`")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/subject_type_search/:id', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูลตามคำค้นหาหรือประเภทวิชาที่เลือก
    const searchSubjectId = req.params.id;
    
    dbConnection.execute("SELECT * FROM `subject` LEFT JOIN subject_type ON subject.subject_type_id = subject_type.s_type_id WHERE subject_type_id LIKE ?",[searchSubjectId])
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.get('/subject_id_search/:id', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูลตามคำค้นหาหรือประเภทวิชาที่เลือก
    const searchSubjectId = req.params.id;
    
    dbConnection.execute("SELECT * FROM `subject` LEFT JOIN subject_type ON subject.subject_type_id = subject_type.s_type_id WHERE subject_id LIKE ?",[searchSubjectId])
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});


router.post('/', ifNotLoggedin, (req, res, next) => {
    data = req.body
    data.subject_status_id = 2;
    dbConnection.query("INSERT INTO `subject` SET ?", [data])
        .then(result => {
            res.send('<script>alert("บันทึกสำเร็จ"); window.location="/subject/add_subject";</script>');
           // res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});


// สร้างเส้นทาง DELETE สำหรับลบ section
router.delete('/:id', ifNotLoggedin, (req, res, next) => {

    const s_id = req.params.id // แก้ไขตรงนี้

    dbConnection.query("DELETE FROM `subject` WHERE s_id = ?", [s_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});
//-----------------------------------------------------------------------------------------------

router.get('/home_general_subject', ifNotLoggedin, (req, res, next) => {
    try {
        dbConnection.execute("SELECT * FROM `subject` WHERE subject_type_id = 2 ORDER BY subject_status_id = 1 DESC;")
            .then(([rows]) => {
                if (rows) {
                    res.render('center/general_subject', {
                        tags: rows,
                        role: req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        home_website:req.session.website,
                        save_topic:req.session.save_topic,

                    });
                } else {
                    res.render('404page', {
                        name: 'PLEASE LOGIN',
                        role: 'GUEST'
                    })
                }
            });
    } catch (error) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


router.get('/general', ifNotLoggedin, (req, res, next) => {
    try {
        dbConnection.execute("SELECT * FROM `subject` WHERE subject_type_id = 2 and subject_status_id = 1;")
            .then(([rows]) => {
                if (req.session.role === "ADMIN") {
                    res.render('admin_page/general_subject', {
                        tags: rows,
                        header: req.session.header,
                        profile_image: req.session.profile_image,
                        home_website:req.session.website,
                        save_topic:req.session.save_topic,

                    });
                } else {
                    res.render('404page', {
                        name: 'PLEASE LOGIN',
                        role: 'GUEST'
                    })
                }
            });
    } catch (error) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get('/general_subject', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM `subject` WHERE subject_type_id = 2 AND subject_status_id = 2")
        .then(([rows]) => {
            res.json(rows); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});


module.exports = router;