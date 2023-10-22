var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.get('/:id', ifNotLoggedin, async (req, res, next) => {
    try {

        // ดึงข้อมูลจาก SQL และดึงข้อมูลการ์ด
        const rows = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 ORDER BY news.news_id DESC");
        // ทำคำสั่ง SQL ดึงข้อมูลสไลด์บาร์ข่าวหลัก
        const top_slidebar = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND approve_news.location_post_id = 1 ORDER BY news.news_id DESC");

        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม 
        //const attention = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND ( news.end IS NULL OR news.end < DATE_SUB(NOW(), INTERVAL 7 DAY)) ORDER BY news.view_count DESC LIMIT 10 ");
        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม หรือข่าวที่ไม่ได้ใส่วันสิ้นสุดกิจกรรม จะหายไปเมื่อครบ 7 วัน
        const attention = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND (news.end IS NULL OR(news.end > DATE_SUB(NOW(), INTERVAL 7 DAY) AND news.time_stamp > DATE_SUB(NOW(), INTERVAL 7 DAY)))ORDER BY news.view_count DESC LIMIT 10");

        if (req.session.role == "ADMIN" || req.session.role == "USER" || req.session.role == "OFFICIAL USER" || req.session.role == "GUEST") {
            const Bookmark = await dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID]);
            const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
            const Count_Like = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");           
            const CommentCounts = Count_Like[0].reduce((bcc, comment) => {
                bcc[comment.c_news_id] = comment.comment_count;
                return bcc;
            }, {});
            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                .then(([likeRows]) => {
                    const likeCounts = likeRows.reduce((acc, like) => {
                        acc[like.like_news_id] = like.like_count;
                        return acc;
                    }, {});
                    
                    // ส่งข้อมูลจำนวนการกดไลค์ไปยัง template
                    res.render('center/Home_Type', {
                        // อื่น ๆ ของข่าว...
                        save_topic:req.session.save_topic,
                        bookmark_id: Bookmark[0],
                        like: Like[0],
                        center: rows,
                        Center: rows[0],
                        attention:attention[0],
                        Top_slidebar: top_slidebar,
                        top_slidebar: top_slidebar[0],
                        role:req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        likeCounts: likeCounts,
                        CommentCounts:CommentCounts,
                        home_website:req.session.website,
                    });
                })
        } else {
            const [rows] = await dbConnection.execute("SELECT * FROM news LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN users ON users.id = news.user_id ;");
            res.render('center/Home_Type', {
                
                center: rows,
                name: "Guest",
                role: "Guest",
                user_name: "Guest",
                email: "Guest",
            });
        }
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
});

router.get('/news/insut', ifNotLoggedin, async (req, res, next) => {
    try {
        // ดึงข้อมูลจาก SQL และดึงข้อมูลการ์ด
        const rows = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND news.news_type_id = 1 ORDER BY news.news_id DESC");
        // ทำคำสั่ง SQL ดึงข้อมูลสไลด์บาร์ข่าวหลัก
        const top_slidebar = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND approve_news.location_post_id = 1 AND news.news_type_id = 1 ORDER BY news.news_id DESC");

        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม 
        //const attention = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND ( news.end IS NULL OR news.end < DATE_SUB(NOW(), INTERVAL 7 DAY)) ORDER BY news.view_count DESC LIMIT 10 ");
        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม หรือข่าวที่ไม่ได้ใส่วันสิ้นสุดกิจกรรม จะหายไปเมื่อครบ 7 วัน
        const attention = await dbConnection.execute("SELECT news.*, users.*, COUNT(like_news_id) AS like_count FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN `like` ON `like`.like_news_id = news.news_id WHERE approve_news.status_id = 2 AND news.news_type_id = 1 AND (news.end IS NULL OR (news.end > DATE_SUB(NOW(), INTERVAL 7 DAY) AND news.time_stamp > DATE_SUB(NOW(), INTERVAL 7 DAY))) GROUP BY news.news_id ORDER BY news.view_count , like_count  DESC LIMIT 10;");
        const event_today = await dbConnection.execute("SELECT news.*, users.*, COUNT(like_news_id) AS like_count FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN `like` ON `like`.like_news_id = news.news_id WHERE approve_news.status_id = 2 AND news.news_type_id = 1 AND ((news.start = CURDATE())OR (news.start > CURDATE() AND news.start <= DATE_ADD(CURDATE(), INTERVAL 7 DAY ) OR CURDATE() <= news.`end`))GROUP BY news.news_id LIMIT 10;");
        if (req.session.role == "ADMIN" || req.session.role == "USER" || req.session.role == "OFFICIAL USER" || req.session.role == "GUEST") {
            const Bookmark = await dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID]);
            const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
            const Count_Like = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
            const save_topic = await dbConnection.execute("SELECT * FROM `save_topic` LEFT JOIN topic ON topic.topic_id = save_topic.s_topic_id");
            const tags = await dbConnection.execute("SELECT * FROM `section`");
            const CommentCounts = Count_Like[0].reduce((bcc, comment) => {
                bcc[comment.c_news_id] = comment.comment_count;
                return bcc;
            }, {});
            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                .then(([likeRows]) => {
                    const likeCounts = likeRows.reduce((acc, like) => {
                        acc[like.like_news_id] = like.like_count;
                        return acc;
                    }, {});

                    req.session.save_topic=save_topic[0];
                    
                    // ส่งข้อมูลจำนวนการกดไลค์ไปยัง template
                    res.render('home/insut/insut', {
                        // อื่น ๆ ของข่าว...
                        save_topic:req.session.save_topic,
                        bookmark_id: Bookmark[0],
                        like: Like[0],
                        center: rows,
                        Center: rows[0],
                        attention:attention[0],
                        Top_slidebar: top_slidebar,
                        top_slidebar: top_slidebar[0],
                        role:req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        likeCounts: likeCounts,
                        CommentCounts:CommentCounts,
                        home_website:req.session.website,
                        tags: tags[0],
                        event_today:event_today[0],
                    });
                })
        } else {
            const [rows] = await dbConnection.execute("SELECT * FROM news LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN users ON users.id = news.user_id ;");
            res.render('home/insut/insut', {
                
                center: rows,
                name: "Guest",
                role: "Guest",
                user_name: "Guest",
                email: "Guest",
            });
        }
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
});

