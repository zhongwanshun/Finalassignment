const express = require('express')
const categoryApp = express()
const category = require('../../middleware/category')
const log = require('../../middleware/log')

// 类目
categoryApp.get('/', [category.getCategories], (req, res) => {
  const {user, categories} = req
  res.render('admin/category', {user, categories})
})
// 新增
categoryApp.post('/insert', category.insertCategory, (req, res) => {
  if(req.affectedRows) {
    req.log = {handle: '新增类目'}
    log.insertLog(req)
    res.json({code: 1, msg: '类目新增成功'})
  } else {
    res.json({code: 0, msg: '类目新增失败'})
  }
})
// 更新
categoryApp.post('/update', category.updateCategory, (req, res) => {
  if(req.affectedRows) {
    req.log = {handle: '更新类目'}
    log.insertLog(req)
    res.json({code: 1, msg: '类目更新成功'})
  } else {
    res.json({code: 0, msg: '类目更新失败'})
  }
})
// 删除
categoryApp.get('/delete', category.deleteCategory, (req, res) => {
  if(req.affectedRows) {
    req.log = {handle: '删除类目'}
    log.insertLog(req)
    res.json({code: 1, msg: '类目删除成功'})
  } else {
    res.json({code: 0, msg: '类目删除失败'})
  }
})

module.exports = categoryApp