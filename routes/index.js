var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/hello/:name', function(req, res, next) {
   res.json({'message':'你好：' + req.params.name});
});

module.exports = router;
