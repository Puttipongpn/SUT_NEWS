var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
const { DateTime } = require('luxon'); // นำเข้าแพ็คเกจ luxon
router.use(express.urlencoded({ extended: false }));
//SELECT * FROM bookmark LEFT JOIN news_type ON bookmark.news_id = news_type.news_type_id WHERE bookmark.users_id = ?

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const commentDataWithUserId = {
        c_news_id: req.params.id,
        c_user_id: req.session.userID,
        comment: req.body.content,
        c_timestamp: DateTime.local().setZone('Asia/Bangkok').toString() || null
    };
    dbConnection.query("INSERT INTO `comment` SET ?", [commentDataWithUserId])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.delete('/:id', ifNotLoggedin, (req, res, next) => {
    const commentData = {
        comment_id: req.params.id
    };

    dbConnection.query("DELETE FROM `comment` WHERE comment_id = ?", [commentData.comment_id])
        .then(result => {
            res.json(result);
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});

router.get('/:id', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT COUNT(*) AS commentCount FROM `comment` WHERE c_news_id = ?")
        .then(([rows]) => {
            const commentCount = rows[0].commentCount;
            res.json({ commentCount }); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

module.exports = router;