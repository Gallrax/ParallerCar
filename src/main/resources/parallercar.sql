/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : parallercar

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2017-09-05 17:44:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_brand`
-- ----------------------------
DROP TABLE IF EXISTS `t_brand`;
CREATE TABLE `t_brand` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_brand
-- ----------------------------
INSERT INTO `t_brand` VALUES ('1', '奔驰', 'images/benz.png');
INSERT INTO `t_brand` VALUES ('2', '宝马', 'images/bmw.png');
INSERT INTO `t_brand` VALUES ('3', '奥迪', 'images/audi.png');
INSERT INTO `t_brand` VALUES ('4', '丰田', 'images/toyota.png');
INSERT INTO `t_brand` VALUES ('5', '福特', 'images/ford.png');

-- ----------------------------
-- Table structure for `t_car`
-- ----------------------------
DROP TABLE IF EXISTS `t_car`;
CREATE TABLE `t_car` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `image` varchar(255) default NULL,
  `brand_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `t_car_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `t_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_car
-- ----------------------------
INSERT INTO `t_car` VALUES ('1', '普拉多', 'SUV', null, '4');
INSERT INTO `t_car` VALUES ('2', '兰德酷路泽', 'SUV', null, '4');
INSERT INTO `t_car` VALUES ('3', 'S级', 'C', null, '1');
INSERT INTO `t_car` VALUES ('4', 'A8L', 'C', null, '3');
INSERT INTO `t_car` VALUES ('5', 'X5', 'SUV', null, '2');
INSERT INTO `t_car` VALUES ('6', '塞纳', 'MPV', null, '4');
INSERT INTO `t_car` VALUES ('7', '野马', 'SC', null, '5');

-- ----------------------------
-- Table structure for `t_findinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_findinfo`;
CREATE TABLE `t_findinfo` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` text,
  `outer_color` varchar(255) default NULL,
  `inner_color` varchar(255) default NULL,
  `valid` varchar(255) default NULL,
  `insertTime` date default NULL,
  `source_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `car_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `t_findinfo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `t_findinfo_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `t_car` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_findinfo
-- ----------------------------
INSERT INTO `t_findinfo` VALUES ('1', '寻霸道2700', '霸道2.7丐版', '白', '黑', '一天', '2017-04-24', '3', '1', '1');
INSERT INTO `t_findinfo` VALUES ('2', '寻霸道4.0', '霸道4.0VX', '白', '棕', '一天', '2017-04-10', '3', '1', '1');
INSERT INTO `t_findinfo` VALUES ('3', '巡洋舰4.0', '巡洋舰4.0V8', '绿', '黑', '三天', '2017-04-10', '3', '3', '2');
INSERT INTO `t_findinfo` VALUES ('4', '寻宝马X5', '加班X5 xDrive 35i', '黑', '黑', '一天', '2017-04-21', '2', '2', '5');
INSERT INTO `t_findinfo` VALUES ('5', '奥迪A8L', '美版奥迪A8L', '黑', '棕', '三天', '2017-04-21', '1', '2', '4');
INSERT INTO `t_findinfo` VALUES ('6', '寻丰田塞纳', '中东版丰田塞纳', '白', '棕', '三天', '2017-04-20', '3', '3', '6');
INSERT INTO `t_findinfo` VALUES ('8', '寻奔驰S级', '加版奔驰S400l', '黑', '棕', '一周', '2017-04-11', '2', '2', '3');
INSERT INTO `t_findinfo` VALUES ('10', '寻美规奔驰S350L', '寻美规奔驰S350L', '黑', '米', '黑', '2017-04-24', '1', '1', '3');
INSERT INTO `t_findinfo` VALUES ('11', '寻加版宝马X5 xDirve', '寻加版宝马X5 xDirve', '黑', '黑', '三天', '2017-04-24', '2', '1', '5');
INSERT INTO `t_findinfo` VALUES ('12', '寻加版奥迪A8L 45TFSI', '寻加版奥迪A8L 45TFSI', '黑', '棕', '一周', '2017-04-24', '2', '1', '4');
INSERT INTO `t_findinfo` VALUES ('13', '寻中东版陆地巡洋舰4.0', '寻中东版陆地巡洋舰4.0 V8', '白', '不限', '一周', '2017-04-24', '3', '1', '2');

-- ----------------------------
-- Table structure for `t_merchant`
-- ----------------------------
DROP TABLE IF EXISTS `t_merchant`;
CREATE TABLE `t_merchant` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `business` varchar(255) default NULL,
  `insertTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_merchant
