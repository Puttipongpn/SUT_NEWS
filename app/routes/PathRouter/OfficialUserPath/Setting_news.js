var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM news LEFT JOIN approve_news ON news.news_id = approve_news.news_id WHERE user_id = ?", [req.session.userID])
        .then(([rows]) => {
            if (req.session.role === "OFFICIAL USER" || req.session.role === "ADMIN") {
                const Rows = rows.map(row => {
                    const date = row.time_stamp;
                    const newDate = new Date(date);
                    newDate.setHours(newDate.getHours() + 7);
                    const Rows = new Date(newDate).toISOString().substring(0, 19).replace('T', ' ');
                    return {
                        ...row,
                        formattedDate: Rows
                    };
                });
                res.render('official_user_page/setting_news', {
                    settingnews: Rows,
                    header: req.session.header,
                    users: req.session,
                    description: req.session.description,
                    name: req.session.name,
                    role: req.session.role,
                    user_name: req.session.user_name,
                    email: req.session.email,
                    profile_image: req.session.profile_image,
                    home_website:req.session.website,
                    save_topic:req.session.save_topic,

                });
            } else if (req.session.role === "ADMIN") {
                res.render('404page')
            }
            else {
                res.render('404page')
            }
        });
});

// router.post('/delete_news/:id', (req, res, next ) => {
//     const newsId = req.params.id;
//     // ลบข้อมูลในตาราง group_section ที่อ้างอิงข่าวนี้
//     dbConnection.query("DELETE FROM `group_section` WHERE news_id = ?", [newsId], (err, result) => {
//         if (err) {
//             console.log("Err")
//             console.error('เกิดข้อผิดพลาดในการลบข้อมูลในตาราง group_section: ' + err.message);
//             res.status(500).json({ success: false, message: 'ไม่สามารถลบข่าวได้' });
//         } else {
//             // ลบข้อมูลข่าวจากตาราง news
//             dbConnection.query("DELETE FROM news WHERE news_id = ?", [newsId], (err, result) => {
//                 if (err) {
//                     console.error('เกิดข้อผิดพลาดในการลบข่าว: ' + err.message);
//                     res.status(500).json({ success: false, message: 'ไม่สามารถลบข่าวได้' });
//                 } else {
//                     // ลบข้อมูลเสร็จสมบูรณ์
//                     console.log('asdfff')
//                     res.json({ success: true, message: 'ลบข่าวเรียบร้อยแล้ว' });
//                 }
//             });
//         }console.log('asdfff')
//     });
// });

// router.post('/delete_news/:id', (req, res, next) => {
//     const ID = req.params.id;
//     dbConnection.query("DELETE FROM approve_news WHERE news_id = ?", [ID])
//         .then((ID) => {
//             dbConnection.query("DELETE FROM  news LEFT JOIN group_section ON group_section.news_id = news.news_id WHERE news.news_id = ?", [ID])
//         })
//         .then(() => {
//             res.redirect('/addnews');
//             req.session.message = 'บันทึกสำเร็จ';
//         })
//         .catch(err => {
//             console.log(err);
//             res.redirect('404page');
//         });
// })

router.post('/delete_news/:id', async (req, res, next) => {
    const ID = req.params.id;
    
    try {
        // ลบข้อมูลจากตาราง "approve_news" ก่อน
        await dbConnection.query("DELETE FROM approve_news WHERE news_id = ?", [ID]);
        
        // ลบข้อมูลจากตาราง "news" และ "group_section"
        await dbConnection.query("DELETE FROM group_section WHERE news_id = ?", [ID]);

        await dbConnection.query("DELETE FROM news WHERE news_id = ?", [ID]);
        
        // เมื่อลบข้อมูลเสร็จสิ้น
        res.json({ message: 'ข้อมูลถูกลบแล้ว' });
        //res.redirect('/setting_news');
    } catch (err) {
        console.error('เกิดข้อผิดพลาดในการลบข้อมูล: ' + err.message);
        // คุณอาจต้องจัดการข้อผิดพลาดที่นี่
        res.status(500).json({ error: 'เกิดข้อผิดพลาดในการลบข้อมูล' });
    }
});


// router.post('/delete_news/:id', async (req, res, next) => {
//     const ID = req.params.id;

//     try {
//         // ลบข้อมูลจากตาราง "approve_news" ก่อน
//         await dbConnection.promise().query("DELETE FROM approve_news WHERE news_id = ?", [ID]);

//         // ลบข้อมูลจากตาราง "news" และ "group_section"
//         await dbConnection.promise().query("DELETE FROM news LEFT JOIN group_section ON group_section.news_id = news.news_id WHERE news.news_id = ?", [ID]);

//         // เมื่อลบข้อมูลเสร็จสิ้น
//         res.render('home/404page.ejs');
//     } catch (err) {
//         console.error('เกิดข้อผิดพลาดในการลบข้อมูล: ' + err.message);
//         // คุณอาจต้องจัดการข้อผิดพลาดที่นี่
//     }
// });

// router.post('/delete_news/:id', (req, res, next) => {
//     const ID = req.params.id;

//     // ลบข้อมูลจากตาราง "approve_news" ก่อน
//     dbConnection.query("DELETE FROM approve_news WHERE news_id = ?", [ID], (err) => {
//         if (err) {
//             console.error('เกิดข้อผิดพลาดในการลบข้อมูลในตาราง approve_news: ' + err.message);
//             // คุณอาจต้องจัดการข้อผิดพลาดที่นี่
//         } else {
//             // ลบข้อมูลจากตาราง "news" และ "group_section"
//             dbConnection.query("DELETE news, group_section FROM news LEFT JOIN group_section ON group_section.news_id = news.news_id WHERE news.news_id = ?", [ID], (err) => {
//                 if (err) {
//                     console.error('เกิดข้อผิดพลาดในการลบข้อมูลในตาราง news และ group_section: ' + err.message);
//                     // คุณอาจต้องจัดการข้อผิดพลาดที่นี่
//                 } else {
//                     // ลบข้อมูลเสร็จสมบูรณ์
//                     res.render('home/404page.ejs');
//                 }
//             });
//         }
//     });
// });

module.exports = router;