router.get('/news/outsut', ifNotLoggedin, async (req, res, next) => {
    try {
        // ดึงข้อมูลจาก SQL และดึงข้อมูลการ์ด
        const rows = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND news.news_type_id = 2 ORDER BY news.news_id DESC");
        // ทำคำสั่ง SQL ดึงข้อมูลสไลด์บาร์ข่าวหลัก
        const top_slidebar = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND approve_news.location_post_id = 1 AND news.news_type_id = 2 ORDER BY news.news_id DESC");

        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม 
        //const attention = await dbConnection.execute("SELECT users.* , news.* FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id WHERE approve_news.status_id = 2 AND ( news.end IS NULL OR news.end < DATE_SUB(NOW(), INTERVAL 7 DAY)) ORDER BY news.view_count DESC LIMIT 10 ");
        //SQL โชวข่าวเรียงจากที่มีจำนวนเข้าชมเยอะสุด และยังไม่สิ้นสุดเวลากิจกรรม หรือข่าวที่ไม่ได้ใส่วันสิ้นสุดกิจกรรม จะหายไปเมื่อครบ 7 วัน
        const attention = await dbConnection.execute("SELECT news.*, users.*, COUNT(like_news_id) AS like_count FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN `like` ON `like`.like_news_id = news.news_id WHERE approve_news.status_id = 2 AND news.news_type_id = 2 AND (news.end IS NULL OR (news.end > DATE_SUB(NOW(), INTERVAL 7 DAY) AND news.time_stamp > DATE_SUB(NOW(), INTERVAL 7 DAY))) GROUP BY news.news_id ORDER BY news.view_count , like_count  DESC LIMIT 10;");
        const event_today = await dbConnection.execute("SELECT news.*, users.*, COUNT(like_news_id) AS like_count FROM news LEFT JOIN users ON news.user_id = users.id LEFT JOIN approve_news ON approve_news.news_id = news.news_id LEFT JOIN `like` ON `like`.like_news_id = news.news_id WHERE approve_news.status_id = 2 AND news.news_type_id = 2 AND ((news.start = CURDATE())OR (news.start > CURDATE() AND news.start <= DATE_ADD(CURDATE(), INTERVAL 7 DAY ) OR CURDATE() <= news.`end`))GROUP BY news.news_id LIMIT 10;");
        if (req.session.role == "ADMIN" || req.session.role == "USER" || req.session.role == "OFFICIAL USER" || req.session.role == "GUEST") {
            const Bookmark = await dbConnection.execute("SELECT * FROM `bookmark` WHERE b_users_id = ?", [req.session.userID]);
            const Like = await dbConnection.execute("SELECT * FROM `like` WHERE like_user_id = ?", [req.session.userID]);
            const Count_Like = await dbConnection.execute("SELECT c_news_id, COUNT(*) AS comment_count FROM `comment` GROUP BY c_news_id;");
            const save_topic = await dbConnection.execute("SELECT * FROM `save_topic` LEFT JOIN topic ON topic.topic_id = save_topic.s_topic_id");
            const tags = await dbConnection.execute("SELECT * FROM `section`");
            const CommentCounts = Count_Like[0].reduce((bcc, comment) => {
                bcc[comment.c_news_id] = comment.comment_count;
                return bcc;
            }, {});
            dbConnection.execute("SELECT like_news_id, COUNT(*) AS like_count FROM `like` GROUP BY like_news_id;")
                .then(([likeRows]) => {
                    const likeCounts = likeRows.reduce((acc, like) => {
                        acc[like.like_news_id] = like.like_count;
                        return acc;
                    }, {});

                    req.session.save_topic=save_topic[0];
                    
                    // ส่งข้อมูลจำนวนการกดไลค์ไปยัง template
                    res.render('home/outsut/outsut', {
                        // อื่น ๆ ของข่าว...
                        save_topic:req.session.save_topic,
                        bookmark_id: Bookmark[0],
                        like: Like[0],
                        center: rows,
                        Center: rows[0],
                        attention:attention[0],
                        Top_slidebar: top_slidebar,
                        top_slidebar: top_slidebar[0],
                        role:req.session.role,
                        header: req.session.header,
                        profile_image:req.session.profile_image,
                        likeCounts: likeCounts,
                        CommentCounts:CommentCounts,
                        home_website:req.session.website,
                        tags: tags[0],
                        event_today:event_today[0],
                    });
                })
        } else {
            const [rows] = await dbConnection.execute("SELECT * FROM news LEFT JOIN topic ON news.topic_id = topic.topic_id LEFT JOIN news_type ON news.news_type_id = news_type.news_type_id LEFT JOIN users ON users.id = news.user_id ;");
            res.render('home/outsut/outsut', {
                
                center: rows,
                name: "Guest",
                role: "Guest",
                user_name: "Guest",
                email: "Guest",
            });
        }
    } catch (error) {
        // จัดการข้อผิดพลาดที่เกิดขึ้น
        console.error(error);
        res.status(500).send("Internal Server Error");
    }
});
module.exports = router;
