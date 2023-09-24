var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT * FROM news")
        .then(([rows]) => { 
            res.render('center/subscriber',{
                sub: rows[0],
                header:req.session.header
            })
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        sub_user_id: req.params.id,
        user_id: req.session.userID
    };
    dbConnection.query("INSERT INTO `subscribe` SET ?", [newsDataWithUserId])
        .then(([rows]) => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.delete('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        sub_user_id: req.params.id,
        user_id: req.session.userID
    };
    dbConnection.query("DELETE FROM `subscribe` WHERE `sub_user_id` = ? AND `user_id` = ?; ", [newsDataWithUserId.sub_user_id,newsDataWithUserId.user_id])
        .then(([rows]) => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});


module.exports = router;