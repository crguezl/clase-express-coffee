var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/chuchu', function(req, res, next) {
  res.send('hello!!!!!!!!!!!!!!!!!!');
});

module.exports = router;
