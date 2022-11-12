SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_provider`
-- ---------------------- ------
DROP TABLE IF EXISTS `t_provider`;
CREATE TABLE `t_provider` (
   `id` bigint(20) NOT NULL auto_increment,
   `code` varchar(20) default NULL,
   `name` varchar(100) default NULL,
   `contact` varchar(100) default NULL,
   `phone` varchar(20) default NULL,
   `fax` varchar(20) default NULL,
   `description` varchar(100) default NULL,
   `createTime` date default NULL,
   PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `t_provider` VALUES (null, 'BJ_GYS001', '北京三木堂商贸有限公司', '张国强', '13566667777', '010-58858787', 'description', '13-03-21');
INSERT INTO `t_provider` VALUES (null, 'HB_GYS001', '石家庄帅益食品贸易有限公司', '王军', '13309094212', '0311-67738876', 'description', '16-04-13');
INSERT INTO `t_provider` VALUES (null, 'GZ_GYS001', '深圳市泰香米业有限公司', '郑程瀚', '13402013312', '0755-67776212', 'description', '14-03-21');
INSERT INTO `t_provider` VALUES (null, 'GZ_GYS002', '深圳市喜来客商贸有限公司', '林妮', '18599897645', '0755-67772341', 'description', '13-03-22');
INSERT INTO `t_provider` VALUES (null, 'JS_GYS001', '兴化佳美调味品厂', '徐国洋', '13754444221', '0523-21299098', 'description', '15-11-22');
INSERT INTO `t_provider` VALUES (null, 'BJ_GYS002', '北京纳福尔食用油有限公司', '马莺', '13422235678', '010-588634233', 'description', '12-03-21');
INSERT INTO `t_provider` VALUES (null, 'BJ_GYS003', '北京国粮食用油有限公司', '王驰', '13344441135', '010-588134111', 'description', '16-04-13');
INSERT INTO `t_provider` VALUES (null, 'ZJ_GYS001', '慈溪市广和绿色食品厂', '薛圣丹', '18099953223', '0574-34449090', 'description', '13-11-21');
INSERT INTO `t_provider` VALUES (null, 'GX_GYS001', '优百商贸有限公司', '李立国', '13323566543', '0771-98861134', 'description', '13-03-21');
INSERT INTO `t_provider` VALUES (null, 'JS_GYS002', '南京火头军信息技术有限公司', '陈女士', '13098992113', '025-86223345', 'description', '13-03-25');
INSERT INTO `t_provider` VALUES (null, 'GZ_GYS003', '广州市白云区美星五金制品厂', '梁天', '13562276775', '020-85542231', 'description', '16-12-21');
INSERT INTO `t_provider` VALUES (null, 'BJ_GYS004', '北京隆盛日化科技', '孙欣', '13689865678', '010-35576786', 'description', '14-11-21');
INSERT INTO `t_provider` VALUES (null, 'SD_GYS001', '山东豪克华光联合发展有限公司', '吴洪转', '13245468787', '0531-53362445', 'description', '15-01-28');
INSERT INTO `t_provider` VALUES (null, 'JS_GYS003', '无锡喜源坤商行', '周一清', '18567674532', '0510-32274422', 'description', '16-04-23');
INSERT INTO `t_provider` VALUES (null, 'ZJ_GYS002', '乐摆日用品厂', '王世杰', '13212331567', '0579-34452321', 'description', '16-08-22');