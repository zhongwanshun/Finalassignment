const express = require('express')
const app = express()
const article = require('../middleware/article')
const category = require('../middleware/category')
const auth = require('../middleware/auth')

app.get('/', [
    article.getHot, 
    article.getArticles, 
    category.getCategories,
    auth.getUser
  ], (req, res) => {
    const { hots, articles, categories, user } = req
    res.render('index.html', { hots, articles, categories, user })
})

module.exports = app