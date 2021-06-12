const Model = require('./Model')

class Article extends Model {
  // 获取热门文章
  static getHot(num) {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT id, title, content, `time`, thumbnail FROM article WHERE hot = 1 LIMIT ?'
      this.query(sql, [num])
        .then(resolve)
        .catch(reject)
    })
  }
  // 获取文章列表
  static getArticles() {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT id, title, content, `time`, thumbnail FROM article ORDER BY `time` DESC'
      this.query(sql)
        .then(resolve)
        .catch(reject)
    })
  }
  // 获取指定类目的文章列表
  static getArticlesByCategoryId(categoryId) {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT id, title, content, `time`, thumbnail FROM article WHERE category_id=? ORDER BY `time` DESC'
      this.query(sql, [categoryId])
        .then(resolve)
        .catch(reject)
    })
  }
  // 文章搜索
  static getArticlesByKeyword(keyword) {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT id, title, content, `time`, thumbnail FROM article WHERE title LIKE ? ORDER BY `time` DESC'
      this.query(sql, [`%${keyword}%`])
        .then(resolve)
        .catch(reject)
    })
  }
  // 文章详情
  static getArticleDetailById(articleId) {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT a.id, a.title, a.content, a.hits, a.hot, a.`time`, a.category_id, a.thumbnail, c.`name` AS category_name FROM article a, category c WHERE a.id=? AND a.category_id = c.id'
      this.query(sql, [articleId])
        .then(resolve)
        .catch(reject)
    })
  }
  // 通过文章id查上一篇
  static getPreArticleById(articleId) {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT id, title FROM article WHERE id < ? ORDER BY id DESC LIMIT 1'
      this.query(sql, [articleId])
        .then(resolve)
        .catch(reject)
    })
  }
  // 通过文章id查下一篇
  static getNextArticleById(articleId) {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT id, title FROM article WHERE id > ? ORDER BY id ASC LIMIT 1'
      this.query(sql, [articleId])
        .then(resolve)
        .catch(reject)
    })
  }
  // 总博文数
  static getTotalArticle(categoryId, hot) {
    return new Promise((resolve, reject) => {
      let query = ''
      if(categoryId&&categoryId!=-1) {
        query += ' AND category_id=' + categoryId
      }
      if(hot&&hot!=-1) {
        query += ' AND hot=' + hot
      }
      const sql = 'SELECT COUNT(1) as totalArticle FROM article WHERE 1=1' + query
      this.query(sql)
        .then(resolve)
        .catch(reject)
    })
  }
  // 后台文章列表
  static getArticlePageList(pageSize, pageNum, categoryId, hot) {
    return new Promise((resolve, reject) => {
      let query = ''
      if(categoryId&&categoryId!=-1) {
        query += ' AND category_id=' + categoryId
      }
      if(hot&&hot!=-1) {
        query += ' AND hot=' + hot
      }
      const sql = 'SELECT id, title, thumbnail, hot FROM article WHERE 1=1' + query + ' ORDER BY time DESC LIMIT ?, ?'
      this.query(sql, [(pageNum - 1) * pageSize, pageSize])
        .then(resolve)
        .catch(reject)
    })
  }
  // 设置热门文章
  static setHot(id, hot) {
    return new Promise((resolve, reject) => {
      const sql = 'UPDATE article SET hot=? WHERE id=?'
      this.query(sql, [hot, id])
        .then(resolve)
        .catch(reject)
    })
  }
  // 新增文章
  static insertArticle(article) {
    return new Promise((resolve, reject) => {
      const sql = 'INSERT INTO article SET ?'
      this.query(sql, [article])
        .then(resolve)
        .catch(reject)
    })
  }
  // 删除文章
  static deleteArticleById(articleId) {
    return new Promise((resolve, reject) => {
      const sql = 'DELETE FROM article WHERE id=?'
      this.query(sql, articleId)
        .then(resolve)
        .catch(reject)
    })
  }
  // 更新文章
  static updateArticleById(article) {
    return new Promise((resolve, reject) => {
      const sql = 'UPDATE article SET title=?, content=?, hot=?, category_id=?, thumbnail=? WHERE id=?'
      this.query(sql, [article.title, article.content, article.hot, article.category_id, article.thumbnail, article.id])
        .then(resolve)
        .catch(reject)
    })
  }
}

module.exports = Article