var express = require('express');
const router = express.Router();
router.use(express.urlencoded({ extended: false }));

const ifNotLoggedin = (req, res, next) => {
  if (!req.session.isLoggedIn) {
    return res.render('login2');
  }
  next();
}
module.exports = {
  ifNotLoggedin
};
