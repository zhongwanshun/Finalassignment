const express = require('express')
const article = require('../../middleware/article')
const articleApp = express()
const category = require('../../middleware/category')
const log = require('../../middleware/log')

// 文章列表
articleApp.get('/', [article.getArticlePageList, category.getCategories], (req, res) => {
  const {user, pageList, categories} = req
  const {category, hot} = req.query // 筛选的条件
  res.render('admin/article', {user, pageList, categories, category, hot, code: ''})
})
// 设置热门文章
articleApp.get('/setHot', article.setHot, (req, res) => {
  if(req.affectedRows) {
    req.log = {handle: '设置热门文章'}
    log.insertLog(req)
    res.json({code: 1, msg: '设置成功'})
  } else {
    res.json({code: 0, msg: '设置失败'})
  }
})
// 新增
articleApp.get('/add', [category.getCategories], (req, res) => {
  const {user, categories} = req
  res.render('admin/article/add', {user, categories, code: ''})
})
articleApp.post('/upload', (req, res) => {
  if(req.uploadUrl) {
    res.json({
      uploaded: true,
      url: req.uploadUrl
    })
  } else {
    res.json({
      uploaded: false,
      msg: '上传失败'
    })
  }
})
articleApp.post('/doAdd', [article.insertArticle, category. getCategories], (req, res) => {
  const {user, categories, affectedRows} = req
  if(affectedRows > 0) {
    req.log = {handle: '新增文章'}
    log.insertLog(req)
    res.render('admin/article/add', {user, categories, code: '1'})
  } else {
    res.render('admin/article/add', {user, categories, code: '2'})
  }
})
// 编辑
articleApp.get('/edit/:articleId', [article.getArticleDetailById, category.getCategories], (req, res) => {
  const {user, categories, article} = req
  res.render('admin/article/edit', {user, categories, article, code: ''})
})
articleApp.post('/doEdit/:articleId', [article.updateArticleById, article.getArticleDetailById, category.getCategories], (req, res) => {
  const {affectedRows, user, categories, article} = req
  if(affectedRows > 0) {
    req.log = {handle: '更新文章'}
    log.insertLog(req)
    res.render('admin/article/edit', {user, categories, article, code: '1'})
  } else {
    res.render('admin/article/edit', {user, categories, article, code: '2'})
  }
})
// 删除
articleApp.get('/delete', [article.deleteArticleById, article.getArticlePageList, category.getCategories], (req, res) => {
  const {user, pageList, categories, affectedRows} = req
  const {category, hot} = req.query // 筛选的条件
  if(affectedRows > 0) {
    req.log = {handle: '删除文章'}
    log.insertLog(req)
    res.render('admin/article', {user, pageList, categories, category, hot, code: '1'})
  } else {
    res.render('admin/article', {user, pageList, categories, category, hot, code: '2'})
  }
})

module.exports = articleApp