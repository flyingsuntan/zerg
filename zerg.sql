/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : zerg

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 17/07/2020 10:14:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'banner名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `delete_time` int(11) NOT NULL COMMENT '删除时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '首页置顶', '首页轮播图', 0, 0);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `img_id` int(11) UNSIGNED NOT NULL COMMENT '图片id',
  `key_word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行关键字',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '跳转类型，可能导向商品',
  `delete_time` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL COMMENT 'banner_id',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES (1, 65, '6', 1, 0, 1, 0);
INSERT INTO `banner_item` VALUES (2, 2, '25', 1, 0, 1, 0);
INSERT INTO `banner_item` VALUES (3, 3, '11', 1, 0, 1, 0);
INSERT INTO `banner_item` VALUES (5, 1, '10', 1, 0, 1, 0);

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图书名称',
  `price` double(10, 2) NULL DEFAULT 0.00 COMMENT '价格',
  `bookCount` int(11) NULL DEFAULT 0 COMMENT '数量',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '作者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '语文', 10.00, 200, '你猜');
INSERT INTO `books` VALUES (2, '数学', 10.00, 100, '人民出版社');
INSERT INTO `books` VALUES (3, '物理', 20.00, 200, '工业出版社');
INSERT INTO `books` VALUES (4, '化学', 20.00, 200, '我也不知道');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分裂名称',
  `topic_img_id` int(11) NOT NULL COMMENT 'img_id',
  `delete_time` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '果味', 6, 0, '', 0);
INSERT INTO `category` VALUES (3, '蔬菜', 5, 0, '', 0);
INSERT INTO `category` VALUES (4, '炒货', 7, 0, '', 0);
INSERT INTO `category` VALUES (5, '点心', 4, 0, '', 0);
INSERT INTO `category` VALUES (6, '粗茶', 8, 0, '', 0);
INSERT INTO `category` VALUES (7, '淡饭', 0, 0, '', 0);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL COMMENT '1.来自本地 2.来自公网',
  `delete_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (2, '/banner-2a.png', 1, 0, 0);