-- ----------------------------
INSERT INTO `t_merchant` VALUES ('1', 'merchant', 'merchant', 'Merchant', '北京市', '奔驰、宝马', '2017-04-11');

-- ----------------------------
-- Table structure for `t_saleinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_saleinfo`;
CREATE TABLE `t_saleinfo` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `outer_color` varchar(255) default NULL,
  `inner_color` varchar(255) default NULL,
  `date` date default NULL,
  `price` varchar(255) default NULL,
  `content` text,
  `insertTime` date default NULL,
  `source_id` int(11) default NULL,
  `car_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `car_id` (`car_id`),
  KEY `merchant_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_saleinfo
-- ----------------------------
INSERT INTO `t_saleinfo` VALUES ('1', '中东版 2017款 丰田霸道2700 2气囊天窗版 配置齐全 颜色多选，价格电议', '白', '米', '2017-03-07', '43.00', '后挂 17轮 2气囊 黑踏 手动座椅 多功能方向盘 定速巡航 DVD 冰箱 倒车影像 （无天窗） 批发 车型：中东版 丰田霸道 陆巡 大霸王 ，日产：途乐XE 现车充足！要拿车价格可谈！', '2017-04-11', '1', '1', '1');
INSERT INTO `t_saleinfo` VALUES ('2', '2016款 丰田霸道4000 VXR', '白', '米', '2017-03-07', '59.80', '16款霸道4000 VXR 2016-06-22 寻！16款霸道4000 VXR 规格类型：中东 外观颜色：白 内饰颜色：米 详细配置：必须16年车！手续齐全 （6速 9气囊 珍珠白 前小杠 镀铬中网 大灯清洗 氙灯 LED灯 银色行李架 铝合金踏板 门边防擦条 18轮 倒影 前后电眼 镀铬亮条后视镜 镀铬牌照架框 备胎字母标 高位刹车灯 大尾喉 主副驾驶电动座椅 多功能方向盘 行车电脑带硬盘储存 巡航定速 摇启 核桃木内饰 大屏 自动恒温空调 智能卡 一键式启动 差速锁 下坡辅助 通风座椅 原厂真皮座椅 电动座椅 冰箱 天窗 双头枕DVD 踏板射地灯 可调节车内氛围灯 防眩目后视镜）', '2017-04-11', '1', '1', '2');
INSERT INTO `t_saleinfo` VALUES ('3', '加版 奔驰S350', '黑', '米', '2017-04-29', '98.00', '奔驰S350l 空气悬挂 3.0T V6', '2017-04-21', '3', '3', '3');
INSERT INTO `t_saleinfo` VALUES ('4', '美版 奥迪A8L', '黑', '棕', '2017-04-26', '80.00', '奥迪A8L 45TFSI', '2017-04-21', '2', '4', '2');
INSERT INTO `t_saleinfo` VALUES ('5', '加版 宝马X5 ', '棕', '棕', '2017-04-24', '80.00', '宝马X5 3.0T', '2017-04-25', '3', '5', '1');
INSERT INTO `t_saleinfo` VALUES ('6', '中东版 丰田塞纳', '白', '棕', '2017-04-30', '40.00', '丰田塞纳3.5L V6', '2017-04-21', '1', '6', '2');
INSERT INTO `t_saleinfo` VALUES ('7', '加版 福特野马', '红', '黑', '2017-04-27', '40.00', '福特野马3.0T', '2017-04-21', '2', '7', '3');
INSERT INTO `t_saleinfo` VALUES ('8', '中东版塞纳 3.5 V6', '黑', '米', '2017-04-25', '50.00', '中东版塞纳 3.5 V6', '2017-04-24', '3', '6', '1');
INSERT INTO `t_saleinfo` VALUES ('11', '美规 奔驰 S350l', '黑', '米', '2017-04-26', '90.00', '美规 奔驰 S350l', '2017-04-24', '1', '3', '1');
INSERT INTO `t_saleinfo` VALUES ('12', '加版 奥迪 A8L', '黑', '黑', '2017-04-26', '80.00', '加版 奥迪 A8L 3.0T', '2017-04-24', '2', '4', '1');
INSERT INTO `t_saleinfo` VALUES ('13', '中东版 丰田 兰德酷路泽 4.0', '白', '黑', '2017-04-27', '60.00', '中东版 丰田 兰德酷路泽 4.0 V6', '2017-04-24', '3', '2', '1');
INSERT INTO `t_saleinfo` VALUES ('14', '美规奔驰S350l', '黑', '米', '2017-04-27', '90.00', '美规奔驰S350l', '2017-04-26', '1', '3', '2');
INSERT INTO `t_saleinfo` VALUES ('15', '加版宝马X5 xDrive', '黑', '黑', '2017-04-28', '80.00', '加版宝马X5 xDrive', '2017-04-26', '2', '5', '2');
INSERT INTO `t_saleinfo` VALUES ('16', '中东版 陆地巡洋舰 4.0V8', '白', '米', '2017-04-28', '70.00', '中东版 陆地巡洋舰 4.0V8', '2017-04-26', '3', '2', '2');

