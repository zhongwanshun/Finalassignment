const express = require('express')
const log = require('../../middleware/log')
const logApp = express()

// 文章管理
logApp.get('/', [log.getLogList], (req, res) => {
  const {user, pageList} = req
  res.render('admin/log', {user, pageList})
})

module.exports = logApp