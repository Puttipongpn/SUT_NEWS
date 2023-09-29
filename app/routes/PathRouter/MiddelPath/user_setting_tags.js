var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `save_section`LEFT JOIN section ON section.section_id = save_section.tags_id WHERE save_section.t_user_id = ? ;", [req.session.userID])
        .then(([rows]) => {
            if (req.session.role === "OFFICIAL USER" || req.session.role === "USER" || req.session.role === "ADMIN") {
                res.render('center/setting_save_tags', {
                    tags: rows,
                    header: req.session.header,
                });
            } else if (rows[0].role === "USER" || rows[0].role === "ADMIN") {
                res.render('404page');
            }
            else {
                res.render('404page', {
                    name: 'PLEASE LOGIN',
                    role: 'GUEST'
                })
            }
        });
});

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

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        tags_id: req.params.id,
        t_user_id: req.session.userID
    };
    dbConnection.query("INSERT INTO save_section SET ?", [newsDataWithUserId])
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

    const tags_id = req.params.id // แก้ไขตรงนี้
    
    dbConnection.query("DELETE FROM `save_section` WHERE save_tags_id = ?", [tags_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});


module.exports = router;