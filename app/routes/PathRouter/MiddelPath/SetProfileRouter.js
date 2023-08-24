var express = require('express');
const session = require('express-session');
const router = express.Router();
//let conn = require('./connect')
const path = require('path');
const cookieSession = require('cookie-session');
const bcrypt = require('bcrypt');
const dbConnection = require('../../connect');
const { body, validationResult, Result } = require('express-validator');


let numeral = require('numeral');
let dayjs = require('dayjs');
let dayFormat = 'DD/MM/YYYY';
const multer = require('multer');
const { group } = require('console');
const { DateTime } = require('luxon'); // นำเข้าแพ็คเกจ luxon
//const app = express();
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

router.use(session({
    secret: 'sessionforprojectecommerce',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 30 * 24 * 60 * 60 * 1000
    }
}))
router.use((req, res, next) => {
    res.locals.session = req.session;
    res.locals.numeral = numeral;
    res.locals.dayjs = dayjs;
    res.locals.dayFormat = dayFormat;
    next();
});

router.get('/', ifNotLoggedin, (req, res, next) => {
    dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
        .then(([rows]) => {
            if (rows[0].role === "USER" || rows[0].role === "OFFICIAL USER" || rows[0].role === "ADMIN") {
                res.render('center/setting_profile', {
                    users: rows,
                    header:req.session.header,
                    name: rows[0].name,
                    role: rows[0].role,
                    user_name: rows[0].user_name,
                    email: rows[0].email,
                    profile_image: req.session.profile_image,
                }); console.log(rows[0].profile_image)
            } else {
                res.redirect('/')
            }
        });
});


const upload_profile = multer({
    storage: multer.diskStorage({
      destination: (req, file, cb) => {
        cb(null, 'public/images/users_picture');
      },
      filename: (req, file, cb) => {
        cb(null, file.originalname);
      }
    })
  });
  
  router.post('/:id', upload_profile.single('profile_image'), ifNotLoggedin, (req, res) => {
      const userId = req.params.id;
      const user_name = req.body['user_name'] || req.session.user_name;
      const name = req.body['name'] || req.session.name;
      const email = req.body['email'] || req.session.email;
      const gender = req.body['gender'] || req.session.gender;
  
      // เช็คว่ามีการอัปโหลดรูปภาพหรือไม่
      if (req.file) { // แก้ไขเป็น req.file แทน req.files
          console.log("if!");
          const imagePath = req.file.path; // เส้นทางไฟล์ภาพที่อัปโหลด
          // ทำการบันทึกเส้นทางไฟล์ภาพลงในฐานข้อมูล หรือในที่นี้คืออัปโหลดไฟล์ภาพไปยังโฟลเดอร์เซิร์ฟเวอร์และบันทึกเส้นทางไฟล์ลงในฐานข้อมูล
          dbConnection.execute("UPDATE users SET user_name= ?,name= ? ,email= ? ,gender= ?, profile_image = ? WHERE id = ?", [user_name, name, email, gender, imagePath, userId])
              .then(() => {
                  // ลบไฟล์รูปภาพเดิมออกจากโฟลเดอร์อัปโหลด (ถ้าต้องการ)
                  // fs.unlinkSync(req.session.profile_image);
                  req.session.profile_image = imagePath; // อัปเดตเส้นทางไฟล์รูปภาพใน session
                  res.redirect('/setting_profile');
                  req.session.message = 'บันทึกสำเร็จ';
              })
              .catch(err => {
                  console.log(err);
                  res.redirect('404page');
              });
      } else {
          console.log("else!");
          // ถ้าไม่มีการอัปโหลดรูปภาพ ให้แก้ไขข้อมูลอื่นๆ โดยไม่เปลี่ยนแปลงรูปภาพ
          dbConnection.execute("UPDATE users SET user_name= ?,name= ? ,email= ? ,gender= ? WHERE id = ?", [user_name, name, email, gender, userId])
              .then(() => {
                  res.redirect('/setting_profile');
                  req.session.message = 'บันทึกสำเร็จ';
              })
              .catch(err => {
                  console.log(err);
                  res.redirect('404page');
              });
      }
  });

  

// Export router
module.exports = router;
