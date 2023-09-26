var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));
//SELECT * FROM bookmark LEFT JOIN news_type ON bookmark.news_id = news_type.news_type_id WHERE bookmark.users_id = ?

router.post('/:id', ifNotLoggedin, (req, res, next) => {
    const newsDataWithUserId = {
        like_news_id: req.params.id,
        like_user_id: req.session.userID
    };
    dbConnection.query("INSERT INTO `like` SET ?", [newsDataWithUserId])
        .then(result => {
            res.json({ message: 'บันทึกสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการบันทึก' });
        });
});

router.delete('/:id', ifNotLoggedin, (req, res, next) => {
    const likeData = {
        news_id: req.params.id, // แก้ไขตรงนี้
        users_id: req.session.userID
    };

    dbConnection.query("DELETE FROM `like` WHERE like_news_id = ? AND like_user_id = ?", [likeData.news_id, likeData.users_id])
        .then(result => {
            res.json({ message: 'ลบสำเร็จ' });
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบ' });
        });
});

router.get('/:id', (req, res) => {
    // ดึงข้อมูลจากฐานข้อมูล
    dbConnection.execute("SELECT COUNT(*) AS likeCount FROM `like` WHERE like_news_id = ?")
        .then(([rows]) => {
            const likeCount = rows[0].likeCount;
            res.json({ likeCount }); // ส่งข้อมูลเป็น JSON
        })
        .catch(err => {
            console.error(err);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

// function countLikesForNews(newsId) {
//     return new Promise((resolve, reject) => {
//         // ส่งคำสั่ง SQL ไปยังฐานข้อมูลเพื่อนับจำนวนไลค์สำหรับข่าวที่ร้องขอ
//         const sql = "SELECT COUNT(*) AS likeCount FROM `like` WHERE like_news_id = ?";
//         dbConnection.execute(sql, [newsId])
//             .then(([rows]) => {
//                 const likeCount = rows[0].likeCount;
//                 resolve(likeCount);
//             })
//             .catch(err => {
//                 reject(err);
//             });
//     });
// }

// Export router
module.exports = router;