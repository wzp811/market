/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : market

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2022-11-05 11:06:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL auto_increment,
  `code` varchar(20) default NULL,
  `productName` varchar(100) default NULL,
  `providerName` varchar(100) default NULL,
  `number` decimal default NULL,
  `unit` varchar(20) default NULL,
  `amount` decimal default NULL,
  `status` tinyint(4) default NULL,
  `createTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_order` VALUES ('1', 'BILL2016_001', '洗发水、护发素', '山东豪克华光联合发展有限公司', '1', '瓶', '25000.00', 1, '2014-12-14');
INSERT INTO `t_order` VALUES ('2', 'BILL2016_001','洗发水、护发素','山东豪克华光联合发展有限公司', '1', '瓶', '25000.00',1,'2014-12-14');
INSERT INTO `t_order` VALUES ('3', 'BILL2016_002','香皂、肥皂、药皂','山东豪克华光联合发展有限公司', '1', '瓶', '10000.00',1,'2016-03-23');
INSERT INTO `t_order` VALUES ('4', 'BILL2016_003','大豆油','北京纳福尔食用油有限公司', '1', '瓶', '5890.00',1,'2014-12-14');
INSERT INTO `t_order` VALUES ('5', 'BILL2016_004','橄榄油','北京国粮食用油有限公司', '1', '瓶', '9800.00',1,'2013-10-10');
INSERT INTO `t_order` VALUES ('6', 'BILL2016_005','洗洁精','优百商贸有限公司', '1', '瓶', '7000.00',1,'2014-12-14');
INSERT INTO `t_order` VALUES ('7', 'BILL2016_006','美国大杏仁','深圳市喜来客商贸有限公司', '1', '瓶', '5000.00',1,'2016-04-14');
INSERT INTO `t_order` VALUES ('8', 'BILL2016_007','沐浴液、精油','无锡喜源坤商行', '1', '瓶', '23000.00',2,'2016-07-22');
INSERT INTO `t_order` VALUES ('9', 'BILL2016_008','不锈钢盘碗','无锡喜源坤商行', '1', '瓶', '6000.00',1,'2016-04-14');
INSERT INTO `t_order` VALUES ('10', 'BILL2016_009','塑料杯','无锡喜源坤商行', '1', '瓶', '1750.00',1,'2016-02-04');
INSERT INTO `t_order` VALUES ('11', 'BILL2016_010','豆瓣酱','慈溪市广和绿色食品厂', '1', '瓶', '2000.00',1,'2013-10-29');
INSERT INTO `t_order` VALUES ('12', 'BILL2016_011','海之蓝','北京三木堂商贸有限公司', '1', '瓶', '10000.00',2,'2016-04-14');
INSERT INTO `t_order` VALUES ('13', 'BILL2016_012','芝华士','北京三木堂商贸有限公司', '1', '瓶', '6000.00',2,'2016-09-09');
INSERT INTO `t_order` VALUES ('14', 'BILL2016_013','长城红葡萄酒','北京三木堂商贸有限公司', '1', '瓶', '800.00',1,'2016-11-14');
INSERT INTO `t_order` VALUES ('15', 'BILL2016_014','泰国香米','深圳市泰香米业有限公司', '1', '瓶', '5000.00',1,'2016-10-09');
INSERT INTO `t_order` VALUES ('16', 'BILL2016_015','东北大米','深圳市泰香米业有限公司', '1', '瓶', '4000.00',1,'2016-11-14');
INSERT INTO `t_order` VALUES ('17', 'BILL2016_016','可口可乐','石家庄帅益食品贸易有限公司', '1', '瓶', '6000.00',1,'2012-03-27');
INSERT INTO `t_order` VALUES ('18', 'BILL2016_017','脉动','石家庄帅益食品贸易有限公司', '1', '瓶', '4500.00',1,'2016-05-10');
INSERT INTO `t_order` VALUES ('19', 'BILL2016_018','哇哈哈','石家庄帅益食品贸易有限公司', '1', '瓶', '4000.00',1,'2015-11-24');