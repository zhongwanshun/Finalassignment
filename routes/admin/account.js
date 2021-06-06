const express = require('express')
const account = express()

// 账户管理
account.get('/', (req, res) => {
  const {user} = req
  res.render('admin/account', {user})
})

module.exports = account