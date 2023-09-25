var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', async (req, res) => {
    try {
        // ดึงข้อมูลจากฐานข้อมูล
        user_id = req.session.userID
        news = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN subscribe ON subscribe.sub_user_id = news.user_id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND subscribe.user_id = ?",[user_id])
        dbConnection.execute("SELECT * FROM `subscribe` LEFT JOIN users ON subscribe.sub_user_id = users.id WHERE user_id = ?", [user_id])
            .then(([rows]) => {
                res.render('center/subscriber', {
                    news : news[0],
                    subHome: rows,
                    header: req.session.header
                })
            })
            .catch(err => {
                console.error(err);
                res.status(500).json({ error: 'Internal Server Error' });
            });
    } catch (error) {

    }
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
    dbConnection.query("DELETE FROM `subscribe` WHERE `sub_user_id` = ? AND `user_id` = ?; ", [newsDataWithUserId.sub_user_id, newsDataWithUserId.user_id])
        .then(([rows]) => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});


module.exports = router;