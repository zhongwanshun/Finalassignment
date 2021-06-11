/*
 Navicat Premium Data Transfer

 Source Server         : zws
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 28/05/2021 14:42:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '正文',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '发表时间',
  `hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:非热门 1:热门',
  `hits` int(0) NOT NULL DEFAULT 0 COMMENT '点击量',
  `category_id` int(0) NOT NULL COMMENT '类目编号',
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'JavaScript', '<ul class=\"markdown-toc-list\"><li><a class=\"toc-level-1\" href=\"#引入JavaScript\" level=\"1\">引入JavaScript</a><ul><li><a class=\"toc-level-2\" href=\"#什么是JavaScript\" level=\"2\">什么是JavaScript</a></li><li><a class=\"toc-level-2\" href=\"#JavaScript的组成部分\" level=\"2\">JavaScript的组成部分</a></li><li><a class=\"toc-level-2\" href=\"#在HTML页面中引入JavaScript\" level=\"2\">在HTML页面中引入JavaScript</a><ul><li><a class=\"toc-level-3\" href=\"#内部引入方式\" level=\"3\">内部引入方式</a></li><li><a class=\"toc-level-3\" href=\"#外部引入方式\" level=\"3\">外部引入方式</a></li><li><a class=\"toc-level-3\" href=\"#嵌入引入方式\" level=\"3\">嵌入引入方式</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#向HTML页面输出内容\" level=\"2\">向HTML页面输出内容</a></li><li><a class=\"toc-level-2\" href=\"#显示警告提示框\" level=\"2\">显示警告提示框</a></li><li><a class=\"toc-level-2\" href=\"#JavaScript的运行原理\" level=\"2\">JavaScript的运行原理</a></li><li><a class=\"toc-level-2\" href=\"#注释\" level=\"2\">注释</a><ul><li><a class=\"toc-level-3\" href=\"#单行注释\" level=\"3\">单行注释</a></li><li><a class=\"toc-level-3\" href=\"#多行注释\" level=\"3\">多行注释</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#指令结束符\" level=\"2\">指令结束符</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#变量的声明、赋值和使用\" level=\"1\">变量的声明、赋值和使用</a><ul><li><a class=\"toc-level-2\" href=\"#变量名的命名规范\" level=\"2\">变量名的命名规范</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#变量的数据类型\" level=\"1\">变量的数据类型</a><ul><li><a class=\"toc-level-2\" href=\"#查看某个变量或值的数据类型\" level=\"2\">查看某个变量或值的数据类型</a></li><li><a class=\"toc-level-2\" href=\"#undefined与null的区别\" level=\"2\">undefined与null的区别</a></li><li><a class=\"toc-level-2\" href=\"#判断变量是否为数值(number)类型\" level=\"2\">判断变量是否为数值(number)类型</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#数据类型转换\" level=\"1\">数据类型转换</a><ul><li><a class=\"toc-level-2\" href=\"#变量的数据类型\" level=\"2\">变量的数据类型</a></li><li><a class=\"toc-level-2\" href=\"#隐式类型转换\" level=\"2\">隐式类型转换</a></li><li><a class=\"toc-level-2\" href=\"#强制类型转换\" level=\"2\">强制类型转换</a><ul><li><a class=\"toc-level-3\" href=\"#任意类型转number\" level=\"3\">任意类型转number</a></li><li><a class=\"toc-level-3\" href=\"#任意类型转string\" level=\"3\">任意类型转string</a></li></ul></li></ul></li><li><a class=\"toc-level-1\" href=\"#表达式与运算符\" level=\"1\">表达式与运算符</a><ul><li><a class=\"toc-level-2\" href=\"#什么是表达式\" level=\"2\">什么是表达式</a></li><li><a class=\"toc-level-2\" href=\"#运算符\" level=\"2\">运算符</a></li><li><a class=\"toc-level-2\" href=\"#算术运算的特殊结果NaN和Infinity\" level=\"2\">算术运算的特殊结果NaN和Infinity</a></li><li><a class=\"toc-level-2\" href=\"#== 与 === 的区别\" level=\"2\">== 与 === 的区别</a></li><li><a class=\"toc-level-2\" href=\"#逻辑运算符口诀\" level=\"2\">逻辑运算符口诀</a></li><li><a class=\"toc-level-2\" href=\"#不同类型之间的加法运算\" level=\"2\">不同类型之间的加法运算</a></li><li><a class=\"toc-level-2\" href=\"#三元运算符\" level=\"2\">三元运算符</a></li><li><a class=\"toc-level-2\" href=\"#运算符优先级\" level=\"2\">运算符优先级</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#逻辑控制语句\" level=\"1\">逻辑控制语句</a><ul><li><a class=\"toc-level-2\" href=\"#分支结构\" level=\"2\">分支结构</a><ul><li><a class=\"toc-level-3\" href=\"#if\" level=\"3\">if</a></li><li><a class=\"toc-level-3\" href=\"#switch\" level=\"3\">switch</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#循环结构\" level=\"2\">循环结构</a><ul><li><a class=\"toc-level-3\" href=\"#for\" level=\"3\">for</a></li><li><a class=\"toc-level-3\" href=\"#for-in\" level=\"3\">for-in</a></li><li><a class=\"toc-level-3\" href=\"#while\" level=\"3\">while</a></li><li><a class=\"toc-level-3\" href=\"#do-while\" level=\"3\">do-while</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#控制语句\" level=\"2\">控制语句</a><ul><li><a class=\"toc-level-3\" href=\"#break\" level=\"3\">break</a></li><li><a class=\"toc-level-3\" href=\"#continue\" level=\"3\">continue</a></li></ul></li></ul></li><li><a class=\"toc-level-1\" href=\"#数组\" level=\"1\">数组</a><ul><li><a class=\"toc-level-2\" href=\"#创建数组并给数组中的元素赋值\" level=\"2\">创建数组并给数组中的元素赋值</a><ul><li><a class=\"toc-level-3\" href=\"#方式1：声明后赋值\" level=\"3\">方式1：声明后赋值</a></li><li><a class=\"toc-level-3\" href=\"#方式2：声明并赋值\" level=\"3\">方式2：声明并赋值</a></li><li><a class=\"toc-level-3\" href=\"#方式3：简写形式\" level=\"3\">方式3：简写形式</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#访问数组中的元素\" level=\"2\">访问数组中的元素</a><ul><li><a class=\"toc-level-3\" href=\"#方式一：访问单个元素\" level=\"3\">方式一：访问单个元素</a></li><li><a class=\"toc-level-3\" href=\"#方式二：通过for循环遍历\" level=\"3\">方式二：通过for循环遍历</a></li><li><a class=\"toc-level-3\" href=\"#方式三：通过for-in循环遍历\" level=\"3\">方式三：通过for-in循环遍历</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#修改数组中的元素\" level=\"2\">修改数组中的元素</a></li><li><a class=\"toc-level-2\" href=\"#数组的常用方法和属性\" level=\"2\">数组的常用方法和属性</a><ul><li><a class=\"toc-level-3\" href=\"#length\" level=\"3\">length</a></li><li><a class=\"toc-level-3\" href=\"#join(分隔符)\" level=\"3\">join(分隔符)</a></li><li><a class=\"toc-level-3\" href=\"#sort()\" level=\"3\">sort()</a></li><li><a class=\"toc-level-3\" href=\"#push(x,…,x)\" level=\"3\">push(x,…,x)</a></li><li><a class=\"toc-level-3\" href=\"#pop()\" level=\"3\">pop()</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#数组的长度为动态长度\" level=\"2\">数组的长度为动态长度</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#自定义函数\" level=\"1\">自定义函数</a><ul><li><a class=\"toc-level-2\" href=\"#创建函数\" level=\"2\">创建函数</a><ul><li><a class=\"toc-level-3\" href=\"#无参无返回值\" level=\"3\">无参无返回值</a></li><li><a class=\"toc-level-3\" href=\"#有参无返回值\" level=\"3\">有参无返回值</a></li><li><a class=\"toc-level-3\" href=\"#无参有返回值\" level=\"3\">无参有返回值</a></li><li><a class=\"toc-level-3\" href=\"#有参有返回值\" level=\"3\">有参有返回值</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#调用函数\" level=\"2\">调用函数</a><ul><li><a class=\"toc-level-3\" href=\"#在JS中调用\" level=\"3\">在JS中调用</a></li><li><a class=\"toc-level-3\" href=\"#在HTML标签中调用\" level=\"3\">在HTML标签中调用</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#函数调用注意事项\" level=\"2\">函数调用注意事项</a></li><li><a class=\"toc-level-2\" href=\"#匿名函数创建与调用\" level=\"2\">匿名函数创建与调用</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#常用事件\" level=\"1\">常用事件</a><ul><li><a class=\"toc-level-2\" href=\"#onload\" level=\"2\">onload</a></li><li><a class=\"toc-level-2\" href=\"#onclick\" level=\"2\">onclick</a></li><li><a class=\"toc-level-2\" href=\"#onmouseover，onmouseout，onmousedown\" level=\"2\">onmouseover，onmouseout，onmousedown</a></li><li><a class=\"toc-level-2\" href=\"#onkeydown\" level=\"2\">onkeydown</a></li><li><a class=\"toc-level-2\" href=\"#onchange\" level=\"2\">onchange</a></li><li><a class=\"toc-level-2\" href=\"#动态给元素绑定事件\" level=\"2\">动态给元素绑定事件</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#window对象\" level=\"1\">window对象</a><ul><li><a class=\"toc-level-2\" href=\"#prompt(提示,默认值)\" level=\"2\">prompt(提示,默认值)</a></li><li><a class=\"toc-level-2\" href=\"#alert(信息)\" level=\"2\">alert(信息)</a></li><li><a class=\"toc-level-2\" href=\"#confirm(信息)\" level=\"2\">confirm(信息)</a></li><li><a class=\"toc-level-2\" href=\"#close()\" level=\"2\">close()</a></li><li><a class=\"toc-level-2\" href=\"#open(URL,窗口名,窗口特征，是否替换浏览历史中的当前条目)\" level=\"2\">open(URL,窗口名,窗口特征，是否替换浏览历史中的当前条目)</a></li><li><a class=\"toc-level-2\" href=\"#setTimeout(方法名,毫秒数,参数)\" level=\"2\">setTimeout(方法名,毫秒数,参数)</a></li><li><a class=\"toc-level-2\" href=\"#setInterval(方法名,毫秒数,参数),clearInterval()\" level=\"2\">setInterval(方法名,毫秒数,参数),clearInterval()</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#history对象\" level=\"1\">history对象</a><ul><li><a class=\"toc-level-2\" href=\"#back()\" level=\"2\">back()</a></li><li><a class=\"toc-level-2\" href=\"#forward()\" level=\"2\">forward()</a></li><li><a class=\"toc-level-2\" href=\"#go(n)\" level=\"2\">go(n)</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#location对象\" level=\"1\">location对象</a><ul><li><a class=\"toc-level-2\" href=\"#host\" level=\"2\">host</a></li><li><a class=\"toc-level-2\" href=\"#hostname\" level=\"2\">hostname</a></li><li><a class=\"toc-level-2\" href=\"#href\" level=\"2\">href</a></li><li><a class=\"toc-level-2\" href=\"#reload()\" level=\"2\">reload()</a></li><li><a class=\"toc-level-2\" href=\"#replace(URL地址)\" level=\"2\">replace(URL地址)</a></li><li><a class=\"toc-level-2\" href=\"#replace()和location.href的区别\" level=\"2\">replace()和location.href的区别</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#document对象\" level=\"1\">document对象</a><ul><li><a class=\"toc-level-2\" href=\"#referrer\" level=\"2\">referrer</a></li><li><a class=\"toc-level-2\" href=\"#URL\" level=\"2\">URL</a></li><li><a class=\"toc-level-2\" href=\"#document.URL与locathion.href的区别\" level=\"2\">document.URL与locathion.href的区别</a></li><li><a class=\"toc-level-2\" href=\"#getElementById(id值)\" level=\"2\">getElementById(id值)</a></li><li><a class=\"toc-level-2\" href=\"#getElementsByName(name值)\" level=\"2\">getElementsByName(name值)</a></li><li><a class=\"toc-level-2\" href=\"#getElementsByTagName(标签名)\" level=\"2\">getElementsByTagName(标签名)</a></li><li><a class=\"toc-level-2\" href=\"#getElementsByClassName(class值)\" level=\"2\">getElementsByClassName(class值)</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#element对象\" level=\"1\">element对象</a><ul><li><a class=\"toc-level-2\" href=\"#常用节点信息属性\" level=\"2\">常用节点信息属性</a></li><li><a class=\"toc-level-2\" href=\"#常用节点对象属性\" level=\"2\">常用节点对象属性</a></li><li><a class=\"toc-level-2\" href=\"#解决获取节点元素对象的兼容性问题\" level=\"2\">解决获取节点元素对象的兼容性问题</a></li><li><a class=\"toc-level-2\" href=\"#操作节点的属性\" level=\"2\">操作节点的属性</a></li><li><a class=\"toc-level-2\" href=\"#创建、插入、删除和替换节点\" level=\"2\">创建、插入、删除和替换节点</a></li><li><a class=\"toc-level-2\" href=\"#className\" level=\"2\">className</a></li><li><a class=\"toc-level-2\" href=\"#获取元素的样式\" level=\"2\">获取元素的样式</a></li><li><a class=\"toc-level-2\" href=\"#元素位置属性\" level=\"2\">元素位置属性</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#style对象\" level=\"1\">style对象</a><ul><li><a class=\"toc-level-2\" href=\"#获取某个元素的style对象\" level=\"2\">获取某个元素的style对象</a></li><li><a class=\"toc-level-2\" href=\"#操纵元素的style样式\" level=\"2\">操纵元素的style样式</a><ul><li><a class=\"toc-level-3\" href=\"#backgroundColor\" level=\"3\">backgroundColor</a></li><li><a class=\"toc-level-3\" href=\"#backgroundImage\" level=\"3\">backgroundImage</a></li><li><a class=\"toc-level-3\" href=\"#backgroundRepeat\" level=\"3\">backgroundRepeat</a></li><li><a class=\"toc-level-3\" href=\"#fontSize\" level=\"3\">fontSize</a></li><li><a class=\"toc-level-3\" href=\"#fontWeight\" level=\"3\">fontWeight</a></li><li><a class=\"toc-level-3\" href=\"#textAlign\" level=\"3\">textAlign</a></li><li><a class=\"toc-level-3\" href=\"#textDecoration\" level=\"3\">textDecoration</a></li><li><a class=\"toc-level-3\" href=\"#font\" level=\"3\">font</a></li><li><a class=\"toc-level-3\" href=\"#color\" level=\"3\">color</a></li><li><a class=\"toc-level-3\" href=\"#padding\" level=\"3\">padding</a></li><li><a class=\"toc-level-3\" href=\"#paddingTop，paddingBottom，paddingLeft，paddingRight\" level=\"3\">paddingTop，paddingBottom，paddingLeft，paddingRight</a></li><li><a class=\"toc-level-3\" href=\"#border\" level=\"3\">border</a></li><li><a class=\"toc-level-3\" href=\"#borderTop，borderBottom，borderLeft，borderRight\" level=\"3\">borderTop，borderBottom，borderLeft，borderRight</a></li></ul></li></ul></li><li><a class=\"toc-level-1\" href=\"#String对象\" level=\"1\">String对象</a><ul><li><a class=\"toc-level-2\" href=\"#length\" level=\"2\">length</a></li><li><a class=\"toc-level-2\" href=\"#indexOf(str,index)\" level=\"2\">indexOf(str,index)</a></li><li><a class=\"toc-level-2\" href=\"#charAt(index)\" level=\"2\">charAt(index)</a></li><li><a class=\"toc-level-2\" href=\"#toLowerCase()\" level=\"2\">toLowerCase()</a></li><li><a class=\"toc-level-2\" href=\"#toUpperCase()\" level=\"2\">toUpperCase()</a></li><li><a class=\"toc-level-2\" href=\"#substring(index1,index2)\" level=\"2\">substring(index1,index2)</a></li><li><a class=\"toc-level-2\" href=\"#split(str)\" level=\"2\">split(str)</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#Date对象\" level=\"1\">Date对象</a><ul><li><a class=\"toc-level-2\" href=\"#创建Date对象\" level=\"2\">创建Date对象</a></li><li><a class=\"toc-level-2\" href=\"#getDate()\" level=\"2\">getDate()</a></li><li><a class=\"toc-level-2\" href=\"#getDay()\" level=\"2\">getDay()</a></li><li><a class=\"toc-level-2\" href=\"#getHours()\" level=\"2\">getHours()</a></li><li><a class=\"toc-level-2\" href=\"#getMinutes()\" level=\"2\">getMinutes()</a></li><li><a class=\"toc-level-2\" href=\"#getSeconds()\" level=\"2\">getSeconds()</a></li><li><a class=\"toc-level-2\" href=\"#getMonth()\" level=\"2\">getMonth()</a></li><li><a class=\"toc-level-2\" href=\"#getFullYear()\" level=\"2\">getFullYear()</a></li><li><a class=\"toc-level-2\" href=\"#getTime()\" level=\"2\">getTime()</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#Math对象\" level=\"1\">Math对象</a><ul><li><a class=\"toc-level-2\" href=\"#Math.ceil()\" level=\"2\">Math.ceil()</a></li><li><a class=\"toc-level-2\" href=\"#Math.floor()\" level=\"2\">Math.floor()</a></li><li><a class=\"toc-level-2\" href=\"#Math.round()\" level=\"2\">Math.round()</a></li><li><a class=\"toc-level-2\" href=\"#Math.random()\" level=\"2\">Math.random()</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#自定义对象\" level=\"1\">自定义对象</a><ul><li><a class=\"toc-level-2\" href=\"#创建对象\" level=\"2\">创建对象</a></li><li><a class=\"toc-level-2\" href=\"#instanceof\" level=\"2\">instanceof</a></li><li><a class=\"toc-level-2\" href=\"#constructor\" level=\"2\">constructor</a></li><li><a class=\"toc-level-2\" href=\"#对象的继承\" level=\"2\">对象的继承</a><ul><li><a class=\"toc-level-3\" href=\"#通过原型链实现继承\" level=\"3\">通过原型链实现继承</a></li><li><a class=\"toc-level-3\" href=\"#通过调用父类的构造方法实现继承\" level=\"3\">通过调用父类的构造方法实现继承</a></li><li><a class=\"toc-level-3\" href=\"#通过原型链和调用父类构造方法的混合模式实现继承\" level=\"3\">通过原型链和调用父类构造方法的混合模式实现继承</a></li></ul></li></ul></li><li><a class=\"toc-level-1\" href=\"#正则表达式\" level=\"1\">正则表达式</a><ul><li><a class=\"toc-level-2\" href=\"#创建正则表达式对象\" level=\"2\">创建正则表达式对象</a><ul><li><a class=\"toc-level-3\" href=\"#附加参数\" level=\"3\">附加参数</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#匹配数据\" level=\"2\">匹配数据</a><ul><li><a class=\"toc-level-3\" href=\"#exec()\" level=\"3\">exec()</a></li><li><a class=\"toc-level-3\" href=\"#test()\" level=\"3\">test()</a></li></ul></li><li><a class=\"toc-level-2\" href=\"#正则表达式符号\" level=\"2\">正则表达式符号</a></li></ul></li><li><a class=\"toc-level-1\" href=\"#表单自定义错误信息\" level=\"1\">表单自定义错误信息</a><ul><li><a class=\"toc-level-2\" href=\"#获取validityState对象\" level=\"2\">获取validityState对象</a></li><li><a class=\"toc-level-2\" href=\"#validityState常用属性\" level=\"2\">validityState常用属性</a><ul><li><a class=\"toc-level-3\" href=\"#valueMissing\" level=\"3\">valueMissing</a></li><li><a class=\"toc-level-3\" href=\"#typeMismatch\" level=\"3\">typeMismatch</a></li><li><a class=\"toc-level-3\" href=\"#patternMismatch\" level=\"3\">patternMismatch</a></li><li><a class=\"toc-level-3\" href=\"#tooLong\" level=\"3\">tooLong</a></li><li><a class=\"toc-level-3\" href=\"#rangeUnderflow\" level=\"3\">rangeUnderflow</a></li><li><a class=\"toc-level-3\" href=\"#rangeOverflow\" level=\"3\">rangeOverflow</a></li><li><a class=\"toc-level-3\" href=\"#stepMismatch\" level=\"3\">stepMismatch</a></li><li><a class=\"toc-level-3\" href=\"#customError\" level=\"3\">customError</a><ul></ul></li></ul></li></ul></li></ul>', '2021-04-13 14:51:32', 1, 100, 1, NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '类目名称',
  `index` int(0) NOT NULL DEFAULT 0 COMMENT '排序，值越大越靠前',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '文章类目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------


INSERT INTO `category` VALUES (1, 'Java', 0);
INSERT INTO `category` VALUES (2, 'web', 0);
INSERT INTO `category` VALUES (3, '数据结构', 0);


-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `handle` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '操作内容',
  `time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '来源IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, '登录', '2021-05-27 11:22:46', '114.235.246.154');
INSERT INTO `log` VALUES (2, '添加类目', '2021-05-06 16:11:50', '114.235.246.154');
INSERT INTO `log` VALUES (3, '添加博文', '2021-05-06 16:12:00', '114.235.246.154');
INSERT INTO `log` VALUES (4, '添加博文', '2021-05-27 11:22:21', '114.235.246.154');
INSERT INTO `log` VALUES (5, '登录', '2021-05-27 11:23:10', '49.81.173.95');
INSERT INTO `log` VALUES (6, '编辑博文', '2021-05-27 11:23:29', '49.81.173.95');
INSERT INTO `log` VALUES (7, '添加类目', '2021-05-27 11:23:47', '49.81.173.95');
INSERT INTO `log` VALUES (8, '添加博文', '2021-05-27 11:24:02', '49.81.173.95');


-- ----------------------------
-- Table structure for pv
-- ----------------------------
DROP TABLE IF EXISTS `pv`;
CREATE TABLE `pv`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `time` date NOT NULL COMMENT '日期',
  `hits` int(0) NOT NULL DEFAULT 0 COMMENT '点击量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 638 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '访问记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pv
-- ----------------------------

INSERT INTO `pv` VALUES (1, '2021-01-25', 9);
INSERT INTO `pv` VALUES (2, '2021-01-26', 12);
INSERT INTO `pv` VALUES (3, '2021-01-27', 22);
INSERT INTO `pv` VALUES (4, '2021-04-28', 15);
INSERT INTO `pv` VALUES (5, '2021-04-29', 18);
INSERT INTO `pv` VALUES (6, '2021-04-30', 7);
INSERT INTO `pv` VALUES (7, '2021-04-31', 19);
INSERT INTO `pv` VALUES (8, '2021-06-01', 19);
INSERT INTO `pv` VALUES (9, '2021-06-02', 24);
INSERT INTO `pv` VALUES (10, '2021-06-03', 19);
INSERT INTO `pv` VALUES (11, '2021-05-04', 18);
INSERT INTO `pv` VALUES (12, '2021-05-05', 19);
INSERT INTO `pv` VALUES (13, '2021-05-06', 15);
INSERT INTO `pv` VALUES (14, '2021-05-07', 10);
INSERT INTO `pv` VALUES (15, '2021-05-08', 17);
INSERT INTO `pv` VALUES (16, '2021-05-09', 15);
INSERT INTO `pv` VALUES (17, '2021-05-10', 36);
INSERT INTO `pv` VALUES (18, '2021-05-11', 30);
INSERT INTO `pv` VALUES (19, '2021-05-12', 47);
INSERT INTO `pv` VALUES (20, '2021-05-13', 58);
INSERT INTO `pv` VALUES (21, '2021-05-14', 43);
INSERT INTO `pv` VALUES (22, '2021-05-15', 38);
INSERT INTO `pv` VALUES (23, '2021-05-16', 47);
INSERT INTO `pv` VALUES (24, '2021-05-17', 46);
INSERT INTO `pv` VALUES (25, '2021-05-18', 34);
INSERT INTO `pv` VALUES (26, '2021-05-19', 45);
INSERT INTO `pv` VALUES (27, '2021-05-20', 33);
INSERT INTO `pv` VALUES (28, '2021-05-21', 59);
INSERT INTO `pv` VALUES (29, '2021-05-22', 52);
INSERT INTO `pv` VALUES (30, '2021-05-23', 45);
INSERT INTO `pv` VALUES (31, '2021-05-24', 39);
INSERT INTO `pv` VALUES (32, '2021-05-25', 39);
INSERT INTO `pv` VALUES (33, '2021-05-26', 53);
INSERT INTO `pv` VALUES (34, '2021-05-27', 10);

-- ----------------------------
-- Table structure for tabs
-- ----------------------------
DROP TABLE IF EXISTS `tabs`;
CREATE TABLE `tabs`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '标签名称',
  `article_id` int(0) NOT NULL COMMENT '所属文章编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tabs
-- ----------------------------
INSERT INTO `tabs` VALUES (1, 'JavaScript', 1);
INSERT INTO `tabs` VALUES (2, 'web前端', 1);
INSERT INTO `tabs` VALUES (3, 'JS脚本', 1);
INSERT INTO `tabs` VALUES (4, 'CSS3', 2);
INSERT INTO `tabs` VALUES (5, 'web前端', 2);
INSERT INTO `tabs` VALUES (6, 'HTML5', 3);
INSERT INTO `tabs` VALUES (7, 'web前端', 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456');
INSERT INTO `user` VALUES (2, 'zhangsan', '123456');
INSERT INTO `user` VALUES (3, 'lisi', '0000');
INSERT INTO `user` VALUES (4, '1572662085', '520134');

SET FOREIGN_KEY_CHECKS = 1;
