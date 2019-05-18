/*
Navicat MySQL Data Transfer

Source Server         : gz
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : secondhandmarket

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2019-05-19 02:36:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'jiali', '123456', '123456', '超级管理员');

-- ----------------------------
-- Table structure for catelog
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '闲置数码', '18', '1');
INSERT INTO `catelog` VALUES ('2', '校园代步', '8', '1');
INSERT INTO `catelog` VALUES ('3', '电器日用', '14', '1');
INSERT INTO `catelog` VALUES ('4', '图书教材', '13', '1');
INSERT INTO `catelog` VALUES ('5', '美妆衣物', '16', '1');
INSERT INTO `catelog` VALUES ('6', '运动棋牌', '10', '1');
INSERT INTO `catelog` VALUES ('7', '票券小物', '9', '1');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('120', '8', '97', '厉害厉害~', '2018-04-17 04:36:10');
INSERT INTO `comments` VALUES ('121', '3', '77', '1212', '2018-04-18 12:02:27');
INSERT INTO `comments` VALUES ('122', '6', '90', '111', '2018-04-20 11:37:45');
INSERT INTO `comments` VALUES ('123', '23', '103', '喜欢排球', '2018-04-27 10:05:36');
INSERT INTO `comments` VALUES ('124', '23', '20', '不知道用了多久了', '2018-05-16 01:11:46');
INSERT INTO `comments` VALUES ('125', '23', '110', '自己看过，很不错的一本书 。', '2018-05-16 01:12:21');
INSERT INTO `comments` VALUES ('126', '23', '107', 'HHH', '2018-05-16 02:49:59');
INSERT INTO `comments` VALUES ('127', '25', '106', '是正品吗', '2019-04-24 09:07:23');
INSERT INTO `comments` VALUES ('128', '25', '86', '你好', '2019-04-27 08:34:04');
INSERT INTO `comments` VALUES ('129', '27', '115', '像素高吗', '2019-05-15 12:22:54');
INSERT INTO `comments` VALUES ('130', '26', '20', '是正品吗', '2019-05-15 04:07:43');
INSERT INTO `comments` VALUES ('131', '26', '111', '书上有笔记吗', '2019-05-15 04:13:21');
INSERT INTO `comments` VALUES ('132', '26', '115', '挺高的', '2019-05-15 04:14:27');
INSERT INTO `comments` VALUES ('133', '32', '144', '几成新', '2019-05-16 01:54:03');
INSERT INTO `comments` VALUES ('134', '26', '121', '风大吗', '2019-05-16 02:04:46');
INSERT INTO `comments` VALUES ('135', '26', '138', '集散地激发', '2019-05-16 03:29:53');

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('1', '77', '5');
INSERT INTO `focus` VALUES ('4', '94', '4');
INSERT INTO `focus` VALUES ('5', '94', '4');
INSERT INTO `focus` VALUES ('6', '94', '4');
INSERT INTO `focus` VALUES ('8', '90', '9');
INSERT INTO `focus` VALUES ('9', '90', '22');
INSERT INTO `focus` VALUES ('18', '5', '23');
INSERT INTO `focus` VALUES ('19', '85', '23');
INSERT INTO `focus` VALUES ('20', '113', '26');
INSERT INTO `focus` VALUES ('23', '144', '26');
INSERT INTO `focus` VALUES ('25', '138', '26');
INSERT INTO `focus` VALUES ('26', '138', '26');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  `region` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('113', '1', '26', '相机', '300.00', '800.00', '2019-05-15', '2019-05-15', '2019-05-25', '9成新，7区', '0', '一食堂');
INSERT INTO `goods` VALUES ('114', '1', '26', '相机', '300.00', '800.00', '2019-05-15', '2019-05-15', '2019-05-25', '9成新，7区', '0', '二食堂');
INSERT INTO `goods` VALUES ('115', '1', '26', '相机', '300.00', '800.00', '2019-05-15', '2019-05-15', '2019-05-25', '9成新，7区', '0', '三食堂');
INSERT INTO `goods` VALUES ('116', '3', '26', '咖啡', '10.00', '15.00', '2019-05-15', '2019-05-15', '2019-05-25', '好喝的雀巢', '0', '一区');
INSERT INTO `goods` VALUES ('117', '1', '26', '', null, null, '2019-05-15', '2019-05-15', '2019-05-25', '', '0', '二区');
INSERT INTO `goods` VALUES ('118', '1', '26', '', null, null, '2019-05-15', '2019-05-15', '2019-05-25', '', '0', '三区');
INSERT INTO `goods` VALUES ('119', '1', '26', '扬州炒饭', '8.00', '10.00', '2019-05-15', '2019-05-15', '2019-05-25', '北门', '0', '四区');
INSERT INTO `goods` VALUES ('120', '3', '26', '飞利浦吹风机', '20.00', '50.00', '2019-05-16', '2019-05-16', '2019-05-26', '七区自取', '0', '五区');
INSERT INTO `goods` VALUES ('121', '3', '26', '飞利浦吹风机', '30.00', '50.00', '2019-05-16', '2019-05-16', '2019-05-26', '七区自取', '1', '六区');
INSERT INTO `goods` VALUES ('122', '3', '26', '九阳电饭煲', '100.00', '199.00', '2019-05-16', '2019-05-16', '2019-05-26', '送货上门', '0', '七区');
INSERT INTO `goods` VALUES ('123', '3', '26', '理发推子', '30.00', '38.00', '2019-05-16', '2019-05-16', '2019-05-26', '九成新，二食堂', '1', '八区');
INSERT INTO `goods` VALUES ('124', '3', '26', '电熨斗', '100.00', '180.00', '2019-05-16', '2019-05-16', '2019-05-26', '九成新，自取', '1', '一教');
INSERT INTO `goods` VALUES ('125', '3', '26', '雷蛇鼠标', '200.00', '290.00', '2019-05-16', '2019-05-16', '2019-05-26', '很好用的一款鼠标', '1', '二教');
INSERT INTO `goods` VALUES ('126', '3', '26', '榨汁机', '80.00', '100.00', '2019-05-16', '2019-05-16', '2019-05-26', '几乎全新', '1', '三教');
INSERT INTO `goods` VALUES ('127', '5', '27', '阿迪篮球鞋', '300.00', '380.00', '2019-05-16', '2019-05-16', '2019-05-26', '全新', '0', '四教');
INSERT INTO `goods` VALUES ('128', '1', '27', '阿迪篮球鞋', '300.00', '380.00', '2019-05-16', '2019-05-19', '2019-05-26', '全新', '1', null);
INSERT INTO `goods` VALUES ('129', '5', '27', '安踏篮球鞋', '200.00', '280.00', '2019-05-16', '2019-05-16', '2019-05-26', '二食堂交易', '1', '六教');
INSERT INTO `goods` VALUES ('130', '5', '27', '粉色连衣裙', '100.00', '110.00', '2019-05-16', '2019-05-16', '2019-05-26', '可小刀', '1', '七教');
INSERT INTO `goods` VALUES ('131', '5', '27', '森系长裙', '80.00', '100.00', '2019-05-16', '2019-05-16', '2019-05-26', '全新不砍价', '1', '八教');
INSERT INTO `goods` VALUES ('132', '5', '27', '白色毛衣', '70.00', '78.00', '2019-05-16', '2019-05-16', '2019-05-26', '九成新，未下水', '1', '九教');
INSERT INTO `goods` VALUES ('133', '7', '28', '少儿编程课', '800.00', '1180.00', '2019-05-16', '2019-05-16', '2019-05-26', '少儿教育', '1', '十教');
INSERT INTO `goods` VALUES ('134', '7', '28', 'ps技能课', '80.00', '100.00', '2019-05-16', '2019-05-16', '2019-05-26', '当下必备技能', '1', '理科楼');
INSERT INTO `goods` VALUES ('135', '7', '28', 'python爬虫课', '300.00', '340.00', '2019-05-16', '2019-05-16', '2019-05-26', '爬虫技能，适当学习', '1', '工科楼');
INSERT INTO `goods` VALUES ('136', '7', '28', 'c++入门课', '20.00', '50.00', '2019-05-16', '2019-05-16', '2019-05-26', '基础语言，科班必会', '1', '文科楼');
INSERT INTO `goods` VALUES ('137', '4', '29', '长难句解密', '10.00', '23.00', '2019-05-16', '2019-05-16', '2019-05-26', '何凯文经典', '1', '美术楼');
INSERT INTO `goods` VALUES ('138', '4', '29', '线性代数辅导讲义', '20.00', '30.00', '2019-05-16', '2019-05-16', '2019-05-26', '李永乐呕心沥血', '0', '北门');
INSERT INTO `goods` VALUES ('139', '4', '29', '精讲精练', '30.00', '50.00', '2019-05-16', '2019-05-16', '2019-05-26', '肖大大的书，政治必看', '1', '后街');
INSERT INTO `goods` VALUES ('140', '4', '29', '新东方真题集训', '30.00', '38.00', '2019-05-16', '2019-05-16', '2019-05-26', '好书，全新', '1', '樱花园');
INSERT INTO `goods` VALUES ('141', '4', '29', '英语协作', '30.00', '33.00', '2019-05-16', '2019-05-16', '2019-05-26', '全新', '1', '月湖');
INSERT INTO `goods` VALUES ('142', '4', '29', '数学1000题', '20.00', '28.00', '2019-05-16', '2019-05-16', '2019-05-26', '全新', '1', '明湖');
INSERT INTO `goods` VALUES ('143', '1', '30', '联想手机', '800.00', '999.00', '2019-05-16', '2019-05-16', '2019-05-26', '九成新，高通芯片', '0', '南门');
INSERT INTO `goods` VALUES ('144', '1', '30', '联想手机', '800.00', '999.00', '2019-05-16', '2019-05-16', '2019-05-26', '全新，', '1', '小堕');
INSERT INTO `goods` VALUES ('145', '1', '30', '佳能相机', '1000.00', '1800.00', '2019-05-16', '2019-05-16', '2019-05-26', '高像素', '1', '大堕');
INSERT INTO `goods` VALUES ('146', '1', '30', '森海耳机', '100.00', '190.00', '2019-05-16', '2019-05-16', '2019-05-26', '无损音质', '0', '报刊亭');
INSERT INTO `goods` VALUES ('147', '1', '30', '笔记本电脑', '1900.00', '2490.00', '2019-05-16', '2019-05-16', '2019-05-26', '流畅i5', '0', '田径场');
INSERT INTO `goods` VALUES ('148', '1', '30', '音箱', '100.00', '110.00', '2019-05-16', '2019-05-16', '2019-05-26', '声音够大', '1', '体育馆');
INSERT INTO `goods` VALUES ('149', '1', '30', '红米手机', '800.00', '999.00', '2019-05-16', '2019-05-16', '2019-05-26', '六区自取', '1', '游泳池');
INSERT INTO `goods` VALUES ('150', '2', '31', '公主自行车', '800.00', '1000.00', '2019-05-16', '2019-05-16', '2019-05-26', '骑着不费力', '1', '八区');
INSERT INTO `goods` VALUES ('151', '2', '31', '点滑板车', '300.00', '500.00', '2019-05-16', '2019-05-16', '2019-05-26', '续航强劲', '1', '体育馆');
INSERT INTO `goods` VALUES ('152', '2', '31', '死飞自行车', '100.00', '300.00', '2019-05-16', '2019-05-16', '2019-05-26', '酷炫外观', '1', '五教');
INSERT INTO `goods` VALUES ('153', '2', '31', '买菜车', '20.00', '50.00', '2019-05-16', '2019-05-16', '2019-05-26', '省力气', '1', '六区');
INSERT INTO `goods` VALUES ('154', '6', '32', '登山包', '100.00', '120.00', '2019-05-16', '2019-05-16', '2019-05-26', '舒适', '1', '七区');
INSERT INTO `goods` VALUES ('155', '6', '32', '帆布鞋', '100.00', '130.00', '2019-05-16', '2019-05-16', '2019-05-26', '全新', '1', '八区');
INSERT INTO `goods` VALUES ('156', '6', '32', '篮球', '10.00', '20.00', '2019-05-16', '2019-05-16', '2019-05-26', '九成新，没打过', '1', '八区食堂');
INSERT INTO `goods` VALUES ('157', '6', '27', '钓鱼竿', '100.00', '128.00', '2019-05-19', '2019-05-19', '2019-05-29', '德国进口材质', '1', '八区');
INSERT INTO `goods` VALUES ('158', '1', '27', '空气净化器', '650.00', '900.00', '2019-05-19', '2019-05-19', '2019-05-29', '健康养生', '1', '九教');
INSERT INTO `goods` VALUES ('159', '1', '27', '', null, null, '2019-05-19', '2019-05-19', '2019-05-29', '', '0', null);
INSERT INTO `goods` VALUES ('160', '6', '27', '手腕包', '30.00', '55.00', '2019-05-19', '2019-05-19', '2019-05-29', '方便小巧，便携时尚', '1', '七区食堂');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', 'nopic1.png');
INSERT INTO `image` VALUES ('2', '2', 'nopic2.png');
INSERT INTO `image` VALUES ('3', '3', 'nopic3.png');
INSERT INTO `image` VALUES ('4', '4', 'nopic4.png');
INSERT INTO `image` VALUES ('5', '5', 'nopic5.png');
INSERT INTO `image` VALUES ('6', '6', 'nopic6.png');
INSERT INTO `image` VALUES ('7', '7', 'nopic7.png');
INSERT INTO `image` VALUES ('8', '8', 'nopic8.png');
INSERT INTO `image` VALUES ('9', '9', 'nopic9.png');
INSERT INTO `image` VALUES ('11', '11', 'nopic11.png');
INSERT INTO `image` VALUES ('12', '12', 'nopic12.png');
INSERT INTO `image` VALUES ('13', '13', 'nopic13.png');
INSERT INTO `image` VALUES ('16', '16', 'nopic16.png');
INSERT INTO `image` VALUES ('17', '17', 'nopic17.png');
INSERT INTO `image` VALUES ('18', '18', 'nopic18.png');
INSERT INTO `image` VALUES ('20', '20', 'nopic20.png');
INSERT INTO `image` VALUES ('21', '77', '4f320b75-427a-484e-b725-a2f5d066af6f.jpg');
INSERT INTO `image` VALUES ('78', '78', '599629aa-9440-435c-8185-42e34a862470.jpg');
INSERT INTO `image` VALUES ('79', '79', '266abea1-a202-47f2-b5c4-095e96c10473.jpg');
INSERT INTO `image` VALUES ('80', '80', '4d472617-d430-4540-a510-f7606861dde0.jpg');
INSERT INTO `image` VALUES ('81', '81', 'e62acc43-8122-421a-940b-a68e6aeadd30.jpg');
INSERT INTO `image` VALUES ('82', '82', '67a5f2ee-a09a-488d-9e7a-87ac6d8ab9c4.jpg');
INSERT INTO `image` VALUES ('83', '83', '110456d4-cc20-4fe2-b0a6-217b023d7dd6.jpg');
INSERT INTO `image` VALUES ('84', '84', '499afa59-53bc-4d23-99ef-5d0f9d60de69.jpg');
INSERT INTO `image` VALUES ('85', '85', '23f242e3-6dbf-4d46-a1b2-a620918908d9.jpg');
INSERT INTO `image` VALUES ('86', '86', 'ae1097a5-736d-4850-9552-b5901ad6d84b.jpg');
INSERT INTO `image` VALUES ('87', '87', '95daa308-8011-4e0c-b5bd-8cd151830c32.jpg');
INSERT INTO `image` VALUES ('88', '88', '5c212d57-d8a4-4cc0-8853-dba957fba3d5.jpg');
INSERT INTO `image` VALUES ('89', '89', 'ec5369f6-7c87-43db-98aa-112efa91c8c6.JPG');
INSERT INTO `image` VALUES ('90', '90', 'fd680315-9ac8-4268-803e-7da7b492e8b0.JPG');
INSERT INTO `image` VALUES ('91', '91', '455e9ee5-92a7-4c7c-aa94-55f4373a16ee.JPG');
INSERT INTO `image` VALUES ('92', '92', '33434fa2-8bf3-4fbc-b1d9-d1e67202e2f2.jpg');
INSERT INTO `image` VALUES ('93', '93', 'dc4f9591-bd1a-4eac-b1ea-be6412296fb6.png');
INSERT INTO `image` VALUES ('94', '94', '7eb89aaa-56c0-4283-893f-bd5718301d80.jpg');
INSERT INTO `image` VALUES ('95', '95', '6664b320-87d4-4d37-b14f-fc5dba41f529.PNG');
INSERT INTO `image` VALUES ('96', '96', '451c3aa2-529d-449d-b69f-b8771af1d806.jpg');
INSERT INTO `image` VALUES ('97', '97', 'ee6e735c-6479-40bb-b45f-69888c42862e.jpg');
INSERT INTO `image` VALUES ('98', '98', '2f92136b-af5b-45f4-902d-7bb1d0ad0809.png');
INSERT INTO `image` VALUES ('99', '99', '022fe88a-5328-4b42-8333-10b782d39373.png');
INSERT INTO `image` VALUES ('100', '100', 'a1f11b39-490b-42ef-a8e1-44285c4a80d4.png');
INSERT INTO `image` VALUES ('101', '101', '0f022547-b2cb-45fe-ab86-fb8b6d70adbc.jpg');
INSERT INTO `image` VALUES ('102', '102', '');
INSERT INTO `image` VALUES ('103', '103', 'b0933eb3-1ccb-43e1-80a4-1d50902916db.jpg');
INSERT INTO `image` VALUES ('104', '104', '');
INSERT INTO `image` VALUES ('105', '105', '504d47df-32b0-4195-b63c-10d1562896cc.jpg');
INSERT INTO `image` VALUES ('106', '106', 'a634ca2b-70cc-404d-95cb-fc4166fe6706.jpg');
INSERT INTO `image` VALUES ('107', '107', '1ba8f318-fbf3-42f6-b8d9-0baa7e678cec.jpg');
INSERT INTO `image` VALUES ('108', '108', 'afd57674-338c-414f-98ae-78e0d25b12f8.jpg');
INSERT INTO `image` VALUES ('109', '109', '330a9a46-6434-4d04-a72b-a91a14035229.jpg');
INSERT INTO `image` VALUES ('110', '110', '0583cb1e-6acd-46da-bebc-4a9f1d6c3ac7.jpg');
INSERT INTO `image` VALUES ('111', '111', 'ce18c0f4-dc10-454e-9791-e1992164a384.jpg');
INSERT INTO `image` VALUES ('112', '112', '854dff80-d049-4381-ae40-d1d23cd0e88b.jpg');
INSERT INTO `image` VALUES ('113', '113', '');
INSERT INTO `image` VALUES ('114', '114', '');
INSERT INTO `image` VALUES ('115', '115', '6a82b918-c2d8-47eb-a0c7-4c30a1a0305e.jpg');
INSERT INTO `image` VALUES ('116', '116', '584f7063-0d35-4538-a9e8-16b4d652ca2e.jpg');
INSERT INTO `image` VALUES ('117', '117', '');
INSERT INTO `image` VALUES ('118', '118', '');
INSERT INTO `image` VALUES ('119', '119', '4c538938-95e7-4286-b62d-3ba21357bc77.jpg');
INSERT INTO `image` VALUES ('120', '120', '');
INSERT INTO `image` VALUES ('121', '121', '91fac2bb-8465-49b0-8240-d5553e7a3bc6.jpg');
INSERT INTO `image` VALUES ('122', '122', 'af2a1158-79e1-4b9b-bc9f-caf257e2513e.jpg');
INSERT INTO `image` VALUES ('123', '123', 'dee83047-e7f8-4606-a503-812ebefa8ca8.jpg');
INSERT INTO `image` VALUES ('124', '124', '21b42248-cc4d-4fd5-b108-558332aa0255.jpg');
INSERT INTO `image` VALUES ('125', '125', 'f4ebaf5d-2421-4a7b-be99-87d91a14b87a.png');
INSERT INTO `image` VALUES ('126', '126', '644c2b01-3dc0-49e1-bc6e-6cf80ca4494c.jpg');
INSERT INTO `image` VALUES ('127', '127', '');
INSERT INTO `image` VALUES ('128', '128', 'df724d30-4d8b-4e84-bc36-58df992afcb3.jpg');
INSERT INTO `image` VALUES ('129', '129', 'ab112589-d566-4c66-81b4-785904eb43a2.jpg');
INSERT INTO `image` VALUES ('130', '130', 'fd380314-ed90-41da-8b6d-41092b095084.jpg');
INSERT INTO `image` VALUES ('131', '131', 'a4948e7d-f9ff-458d-beed-f50a54aee1e1.jpg');
INSERT INTO `image` VALUES ('132', '132', 'c500db3b-4c74-4f11-ae1a-ad98ab1abed4.jpg');
INSERT INTO `image` VALUES ('133', '133', 'a493618a-1fda-4811-ba34-134b95678b02.png');
INSERT INTO `image` VALUES ('134', '134', '44cb6af4-028f-4232-ae33-c081ee854461.jpg');
INSERT INTO `image` VALUES ('135', '135', '47ca78fb-32a6-4fb0-8eb8-47a929f0df98.png');
INSERT INTO `image` VALUES ('136', '136', '68d8d18c-eb3a-4641-b818-a89b32dc5833.jpg');
INSERT INTO `image` VALUES ('137', '137', '78b3288c-f581-4386-8c3e-2d0ca930d538.jpg');
INSERT INTO `image` VALUES ('138', '138', '24642b06-56fb-44fc-999b-8f7dda980735.jpg');
INSERT INTO `image` VALUES ('139', '139', '2c7f6a6d-fbc9-444e-90a1-7379c644c857.jpg');
INSERT INTO `image` VALUES ('140', '140', '6181126a-5dd0-4c45-99a8-cb8b0d5895eb.jpg');
INSERT INTO `image` VALUES ('141', '141', '1a9c2a2f-1013-4f9d-a6a1-b849800b14fb.jpg');
INSERT INTO `image` VALUES ('142', '142', '4122126c-3c48-4134-9673-ef31ed36f4e4.jpg');
INSERT INTO `image` VALUES ('143', '143', '');
INSERT INTO `image` VALUES ('144', '144', '2a2ade9b-a795-47d1-aa0c-dea0fc2b9499.jpg');
INSERT INTO `image` VALUES ('145', '145', '8535b67c-ac19-45d1-913c-d1c52b37b819.jpg');
INSERT INTO `image` VALUES ('146', '146', '66e9fe36-8551-4d59-9981-94fb768ae11d.jpg');
INSERT INTO `image` VALUES ('147', '147', 'a193a235-09d9-463b-b0ba-40ccb94a7c6a.jpg');
INSERT INTO `image` VALUES ('148', '148', 'a7b25101-e23a-4f50-9895-928e34a552fe.png');
INSERT INTO `image` VALUES ('149', '149', '673cfbb2-c3bc-456e-8f27-cfdb29e3a2ad.png');
INSERT INTO `image` VALUES ('150', '150', '968345e7-aa62-4d67-b52b-8fd8aaaadbb0.jpg');
INSERT INTO `image` VALUES ('151', '151', '1c299de3-5b7f-4690-8621-82d38b409bfd.jpg');
INSERT INTO `image` VALUES ('152', '152', 'ab17bb9f-c78d-41b4-a4e7-b50944ad57b5.jpg');
INSERT INTO `image` VALUES ('153', '153', 'a111fea1-bead-43b6-b41e-b953a5f01b03.jpg');
INSERT INTO `image` VALUES ('154', '154', '94a5bb45-f74c-4b79-90dc-3d957ac6f82b.jpg');
INSERT INTO `image` VALUES ('155', '155', '74280c20-8016-4da6-8048-05f64b60364b.jpg');
INSERT INTO `image` VALUES ('156', '156', '3369c663-42e0-4286-84fa-3b5ccf62abd5.jpg');
INSERT INTO `image` VALUES ('157', '157', '1ea8c0e6-9646-4fb8-b26a-c56b388895cb.jpg');
INSERT INTO `image` VALUES ('158', '158', 'ed4f5385-8256-448f-ba8b-54b93ff842f8.jpg');
INSERT INTO `image` VALUES ('159', '159', '');
INSERT INTO `image` VALUES ('160', '160', '259ef2f9-1e71-4cf4-833b-41baaf67ceed.jpg');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '1', '啦啦啦', '2018-04-18 04:36:10', '0');
INSERT INTO `notice` VALUES ('2', '3', '发地方大幅度', '2018-04-17 04:36:10', '0');
INSERT INTO `notice` VALUES ('3', '11', '是该公司给', '2018-04-17 05:36:10', '0');
INSERT INTO `notice` VALUES ('4', '21', '光伏发电', '2018-04-20 10:49:55', '1');
INSERT INTO `notice` VALUES ('5', '12', '大师傅发多少加点方法敬爱的卡罗拉第三方尽快大反垄断法睡觉了科勒卡戴珊发jkdasf发的卡死了看记录大师傅垃圾框发生', '2018-04-20 10:50:17', '1');
INSERT INTO `notice` VALUES ('6', '2', '打开来', '2018-04-20 10:50:29', '0');
INSERT INTO `notice` VALUES ('7', '2', '2018-4-2045434', '2018-04-20 10:50:40', '0');
INSERT INTO `notice` VALUES ('8', '2', 'dafsjklfdalsj', '2018-04-20 10:50:54', '0');
INSERT INTO `notice` VALUES ('9', '3', '453', '2018-04-20 17:10:40', null);
INSERT INTO `notice` VALUES ('10', '6', '453534354', '2018-04-20 17:52:31', '0');
INSERT INTO `notice` VALUES ('11', '6', '645654', '2018-04-20 18:02:24', '0');
INSERT INTO `notice` VALUES ('12', '8', '546456456', '2018-04-20 18:05:31', '0');
INSERT INTO `notice` VALUES ('13', '8', '啦啦啦啦', '2018-04-20 18:05:40', '0');
INSERT INTO `notice` VALUES ('14', '8', '可以了 交流吧 分页先不搞了', '2018-04-20 18:06:04', '0');
INSERT INTO `notice` VALUES ('15', '23', '有宿舍用的小桌子吗', '2018-05-07 17:15:37', '0');
INSERT INTO `notice` VALUES ('16', '23', '求一个USB台灯', '2018-05-18 23:25:55', '0');
INSERT INTO `notice` VALUES ('17', '23', '哈哈', '2018-05-18 23:29:49', '0');
INSERT INTO `notice` VALUES ('18', '26', '想要一台笔记本', '2019-05-15 11:54:41', '0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '11', '78', '85970353', '10', '3', '买给爸爸用的', '2018-04-16 05:06:41');
INSERT INTO `orders` VALUES ('2', '23', '90', '33646286', '28', '3', '', '2018-05-07 11:16:27');
INSERT INTO `orders` VALUES ('3', '23', '3', '17573202', '23', '3', '', '2018-05-07 11:18:03');
INSERT INTO `orders` VALUES ('4', '23', '81', '14071824', '168', '1', '', '2018-05-18 11:16:49');
INSERT INTO `orders` VALUES ('5', '25', '108', '56091549', '10', '1', '', '2019-03-31 05:55:29');
INSERT INTO `orders` VALUES ('6', '25', '107', '82524056', '40', '1', '', '2019-04-24 09:09:10');
INSERT INTO `orders` VALUES ('7', '26', '83', '76979104', '398', '1', '尽快送达', '2019-05-15 04:21:53');
INSERT INTO `orders` VALUES ('8', '27', '115', '58173990', '300', '3', '尽快送达', '2019-05-15 04:23:36');
INSERT INTO `orders` VALUES ('9', '27', '116', '99782678', '10', '3', '尽快送达', '2019-05-15 05:09:59');
INSERT INTO `orders` VALUES ('10', '27', '119', '59624940', '8', '3', '快点送啊。。', '2019-05-15 05:13:39');
INSERT INTO `orders` VALUES ('11', '26', '138', '26115684', '20', '3', '七区', '2019-05-16 03:36:14');
INSERT INTO `orders` VALUES ('12', '26', '147', '84224706', '1900', '1', '', '2019-05-16 09:59:45');
INSERT INTO `orders` VALUES ('13', '26', '146', '56691645', '100', '1', '黄金客户', '2019-05-16 10:02:22');
INSERT INTO `orders` VALUES ('14', '28', '122', '63112851', '100', '3', '快快送', '2019-05-19 02:29:17');

-- ----------------------------
-- Table structure for purse
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES ('0', '0', '00000000000', '0', '0', null);
INSERT INTO `purse` VALUES ('1', '1', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('2', '2', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('3', '3', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('4', '4', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('5', '5', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('6', '11', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('13', '18', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('15', '20', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('16', '21', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('17', '22', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('18', '23', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('19', '24', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('20', '25', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('21', '26', '00000000100', null, null, null);
INSERT INTO `purse` VALUES ('22', '27', '00000000100', '12', null, '0');
INSERT INTO `purse` VALUES ('23', '28', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('24', '29', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('25', '30', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('26', '31', '00000000000', null, null, null);
INSERT INTO `purse` VALUES ('27', '32', '00000000000', null, null, null);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('26', '18390240561', 'aaaaa', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2019-05-14 23:47', '9', '0000000100', null, '1');
INSERT INTO `user` VALUES ('27', '18390240562', 'bbbbb', 'E10ADC3949BA59ABBE56E057F20F883E', '932690325', '2019-05-15 12:08', '8', '0000000100', null, '1');
INSERT INTO `user` VALUES ('28', '18390240563', 'cccc', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2019-05-16 13:36', '4', '0000000100', null, '1');
INSERT INTO `user` VALUES ('29', '18390240564', 'dddd', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2019-05-16 13:40', '6', '0000000100', null, '1');
INSERT INTO `user` VALUES ('30', '18390240565', 'eeee', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2019-05-16 13:44', '6', '0000000100', null, '1');
INSERT INTO `user` VALUES ('31', '18390240566', 'ffff', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2019-05-16 13:48', '4', '0000000100', null, '1');
INSERT INTO `user` VALUES ('32', '18390240567', 'gggg', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2019-05-16 13:51', '3', '0000000100', null, '1');
