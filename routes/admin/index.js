const express = require('express')
const indexApp = express()
const userModule = require('../../middleware/user')
const count = require('../../middleware/count')

indexApp.get('/', [
  userModule.lastLoginTime, 
  count.getTotalHits, 
  count.getTotalCategory, 
  count.getTotalArticle
], (req, res) => {
  const {user, lastLoginTime, totalHits, totalArticle, totalCategory} = req
  res.render('admin/index.html', {user, lastLoginTime, totalHits, totalArticle, totalCategory})
})
// 图表json数据
indexApp.get('/getPvs', count.getPv, (req, res) => {
  const { pvs } = req
  const data = {}
  data.start = pvs[0].time
  data.end = pvs[pvs.length - 1].time
  data.data = pvs
  res.json(data)
})

module.exports = indexApp