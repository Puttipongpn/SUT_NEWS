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
    const reviewDataWithUserId = {
        r_subject_id: req.params.id,
        r_user_id: req.session.userID,
        review: req.body.content,
        review_timestamp: DateTime.local().setZone('Asia/Bangkok').toString() || null
    };
    dbConnection.query("INSERT INTO `subject_review` SET ?", [reviewDataWithUserId])
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
        review_id: req.params.id
    };

    dbConnection.query("DELETE FROM `subject_review` WHERE review_id = ?", [commentData.review_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});

module.exports = router;