-- ----------------------------
-- Table structure for `t_source`
-- ----------------------------
DROP TABLE IF EXISTS `t_source`;
CREATE TABLE `t_source` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_source
-- ----------------------------
INSERT INTO `t_source` VALUES ('1', '美规');
INSERT INTO `t_source` VALUES ('2', '加版');
INSERT INTO `t_source` VALUES ('3', '中东版');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `isAlone` int(11) default NULL,
  `province` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `business` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `companyAddress` varchar(255) default NULL,
  `insertTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'tom111', 'tom111', 'Tom', 'I am Tom', '13811111111', '0', '北京市', '北京市', '奔驰', null, null, '2017-04-11');
INSERT INTO `t_user` VALUES ('2', 'jack111', 'jack111', 'jack', 'I am Jack', '13811111111', '1', '陕西省', '西安市', '丰田、福特', 'Jack公司', 'A区', '2017-04-11');
INSERT INTO `t_user` VALUES ('3', 'lucy111', 'lucy111', 'luccy', 'I am Lucy', '13811111111', '1', '河南省', '郑州市', '奥迪', 'Lucy公司', 'A区', '2017-04-11');
INSERT INTO `t_user` VALUES ('4', 'aaa111', 'aaa111', 'Aaa', 'I am Aaa', '13811111111', '0', '北京市', '北京市', '奔驰', null, null, '2017-04-24');
INSERT INTO `t_user` VALUES ('5', 'bbb111', 'bbb111', 'Bbb', 'I am Bbb', '13811111111', '1', '北京市', '北京市', '宝马', 'Bbb公司', 'A区', '2017-04-24');
INSERT INTO `t_user` VALUES ('6', 'ccc111', 'ccc111', 'Ccc', 'I am Ccc', '13811111111', '0', '北京市', '北京市', '奥迪', null, null, '2017-04-24');
INSERT INTO `t_user` VALUES ('7', 'ddd111', 'ddd111', 'Ddd', 'I am Ddd', '13811111111', '1', '北京市', '北京市', '丰田', 'Ddd公司', null, '2017-04-24');
INSERT INTO `t_user` VALUES ('8', 'eee111', 'eee111', 'Eee', 'I am Eee', '13811111111', '0', '北京市', '北京市', '福特', null, null, '2017-04-24');
INSERT INTO `t_user` VALUES ('9', 'fff111', 'fff111', 'Fff', 'I am Fff', '13811111111', '1', '北京市', '北京市', '丰田', 'Fff公司', 'A区', '2017-04-24');
INSERT INTO `t_user` VALUES ('10', 'ggg111', 'ggg111', 'Ggg', 'I am Ggg', '13811111111', '0', '北京市', '北京市', '奔驰', null, null, '2017-04-24');
INSERT INTO `t_user` VALUES ('11', 'hhh111', 'hhh111', 'Hhh', 'I am Hhh', '13811111111', '0', '陕西省', '西安市', '宝马', null, null, '2017-04-24');
INSERT INTO `t_user` VALUES ('12', 'iii111', 'iii111', 'Iii', 'I am Iii', '13811111111', '1', '河南省', '郑州市', '奥迪', 'Iii公司', 'A区', '2017-04-24');
INSERT INTO `t_user` VALUES ('13', 'jjj111', 'jjj111', 'Jjj', '我是Jjj', null, '0', '河南省', '郑州市', '丰田', 'Jjj', '', '2017-04-27');
INSERT INTO `t_user` VALUES ('14', 'kkk111', 'kkk111', 'Kkk', '我是Kkk', null, '0', '陕西省', '西安市', '', 'Kkk', '', '2017-04-27');
INSERT INTO `t_user` VALUES ('15', 'mmm111', 'mmm111', 'Mmm', null, null, '1', '北京市', '北京市', '', 'Mmm', 'Mmm', '2017-04-27');
