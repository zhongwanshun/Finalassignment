const express = require('express')
const articleApp = express()
const article = require('../middleware/article')
const category = require('../middleware/category')
const auth = require('../middleware/auth')

// 文章搜索
articleApp.get('/', [article.getArticlesByKeyword, category.getCategories, auth.getUser], (req, res) => {
  const { articles, categories, user } = req
  res.render('search.html', { articles, categories, keyword: req.query.keyword, user })
})

module.exports = articleApp