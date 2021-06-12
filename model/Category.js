const Model = require('./Model')

class Category extends Model {
    // 获取全部类目
    static getCategories() {
            return new Promise((resolve, reject) => {
                const sql = 'SELECT id, `name`, `index` FROM category ORDER BY `index`'
                this.query(sql)
                    .then(resolve)
                    .catch(reject)
            })
        }
        // 根据id获取类目名称
    static getCategoryNameById(categoryId) {
            return new Promise((resolve, reject) => {
                const sql = 'SELECT `name` FROM category WHERE id=?'
                this.query(sql, [categoryId])
                    .then(resolve)
                    .catch(reject)
            })
        }
        // 总类目数
    static getTotalCategory() {
            return new Promise((resolve, reject) => {
                const sql = 'SELECT COUNT(1) as totalCategory FROM category'
                this.query(sql)
                    .then(resolve)
                    .catch(reject)
            })
        }
        // 新增类目
    static insertCategory(category) {
            return new Promise((resolve, reject) => {
                const sql = 'INSERT INTO category SET ?'
                this.query(sql, category)
                    .then(resolve)
                    .catch(reject)
            })
        }
        // 更新类目
    static updateCategory(id, name, index) {
            return new Promise((resolve, reject) => {
                let query = '';
                if (name) {
                    query += '`name`=' + '"' + name + '"'
                }
                if (index) {
                    query += '`index`=' + index
                }
                const sql = 'UPDATE category SET ' + query + ' WHERE id=? '
                this.query(sql, Number(id))
                    .then(resolve)
                    .catch(reject)
            })
        }
        // 删除类目
    static deleteCategory(id) {
        return new Promise((resolve, reject) => {
            const sql = 'DELETE FROM category WHERE id=?'
            this.query(sql, Number(id))
                .then(resolve)
                .catch(reject)
        })
    }
}

module.exports = Category