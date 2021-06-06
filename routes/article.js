const express = require('express')
const articleApp = express()
const article = require('../middleware/article')
const category = require('../middleware/category')
const auth = require('../middleware/auth')

articleApp.use(category.getCategories, auth.getUser)
// 根据类目展示文章
articleApp.get('/list/:categoryId', [article.getArticlesByCategoryId, category.getCategoryNameById], (req, res) => {
  const { articles, categories, categoryName, user } = req
  res.render('list.html', { articles, categories, categoryName, user })
})

// 文章详情
articleApp.get('/detail/:articleId/', 
  [
    article.getArticleDetailById, 
    article.getTabsByArticleId,
    article.getPreArticleById,
    article.getNextArticleById
  ], 
  (req, res) => {
    const { article, categories, tabs, preArticle, nextArticle, user } = req
    res.render('article.html', { article, categories, tabs, preArticle, nextArticle, user })
  }
)
module.exports = articleApp