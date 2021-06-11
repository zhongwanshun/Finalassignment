// 入口文件
const express = require('express')
const app = express()
const cookieSession = require('cookie-session')
const multer = require('multer')
const path = require('path')
const fs = require('fs')
const ejs = require('ejs');
// 设置上传的目录文件夹
const upload = multer({
        dest: './public/upload',
        limits: { fileSize: 1024 * 1024 * 2 } // 单个文件大小限制
    })
    // 模板引擎
app.set('view engine', 'html')
app.engine('html', ejs.__express);
app.set('views', `${__dirname}/views`) // 用ejs模板渲染html

// 静态资源公开
app.use(express.static('public'))
    // 处理post请求参数
    //extended: false：表示使用系统模块querystring来处理，也是官方推荐的
    // extended: true：表示使用第三方模块qs来处理
app.use(express.urlencoded({ extended: true }))
    // 使用session
app.use(cookieSession({
    keys: ['zws'], // 密钥
    maxAge: 1000 * 60 * 60 //有效期
}));
//前端页面实现
// 首页
app.use(/\/(index)?/, require('./routes/index')); // / 或 /index
// 文章
app.use('/article', require('./routes/article'));
// 搜索
app.use('/search', require('./routes/search'));
// 登录
app.use('/user', require('./routes/user'));
//注册
app.use('/register', require('./routes/register'));

// 后台并且权限验证（给他增加一个方法）放在中间件中
app.use('/admin/?*', require('./middleware/auth').allowToAdmin);

// session延时
app.use((req, res, next) => {
    //取下整将获取的时间取下整赋值给左边的属性
    req.session.nowInMinutes = Math.floor(Date.now() / 60e3) // 每分钟更新一次
        //执行下一个中间件
    next()
});
// 后台 - 上传文件(对每次上传单个文件配置)
// single 上传单个文件;upload为前端上传图像的input标签的name值
app.post('/admin/?*', upload.single('upload'), (req, res, next) => {
    // 上传成功的文件对象
    const { file } = req;
    if (file) {
        let extname = path.extname(file.originalname) // 文件后缀名
        fs.renameSync(file.path, file.path + extname) // 上传后的文件路径
            //上传的文件路径和文件名称以及文件后缀
        req.uploadUrl = '/upload/' + file.filename + extname
    };
    next()
});

// 后台 - 首页
app.use('/admin', require('./routes/admin'))
    // 后台 - 文章管理
app.use('/admin/article', require('./routes/admin/article'))
    // 后台 - 类目管理
app.use('/admin/category', require('./routes/admin/category'))
    // 后台 - 查看日志
app.use('/admin/log', require('./routes/admin/log'))
    // 后台 - 账户管理
app.use('/admin/account', require('./routes/admin/account'))
    // 

app.listen(3000, () => { console.log('runing.....3000') })