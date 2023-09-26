var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));


// router.get('/details', ifNotLoggedin, (req, res, next) => {
//     dbConnection.execute("SELECT `name`,`role` FROM `users` WHERE `id`=?", [req.session.userID])
//         .then(([rows]) => {
//             if (rows[0]) {
//                 res.render('user_page/details', {
//                     users: rows,
//                     header: req.session.header,
//                     name: rows[0].name,
//                     role: rows[0].role,
//                     user_name: rows[0].user_name,
//                     email: rows[0].email,
//                     profile_image: req.session.profile_image,
//                 });
//             } else {
//                 res.render('404page')
//             }
//         });
// });


router.get('/:news_id', ifNotLoggedin, async (req, res, next) => {
    try {
        const newsId = req.params.news_id;
        const comment = await dbConnection.execute("SELECT * FROM `comment` LEFT JOIN users ON users.id = comment.c_user_id WHERE c_news_id = ? ORDER BY comment.comment_id DESC;", [newsId]);
        dbConnection.execute("SELECT * FROM `news` LEFT JOIN users ON news.user_id=users.id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN topic ON news.topic_id = topic.topic_id WHERE news.news_id = ?", [newsId])
            .then(([newsRows]) => {
                if (newsRows.length > 0) {
                    const newsData = newsRows[0];
                    const view_count = dbConnection.execute("UPDATE news SET view_count = view_count + 1 WHERE news_id = ?", [newsId]);
                    dbConnection.execute("SELECT * FROM `group_section` LEFT JOIN section ON group_section.section_id = section.section_id WHERE news_id = ?", [newsId])
                        .then(([groupRows]) => {
                            // ตรวจสอบว่ามีข้อมูล group_id หรือไม่
                            if (groupRows.length > 0) {
                                const groupData = groupRows.map(group => ({
                                    group_id: group.group_id,
                                    news_id: group.news_id,
                                    section_name: group.section_name,
                                    section_id: group.section_id
                                }));
                                // แปลงวันที่และเวลาจากฐานข้อมูลเป็นรูปแบบที่ต้องการ

                                res.render('center/details', {
                                    header: req.session.header,
                                    id:req.session.userID,
                                    name: req.session.name,
                                    role: req.session.role,
                                    user_name: req.session.user_name,
                                    email: req.session.email,
                                    profile_image: newsData.profile_image,
                                    newsData: newsData,
                                    email: newsData.email,
                                    groupData: groupData, // ส่งข้อมูล group_id ไปยัง template
                                    formattedDate: newsData.time_stamp, // ส่งวันที่และเวลาที่ถูกแปลงไปยัง template
                                    section_id: newsData.section_id,
                                    view_count: newsData.view_count[0],
                                    comment: comment[0],
                                });
                            } else {
                                res.render('center/details', {
                                    header: req.session.header,
                                    newsData: newsData,
                                    email: newsData.email,
                                    groupData: null, // ไม่พบข้อมูล group_id
                                    view_count: newsData.view_count[0]
                                });
                            }
                        })
                        .catch(error => {
                            console.error(error);
                            res.render('home/404page'); // หรือจัดการข้อผิดพลาดอื่น ๆ
                        });
                } else {
                    res.render('home/404page');
                }
            })
    } catch (error) {
        console.error(error);
        res.render('home/404page');
    }

});
module.exports = router;