INSERT INTO `image` VALUES (3, '/banner-3a.png', 1, 0, 0);
INSERT INTO `image` VALUES (4, '/category-cake.png', 1, 0, 0);
INSERT INTO `image` VALUES (5, '/category-vg.png', 1, 0, 0);
INSERT INTO `image` VALUES (6, '/category-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (7, '/category-fry-a.png', 1, 0, 0);
INSERT INTO `image` VALUES (8, '/category-tea.png', 1, 0, 0);
INSERT INTO `image` VALUES (9, '/category-rice.png', 1, 0, 0);
INSERT INTO `image` VALUES (10, '/product-dryfruit@1.png', 1, 0, 0);
INSERT INTO `image` VALUES (13, '/product-vg@1.png', 1, 0, 0);
INSERT INTO `image` VALUES (14, '/product-rice@6.png', 1, 0, 0);
INSERT INTO `image` VALUES (16, '/1@theme.png', 1, 0, 0);
INSERT INTO `image` VALUES (17, '/2@theme.png', 1, 0, 0);
INSERT INTO `image` VALUES (18, '/3@theme.png', 1, 0, 0);
INSERT INTO `image` VALUES (19, '/detail-1@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (20, '/detail-2@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (21, '/detail-3@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (22, '/detail-4@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (23, '/detail-5@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (24, '/detail-6@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (25, '/detail-7@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (26, '/detail-8@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (27, '/detail-9@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (28, '/detail-11@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (29, '/detail-10@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (31, '/product-rice@1.png', 1, 0, 0);
INSERT INTO `image` VALUES (32, '/product-tea@1.png', 1, 0, 0);
INSERT INTO `image` VALUES (33, '/product-dryfruit@2.png', 1, 0, 0);
INSERT INTO `image` VALUES (36, '/product-dryfruit@3.png', 1, 0, 0);
INSERT INTO `image` VALUES (37, '/product-dryfruit@4.png', 1, 0, 0);
INSERT INTO `image` VALUES (38, '/product-dryfruit@5.png', 1, 0, 0);
INSERT INTO `image` VALUES (39, '/product-dryfruit-a@6.png', 1, 0, 0);
INSERT INTO `image` VALUES (40, '/product-dryfruit@7.png', 1, 0, 0);
INSERT INTO `image` VALUES (41, '/product-rice@2.png', 1, 0, 0);
INSERT INTO `image` VALUES (42, '/product-rice@3.png', 1, 0, 0);
INSERT INTO `image` VALUES (43, '/product-rice@4.png', 1, 0, 0);
INSERT INTO `image` VALUES (49, '/1@theme-head.png', 1, 0, 0);
INSERT INTO `image` VALUES (50, '/2@theme-head.png', 1, 0, 0);
INSERT INTO `image` VALUES (44, '/product-fry@1.png', 1, 0, 0);
INSERT INTO `image` VALUES (45, '/product-fry@2.png', 1, 0, 0);
INSERT INTO `image` VALUES (46, '/product-fry@3.png', 1, 0, 0);
INSERT INTO `image` VALUES (47, '/product-tea@2.png', 1, 0, 0);
INSERT INTO `image` VALUES (48, '/product-tea@3.png', 1, 0, 0);
INSERT INTO `image` VALUES (52, '/product-cake@1.png', 1, 0, 0);
INSERT INTO `image` VALUES (53, '/product-cake@2.png', 1, 0, 0);
INSERT INTO `image` VALUES (54, '/product-cake-a@3.png', 1, 0, 0);
INSERT INTO `image` VALUES (55, '/product-cake-a@4.png', 1, 0, 0);
INSERT INTO `image` VALUES (56, '/product-drygruit@8.png', 1, 0, 0);
INSERT INTO `image` VALUES (57, '/product-fry@4.png', 1, 0, 0);
INSERT INTO `image` VALUES (58, '/product-fry@5.png', 1, 0, 0);
INSERT INTO `image` VALUES (59, '/product-rice@5.png', 1, 0, 0);
INSERT INTO `image` VALUES (60, '/product-rice@7.png', 1, 0, 0);
INSERT INTO `image` VALUES (66, '/product-vg@4.png', 1, 0, 0);
INSERT INTO `image` VALUES (67, '/product-vg@5.png', 1, 0, 0);
INSERT INTO `image` VALUES (68, '/product-vg@2.png', 1, 0, 0);
INSERT INTO `image` VALUES (69, '/product-vg@3.png', 1, 0, 0);
INSERT INTO `image` VALUES (62, '/detail-12@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (63, '/detail-13@1-dryfruit.png', 1, 0, 0);
INSERT INTO `image` VALUES (65, '/banner-4a.png', 1, 0, 0);
INSERT INTO `image` VALUES (51, '/3@theme-head.png', 1, 0, 0);
INSERT INTO `image` VALUES (1, '/banner-1a.png', 1, 0, 0);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '价格',
  `stock` int(25) NOT NULL COMMENT '库存',
  `delete_time` int(11) NOT NULL COMMENT '删除时间',
  `category_id` mediumint(9) NOT NULL COMMENT '分类id',
  `main_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT 1,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img_id` mediumint(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '芹菜 半斤', 0.01, 998, 0, 3, '/product-vg@1.png', 1, 0, 0, '', 13);
INSERT INTO `product` VALUES (2, '梨花带雨 3个', 0.01, 984, 0, 2, '/product-dryfruit@1.png', 1, 0, 0, '', 10);
INSERT INTO `product` VALUES (3, '泰米 327克', 0.01, 998, 0, 7, '/product-rice@1.png', 1, 0, 0, '', 31);
INSERT INTO `product` VALUES (4, '红柚枸杞 6克*3袋', 0.01, 998, 0, 6, '/product-tea@1.png', 1, 0, 0, '', 32);
INSERT INTO `product` VALUES (5, '春生龙眼 500克', 0.01, 969, 0, 2, '/product-dryfruit@2.png', 1, 0, 0, '', 33);
INSERT INTO `product` VALUES (6, '小红的猪耳朵 120克', 0.01, 953, 0, 5, '/product-cake@2.png', 1, 0, 0, '', 53);
INSERT INTO `product` VALUES (7, '泥蒿 半斤', 0.01, 999, 0, 3, '/product-vg@2.png', 1, 0, 0, '', 68);
INSERT INTO `product` VALUES (8, '夏日芒果 3个', 0.01, 999, 0, 2, '/product-dryfruit@3.png', 1, 0, 0, '', 36);
INSERT INTO `product` VALUES (9, '冬木红枣 500克', 0.01, 999, 0, 2, '/product-dryfruit@4.png', 1, 0, 0, '', 37);
INSERT INTO `product` VALUES (10, '万紫千凤梨 300克', 0.01, 999, 0, 2, '/product-dryfruit@5.png', 1, 0, 0, '', 38);
INSERT INTO `product` VALUES (11, '贵妃笑 100克', 0.01, 999, 0, 2, '/product-dryfruit-a@6.png', 1, 0, 0, '', 39);
INSERT INTO `product` VALUES (12, '珍奇异果 3个', 0.01, 999, 0, 2, '/product-dryfruit@7.png', 1, 0, 0, '', 40);
INSERT INTO `product` VALUES (13, '绿豆 125克', 0.01, 999, 0, 7, 'product-rice@2.png', 1, 0, 0, '', 41);
INSERT INTO `product` VALUES (14, '芝麻 50克', 0.01, 999, 0, 7, 'product-rice@3.png', 1, 0, 0, '', 42);
INSERT INTO `product` VALUES (15, '猴头菇 370克', 0.01, 999, 0, 7, 'product-rice@4.png', 1, 0, 0, '', 43);
INSERT INTO `product` VALUES (16, '西红柿 1斤', 0.01, 999, 0, 3, '/product-vg@3.png', 1, 0, 0, '', 69);
INSERT INTO `product` VALUES (17, '油炸花生 300克', 0.01, 999, 0, 4, '/product-fry@1.png', 1, 0, 0, '', 44);
INSERT INTO `product` VALUES (18, '春泥西瓜子 128克', 0.01, 999, 0, 4, '/product-fry@2.png', 1, 0, 0, '', 45);
INSERT INTO `product` VALUES (19, '碧水葵花籽 128克', 0.01, 999, 0, 4, '/product-fry@3.png', 1, 0, 0, '', 46);
INSERT INTO `product` VALUES (20, '碧螺春 12克*3袋', 0.01, 999, 0, 6, '/product-tea@2.png', 1, 0, 0, '', 47);
INSERT INTO `product` VALUES (21, '西湖龙井 8克*3袋', 0.01, 999, 0, 6, '/product-tea@3.png', 1, 0, 0, '', 48);
INSERT INTO `product` VALUES (22, '梅兰清花糕 1个', 0.01, 999, 0, 5, '/product-cake-a@3.png', 1, 0, 0, '', 54);
INSERT INTO `product` VALUES (23, '清凉薄荷糕 1个', 0.01, 999, 0, 5, '/product-cake-a@4.png', 1, 0, 0, '', 55);
INSERT INTO `product` VALUES (25, '小明的妙脆角 120克', 0.01, 999, 0, 5, '/product-cake@1.png', 1, 0, 0, '', 52);
INSERT INTO `product` VALUES (26, '红衣青瓜子 160克', 0.01, 999, 0, 2, '/product-drygruit@8.png', 1, 0, 0, '', 56);
INSERT INTO `product` VALUES (27, '秀色瓜子 100克', 0.01, 999, 0, 4, '/product-fry@4.png', 1, 0, 0, '', 57);
INSERT INTO `product` VALUES (28, '春泥花生 200克', 0.01, 999, 0, 4, '/product-fry@5.png', 1, 0, 0, '', 58);
INSERT INTO `product` VALUES (29, '冰心鸡蛋 2个', 0.01, 999, 0, 7, '/product-rice@5.png', 1, 0, 0, '', 59);
INSERT INTO `product` VALUES (30, '八宝莲子 200克', 0.01, 999, 0, 7, '/product-rice@6.png', 1, 0, 0, '', 14);
INSERT INTO `product` VALUES (31, '深山木耳 78克', 0.01, 999, 0, 7, '/product-rice@7.png', 1, 0, 0, '', 60);
INSERT INTO `product` VALUES (32, '土豆 半斤', 0.01, 999, 0, 3, '/product-vg@4.png', 1, 0, 0, '', 66);
INSERT INTO `product` VALUES (33, '青椒 半斤', 0.01, 999, 0, 3, '/product-vg@5.png', 1, 0, 0, '', 67);

-- ----------------------------
-- Table structure for special
-- ----------------------------
DROP TABLE IF EXISTS `special`;
CREATE TABLE `special`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for student_batch
-- ----------------------------
DROP TABLE IF EXISTS `student_batch`;
CREATE TABLE `student_batch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '姓名',
  `sex` int(1) NULL DEFAULT 0 COMMENT '性别',
  `age` int(5) NULL DEFAULT 0 COMMENT '年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_batch
-- ----------------------------
INSERT INTO `student_batch` VALUES (1, '学生1', 1, 11);
INSERT INTO `student_batch` VALUES (2, '学生1', 0, 11);
INSERT INTO `student_batch` VALUES (3, '学生1', 1, 12);
INSERT INTO `student_batch` VALUES (4, '学生1', 0, 10);
INSERT INTO `student_batch` VALUES (5, '学生1', 1, 10);
INSERT INTO `student_batch` VALUES (6, '学生1', 0, 10);
INSERT INTO `student_batch` VALUES (7, '学生1', 1, 11);
INSERT INTO `student_batch` VALUES (8, '学生1', 0, 12);
INSERT INTO `student_batch` VALUES (9, '学生1', 1, 10);
INSERT INTO `student_batch` VALUES (10, '学生1', 0, 11);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `topic_img_id` mediumint(9) NOT NULL COMMENT '外面显示图片',
  `delete_time` int(11) NOT NULL COMMENT '删除时间',
  `head_img_id` mediumint(9) NOT NULL COMMENT '点击进入头图',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '专题栏位一', '美味水果世界', 16, 0, 49, 0);
INSERT INTO `theme` VALUES (2, '专题栏位二', '新品推荐', 17, 0, 50, 0);
INSERT INTO `theme` VALUES (3, '专题栏位三', '做个干物女', 18, 0, 18, 0);

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product`  (
  `theme_id` mediumint(9) UNSIGNED NOT NULL,
  `product_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES (1, 2);
INSERT INTO `theme_product` VALUES (1, 5);
INSERT INTO `theme_product` VALUES (1, 8);
INSERT INTO `theme_product` VALUES (1, 10);
INSERT INTO `theme_product` VALUES (1, 12);
INSERT INTO `theme_product` VALUES (2, 1);
INSERT INTO `theme_product` VALUES (2, 2);
INSERT INTO `theme_product` VALUES (2, 3);
INSERT INTO `theme_product` VALUES (2, 5);
INSERT INTO `theme_product` VALUES (2, 6);
INSERT INTO `theme_product` VALUES (2, 16);
INSERT INTO `theme_product` VALUES (2, 33);
INSERT INTO `theme_product` VALUES (3, 15);
INSERT INTO `theme_product` VALUES (3, 18);
INSERT INTO `theme_product` VALUES (3, 19);
INSERT INTO `theme_product` VALUES (3, 27);
INSERT INTO `theme_product` VALUES (3, 30);
INSERT INTO `theme_product` VALUES (3, 31);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'openid',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `delete_time` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '0', '', '', 0, 0, 0);
INSERT INTO `user` VALUES (2, 'oGpwn473zy4oa6K-yC8BYGM1Lhs4', '', '', 0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
