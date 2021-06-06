const express = require('express')
const log = require('../middleware/log')
const loginApp = express()
const User = require('../model/User')

// 登录页面
loginApp.get('/login', (req, res) => {
  res.render('login.html', {msg: ''})
})
// 登录
loginApp.post('/login', async (req, res) => {
  const { username, password } = req.body
  const user = (await User.doLogin(username, password))[0]
  if(user) {
    req.log = {handle: '登录'}
    log.insertLog(req)
    req.session.user = user.username
    res.redirect('/')
  } else {
    res.render('login.html', {msg: '登录失败，账号或密码错误'})
  }
})
loginApp.get('/logout', (req, res) => {
  req.log = {handle: '退出'}
  log.insertLog(req)
  req.session.user = ''
  res.redirect('/')
})

module.exports = loginApp