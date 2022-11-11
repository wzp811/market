SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_provider`
-- ----------------------------
DROP TABLE IF EXISTS `t_provider`;
CREATE TABLE `t_provider` (
   `id` bigint(20) NOT NULL auto_increment,
   `code` varchar(20) default NULL,
   `name` varchar(100) default NULL,
   `contact` varchar(100) default NULL,
   `phone` bigint(20) default NULL,
   `fax` bigint(20) default NULL,
   `description` varchar(100) default NULL,
   `createTime` date default NULL,
   PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;