var express = require('express');
const router = express.Router();
router.use(express.urlencoded({ extended: false }));

const ifLoggedin = (req, res, next) => {
    if (req.session.isLoggedIn) {
      return res.redirect('home/centerpage');
    }
    next();
  }
// Export router
module.exports = {
    ifLoggedin
};