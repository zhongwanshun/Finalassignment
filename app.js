var createError = require('http-errors');
var express = require('express');
//创建app对象，不然后面用不了
var app = express();

var path = require('path');
var cookieParser = require('cookie-parser');
var cookieSession = require('cookie-session')
var logger = require('morgan');
var path = require('path');
var ejs = require('ejs');
// 引入文件上传的模板
var multer = require('multer');

//对文件上传进行配置(设置一个上传的目录文件夹)
var upload = multer({
    dest: './public/upload',
    limits: { fileSize: 1024 * 1024 * 2 } // 单个文件大小限制
})


//静态资源设置
app.use('/www', express.static('public'));

// 设置模板类型
app.set('html', path.join(__dirname, 'views'));
app.engine('.html', ejs.__express);
app.set('view engine', 'html');

app.use(logger('dev'));
app.use(express.json());
// 处理post 请求参数
//extended: false：表示使用系统模块querystring来处理，也是官方推荐的
// extended: true：表示使用第三方模块qs来处理
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

// 使用session
// sesion是服务端存储数据，session也是一个对象。
// 对session 的操作，就是基本的对象操作。读value 添加 key：value
app.use(cookieSession({
    name: 'zws',
    keys: ['zwsxyj'], //字符串数组
    maxAge: 1024 * 60 * 60
}))

//设置路由
//1.首页路由(请求的路径是/  或者/index的时候都可以，直接请求过去)
app.use(/\/(index)?/, require('./router/index'));




var indexRouter = require('./routes/index');






app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});

module.exports = app;