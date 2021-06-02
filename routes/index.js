var express = require('express');
var router = express.Router();

//请求首页渲染
router.get('/', (req, res) => {
    res.render('index.html');
});

module.exports = router;