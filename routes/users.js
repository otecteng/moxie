var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.find({},{},function(e,docs){
    res.json(docs);
  });
});

router.post('/', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.findOne({ mobile:req.body.mobile}).on('success', function (doc) {
    if(!doc){
      collection.insert(req.body);
    }
  });
  res.send({ msg: 'ok' });
});

router.post('/login', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.find({ mobile:req.body.mobile}, {}, function (e,docs) {
    res.send(docs.length>0);
  });
});

router.get('/words', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.findOne({ mobile:'123456'}).on('success', function (doc) {
    res.send(doc.words);
  });
});

router.post('/words', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.findOne({ mobile:req.body.mobile}).on('success', function (doc) {
    if(!doc.words){
      doc.words =[req.body];
    }else{
      doc.words.push(req.body);
    }
    collection.updateById(doc._id.toString(), doc, function(){
      res.send({ msg: 'ok' });
    });
  });  
});

module.exports = router;
