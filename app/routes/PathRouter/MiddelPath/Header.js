var express = require('express');
const session = require('express-session');
const router = express.Router();
const dbConnection = require('../../connect');
const { ifLoggedin } = require('../../loginRouter/ifLoggedin');
const { ifNotLoggedin } = require('../../loginRouter/ifNotLoggedin');
router.use(express.urlencoded({ extended: false }));

// Root Page
router.get('/', ifNotLoggedin, (req, res, next) => {
    // Your code here
    console.log('Session expires at:', req.session.cookie.expires); // แสดงเวลาหมดอายุของเซสชันในรูปแบบ timestamp
      console.log('Session max age:', req.session.cookie.maxAge); // แสดงค่าเวลาที่เหลืออยู่ในเซสชันในรูปแบบมิลลิวินาที
  
      dbConnection.execute("SELECT * FROM `users` WHERE `id`=?", [req.session.userID])
          .then(([rows]) => {
              if (rows) {
                res.render('home/header', {
                  users: rows,
                  name: req.session.name,
                  role: req.session.role,
                  user_name: req.session.user_name,
                  email: req.session.email,
                  profile_image: req.session.profile_image,
              });  
              }else{
                  res.render('home/header', {
                  name: "Guest",
                  role: "Guest",
                  user_name: "Guest",
                  email: "Guest",
              })
              }
          });
  });
  module.exports = router;