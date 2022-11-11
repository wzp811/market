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
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `userName` varchar(20) default NULL,
  `password` varchar(20) default NULL,
  `realName` varchar(20) default NULL,
  `gender` tinyint(4) default NULL,
  `birthday` date default NULL,
  `phone` varchar(20) default NULL,
  `address` varchar(80) default NULL,
  `roleId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '0000', '老王', '1', '1980-01-01', '18644448888', '深圳市南山区', '1');
INSERT INTO `t_user` VALUES ('2', 'apple', '0000', '老张', '2', '1981-02-01', '13633336666', '深圳市福田区', '2');
INSERT INTO `t_user` VALUES ('3', 'zachary', '1234', '老吴', '1', '2000-11-14', '13828153491', '深圳市南山区', '2');
