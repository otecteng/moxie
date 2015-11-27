var express = require('express');
var router = express.Router();
var uuid = require('uuid');
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
    }else{
      doc = req.body;
    }
    res.send(doc);
  });
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
    doc.words
    res.send(doc.words);
  }).on('error',function(e){
    res.send(e);
  });
});

router.get('/words/:id', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.findOne({ mobile:'123456'}).on('success', function (doc) {
    doc.words
    res.send(doc.words);
  }).on('error',function(e){
    res.send(e);
  });  
});

router.post('/words/delete', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.findOne({ mobile:req.body.mobile}).on('success', function (doc) {
    var idx = doc.words.findIndex(function(i){i.id==req.body.id});
    doc.words.splice(idx,1);
    collection.updateById(doc._id.toString(), doc, function(){
      res.send({ msg: 'ok' });
    });
  });
});

router.post('/words', function(req, res, next) {
  var db = req.db;
  var collection = db.get('userlist');
  collection.findOne({ mobile:req.body.mobile}).on('success', function (doc) {
    req.body.id = uuid.v4();
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
