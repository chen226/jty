/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50710
 Source Host           : localhost
 Source Database       : jty

 Target Server Type    : MySQL
 Target Server Version : 50710
 File Encoding         : utf-8

 Date: 05/01/2016 23:59:25 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `adver`
-- ----------------------------
DROP TABLE IF EXISTS `adver`;
CREATE TABLE `adver` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `IMG` varchar(255) NOT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `area_info`
-- ----------------------------
DROP TABLE IF EXISTS `area_info`;
CREATE TABLE `area_info` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `AREA_CODE` varchar(12) DEFAULT NULL,
  `AREA_NAME` varchar(50) DEFAULT NULL,
  `PID` int(9) DEFAULT NULL,
  `SORT` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `area_info`
-- ----------------------------
BEGIN;
INSERT INTO `area_info` VALUES ('1', '100000', '中国', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dict`
-- ----------------------------
BEGIN;
INSERT INTO `dict` VALUES ('1', '正常', '0', 'user', '用户状态', '1', null, null), ('2', '禁用', '1', 'user', '用户状态', '2', null, null), ('4', '普通用户', '0', 'user', '用户类型', null, null, null), ('5', '会员用户', '1', 'user', '用户类型', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `COVER` varchar(255) NOT NULL,
  `IMG` varchar(255) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `PRICE` double NOT NULL COMMENT '标价',
  `MARKET_PRICE` double DEFAULT NULL COMMENT '市场价',
  `INTRODUCE` varchar(255) DEFAULT NULL COMMENT '介绍',
  `BRIEF` varchar(255) DEFAULT NULL COMMENT '摘要',
  `IS_SOLD` char(255) DEFAULT NULL COMMENT '是否上架',
  `SALES` int(11) DEFAULT NULL COMMENT '销量',
  `POSTAGE` double DEFAULT NULL COMMENT '邮费',
  `PV` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GOODS_TYPE_ID` (`TYPE_ID`),
  CONSTRAINT `FK_GOODS_TYPE_ID` FOREIGN KEY (`TYPE_ID`) REFERENCES `goods_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `goods`
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES ('1', 'aaa', 'aaa', 'aaa', '1', '11', '11', '11', '1', '1', '1', '1', '11');
COMMIT;

-- ----------------------------
--  Table structure for `goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `goods_type`;
CREATE TABLE `goods_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `goods_type`
-- ----------------------------
BEGIN;
INSERT INTO `goods_type` VALUES ('1', null, '男装·女装', null), ('2', null, '鞋靴·箱包', null), ('3', null, '手机·数码', null), ('4', null, '家电·办公', null), ('5', '1', '男上衣', 'aaa'), ('6', '1', '男裤', null), ('7', '1', '男内衣', null), ('8', '1', '女裤', null), ('9', '3', '笔记本', null), ('10', '3', '台式机', null), ('11', '4', '电视', null);
COMMIT;

-- ----------------------------
--  Table structure for `leave_jpa`
-- ----------------------------
DROP TABLE IF EXISTS `leave_jpa`;
CREATE TABLE `leave_jpa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `dept_leader_approved` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `hr_approved` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reality_end_time` datetime DEFAULT NULL,
  `reality_start_time` datetime DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `report_back_date` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATION_CODE` varchar(50) NOT NULL COMMENT '操作编码',
  `CREATER` varchar(20) DEFAULT NULL COMMENT '操作用户名称',
  `CREATE_DATE` datetime NOT NULL COMMENT '日志生成时间',
  `TYPE` int(11) DEFAULT NULL COMMENT '日志类型: 1：安全日志 2：表示操作日志',
  `OS` varchar(20) DEFAULT NULL,
  `BROWSER` varchar(20) DEFAULT NULL COMMENT '浏览器类型',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `MAC` varchar(20) DEFAULT NULL COMMENT '物理地址',
  `EXECUTE_TIME` int(11) DEFAULT NULL COMMENT '执行时间',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '详细描述',
  `REQUEST_PARAM` varchar(500) DEFAULT NULL COMMENT '请求参数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2287 DEFAULT CHARSET=utf8 COMMENT='日录资料表';

-- ----------------------------
--  Records of `log`
-- ----------------------------
BEGIN;
INSERT INTO `log` VALUES ('2259', '/system/user/update', 'admin', '2014-12-04 10:25:40', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '22', null, '{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb1234\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}'), ('2260', '/system/user/update', 'admin', '2014-12-04 10:26:14', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '9', null, '{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb12346\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}'), ('2261', '/system/user/update', 'admin', '2014-12-04 10:37:01', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '7', null, '{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb123466\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}'), ('2262', '/system/role/update', 'admin', '2014-12-04 10:48:43', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '215', null, '{\"id\":[\"12\"],\"roleCode\":[\"guest212\"],\"sort\":[\"4\"],\"description\":[\"s\"],\"name\":[\"guest22\"]}'), ('2263', '/system/user/create', 'admin', '2014-12-05 11:55:03', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '305', null, '{\"id\":[\"\"],\"birthday\":[\"2014-12-05\"],\"confirmPassword\":[\"123456\"],\"phone\":[\"\"],\"email\":[\"\"],\"name\":[\"tyty\"],\"plainPassword\":[\"123456\"],\"gender\":[\"1\"],\"loginName\":[\"test\"]}'), ('2264', '/system/permission/create', 'admin', '2014-12-13 11:19:15', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '215', null, '{\"id\":[\"\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"定时任务管理，支持集群\"],\"name\":[\"定时任务管理\"],\"permCode\":[\"\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"system/scheuleJob\"]}'), ('2265', '/system/permission/update', 'admin', '2014-12-13 11:19:40', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '66', null, '{\"id\":[\"37\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"定时任务管理，支持集群\"],\"name\":[\"定时任务管理\"],\"permCode\":[\"\"],\"pid\":[\"15\"],\"type\":[\"F\"],\"url\":[\"system/scheuleJob\"]}'), ('2266', '/system/permission/update', 'admin', '2014-12-13 11:22:17', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '186', null, '{\"id\":[\"37\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"定时任务管理，支持集群\"],\"name\":[\"定时任务管理\"],\"permCode\":[\"\"],\"pid\":[\"15\"],\"type\":[\"F\"],\"url\":[\"system/scheduleJob\"]}'), ('2267', '/system/permission/create', 'admin', '2016-04-10 10:57:13', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '44', null, '{\"id\":[\"\"],\"description\":[\"流程管理\"],\"name\":[\"流程管理\"],\"permCode\":[\"flowmanager\"],\"pid\":[\"\"],\"type\":[\"O\"],\"url\":[\"/flow\"]}'), ('2268', '/system/permission/create', 'admin', '2016-04-10 10:57:13', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '91', null, '{\"id\":[\"\"],\"description\":[\"流程管理\"],\"name\":[\"流程管理\"],\"permCode\":[\"flowmanager\"],\"pid\":[\"\"],\"type\":[\"O\"],\"url\":[\"/flow\"]}'), ('2269', '/system/permission/create', 'admin', '2016-04-10 11:04:09', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '54', null, '{\"id\":[\"\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"流程管理\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"/flower\"]}'), ('2270', '/system/permission/create', 'admin', '2016-04-10 11:04:09', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '67', null, '{\"id\":[\"\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"流程管理\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"/flower\"]}'), ('2271', '/system/permission/update', 'admin', '2016-04-10 11:04:23', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '14', null, '{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"流程管理\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"flower\"]}'), ('2272', '/system/permission/update', 'admin', '2016-04-10 11:04:23', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '25', null, '{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"流程管理\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"flower\"]}'), ('2273', '/system/permission/update', 'admin', '2016-04-10 11:04:32', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '10', null, '{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"流程管理\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"\"]}'), ('2274', '/system/permission/update', 'admin', '2016-04-10 11:04:32', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '16', null, '{\"id\":[\"79\"],\"icon\":[\"icon-standard-arrow-switch\"],\"sort\":[\"\"],\"description\":[\"\"],\"name\":[\"流程管理\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"\"]}'), ('2275', '/system/permission/update', 'admin', '2016-04-10 11:04:53', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '8', null, '{\"id\":[\"72\"],\"icon\":[\"icon-hamburg-product\"],\"sort\":[\"1\"],\"description\":[\"商品管理\"],\"name\":[\"商品管理\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goods\"]}'), ('2276', '/system/permission/update', 'admin', '2016-04-10 11:04:53', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '14', null, '{\"id\":[\"72\"],\"icon\":[\"icon-hamburg-product\"],\"sort\":[\"1\"],\"description\":[\"商品管理\"],\"name\":[\"商品管理\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goods\"]}'), ('2277', '/system/permission/update', 'admin', '2016-04-10 11:04:57', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '10', null, '{\"id\":[\"73\"],\"icon\":[\"icon-hamburg-milestone\"],\"sort\":[\"2\"],\"description\":[\"商品类型\"],\"name\":[\"商品类型管理\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goodsType\"]}'), ('2278', '/system/permission/update', 'admin', '2016-04-10 11:04:57', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '16', null, '{\"id\":[\"73\"],\"icon\":[\"icon-hamburg-milestone\"],\"sort\":[\"2\"],\"description\":[\"商品类型\"],\"name\":[\"商品类型管理\"],\"pid\":[\"71\"],\"type\":[\"F\"],\"url\":[\"shop/goodsType\"]}'), ('2279', '/system/permission/create', 'admin', '2016-04-10 11:08:15', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '38', null, '{\"id\":[\"\"],\"icon\":[\"icon-standard-book-next\"],\"sort\":[\"1\"],\"description\":[\"\"],\"name\":[\"模型工作区\"],\"pid\":[\"79\"],\"type\":[\"F\"],\"url\":[\"workflow/model/list\"]}'), ('2280', '/system/permission/create', 'admin', '2016-04-10 11:08:15', null, 'Mac OS X', 'Safari', '127.0.0.1', null, '50', null, '{\"id\":[\"\"],\"icon\":[\"icon-standard-book-next\"],\"sort\":[\"1\"],\"description\":[\"\"],\"name\":[\"模型工作区\"],\"pid\":[\"79\"],\"type\":[\"F\"],\"url\":[\"workflow/model/list\"]}'), ('2281', '/workflow/model/create', 'admin', '2016-04-17 23:13:29', null, 'Mac OS X', 'Chrome', '127.0.0.1', null, '35691', null, '{\"name\":[\"测试\"],\"key\":[\"test\"],\"description\":[\"ces\"]}'), ('2282', '/workflow/model/delete/2501', 'admin', '2016-04-18 17:10:23', null, 'Mac OS X', 'Chrome', '127.0.0.1', null, '46', null, '{}'), ('2283', '/system/permission/create', 'admin', '2016-04-23 11:02:57', null, 'Mac OS X', 'Chrome', '127.0.0.1', null, '74', null, '{\"id\":[\"\"],\"type\":[\"F\"],\"name\":[\"流程管理\"],\"url\":[\"/workflow/processinstance/running\"],\"icon\":[\"icon-hamburg-equalizer\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'), ('2284', '/system/permission/update', 'admin', '2016-04-23 11:15:11', null, 'Mac OS X', 'Chrome', '127.0.0.1', null, '41', null, '{\"id\":[\"81\"],\"type\":[\"F\"],\"name\":[\"流程管理\"],\"url\":[\"workflow/processinstance/running\"],\"icon\":[\"icon-hamburg-equalizer\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'), ('2285', '/system/permission/update', 'admin', '2016-04-23 11:16:13', null, 'Mac OS X', 'Chrome', '127.0.0.1', null, '18', null, '{\"id\":[\"81\"],\"type\":[\"F\"],\"name\":[\"活动流程\"],\"url\":[\"workflow/processinstance/running\"],\"icon\":[\"icon-hamburg-equalizer\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}'), ('2286', '/system/permission/create', 'admin', '2016-04-25 14:45:22', null, 'Mac OS X', 'Chrome', '127.0.0.1', null, '75', null, '{\"id\":[\"\"],\"type\":[\"F\"],\"name\":[\"部署流程管理\"],\"url\":[\"workflow/process-list\"],\"icon\":[\"icon-hamburg-graphic\"],\"pid\":[\"79\"],\"sort\":[\"\"],\"description\":[\"\"]}');
COMMIT;

-- ----------------------------
--  Table structure for `oa_leave`
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `leave_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `process_instance_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `reality_end_time` datetime DEFAULT NULL,
  `reality_start_time` datetime DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) NOT NULL,
  `pid` int(9) DEFAULT NULL,
  `org_type` varchar(255) DEFAULT NULL,
  `org_sort` int(3) DEFAULT '0',
  `org_level` int(3) DEFAULT NULL,
  `org_code` varchar(255) DEFAULT NULL,
  `area_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `organization`
-- ----------------------------
BEGIN;
INSERT INTO `organization` VALUES ('1', '总部', null, '总部', '1', '1', '000000', null), ('2', '12313', '1', '13', '31', '131', '131313', '1');
COMMIT;

-- ----------------------------
--  Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT '父节点名称',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '类型:菜单or功能',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `URL` varchar(255) DEFAULT NULL,
  `PERM_CODE` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `ICON` varchar(255) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `permission`
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES ('1', null, '系统管理', 'F', '1', '', '', 'icon-standard-cog', '', ''), ('2', '1', '角色管理', 'F', '3', 'system/role', '', 'icon-hamburg-my-account', 'closed', ''), ('3', '1', '用户管理', 'F', '2', 'system/user', '', 'icon-hamburg-user', 'closed', ''), ('4', '2', '添加', 'O', null, '', 'sys:role:add', '', '', '角色添加'), ('5', '2', '删除', 'O', null, '', 'sys:role:delete', '', '', '角色删除'), ('6', '2', '修改', 'O', null, '', 'sys:role:update', '', '', '角色修改'), ('7', '3', '添加', 'O', null, '', 'sys:user:add', '', '', '用户添加'), ('8', '3', '删除', 'O', null, '', 'sys:user:delete', '', '', '用户删除'), ('12', '1', '权限管理', 'F', '5', 'system/permission', '', 'icon-hamburg-login', 'closed', ''), ('14', '15', '数据源监控', 'F', '6', 'druid', '', 'icon-hamburg-database', '', ''), ('15', null, '系统监控', 'F', '5', '', '', 'icon-hamburg-graphic', '', ''), ('16', '3', '修改', 'O', null, '', 'sys:user:update', '', '', '用户修改'), ('20', '15', '日志管理', 'F', '7', 'system/log', '', 'icon-hamburg-archives', '', ''), ('25', '12', '添加', 'O', null, '', 'sys:perm:add', '', '', '菜单添加'), ('26', '12', '修改', 'O', null, '', 'sys:perm:update', '', '', '菜单修改'), ('27', '12', '删除', 'O', null, '', 'sys:perm:delete', '', '', '菜单删除'), ('28', '2', '查看', 'O', null, '', 'sys:role:view', '', '', '角色查看'), ('29', '3', '查看', 'O', null, '', 'sys:user:view', '', null, '用户查看'), ('30', '12', '查看', 'O', null, '', 'sys:perm:view', '', null, '权限查看'), ('31', '20', '删除', 'O', null, '', 'sys:log:delete', '', null, '删除日志'), ('32', '20', '导出excel', 'O', null, '', 'sys:log:exportExcel', '', null, '导出日志excel'), ('33', '3', '查看用户角色', 'O', null, '', 'sys:user:roleView', '', null, '查看用户角色'), ('34', '2', '保存授权', 'O', null, '', 'sys:role:permUpd', '', null, '保存修改的角色权限'), ('35', '3', '修改用户角色', 'O', null, '', 'sys:user:roleUpd', '', null, '修改用户拥有的角色'), ('36', '2', '查看角色权限', 'O', null, '', 'sys:role:permView', '', null, '查看角色拥有的权限'), ('37', '15', '定时任务管理', 'F', null, 'system/scheduleJob', '', 'icon-hamburg-full-time', null, '定时任务管理，支持集群'), ('38', '15', 'cron表达式生成', 'F', null, 'system/scheduleJob/quartzCron', '', 'icon-hamburg-future', null, ''), ('39', '1', '菜单管理', 'F', '4', 'system/permission/menu', '', 'icon-hamburg-old-versions', null, ''), ('40', '1', '字典管理', 'F', '6', 'system/dict', null, 'icon-hamburg-address', null, '数据字典管理'), ('45', '39', '修改', 'O', null, '', 'sys:perm:update', null, null, '菜单管理'), ('58', '39', '添加', 'O', null, '', 'sys:perm:add', null, null, '菜单管理'), ('59', '39', '删除', 'O', null, '', 'sys:perm:delte', null, null, '菜单管理'), ('61', '40', '添加', 'O', null, '', 'sys:dict:add', null, null, '字典管理'), ('62', '40', '删除', 'O', null, '', 'sys:dict:delete', null, null, '字典管理'), ('63', '40', '修改', 'O', null, '', 'sys:dict:update', null, null, '字典管理'), ('68', '20', '查看', 'O', null, '', 'sys:log:view', null, null, '查看日志'), ('69', '40', '查看', 'O', null, '', 'sys:dict:view', null, null, '字典管理'), ('70', '39', '查看', 'O', null, '', 'sys:perm:menu:view', null, null, '菜单管理'), ('71', null, '商店管理', 'F', null, '', null, 'icon-hamburg-basket', null, '商店'), ('72', '71', '商品管理', 'F', '1', 'shop/goods', null, 'icon-hamburg-product', null, '商品管理'), ('73', '71', '商品类型管理', 'F', '2', 'shop/goodsType', null, 'icon-hamburg-milestone', null, '商品类型'), ('74', '1', '区域信息', 'F', '7', 'system/area', null, 'icon-hamburg-world', null, '管理行政区划'), ('75', '1', '机构管理', 'F', '8', 'system/organization', null, 'icon-cologne-home', null, '组织机构管理'), ('76', '3', '查看用户机构', 'O', null, '', 'sys:user:orgView', null, null, '查看用户机构'), ('77', '3', '修改用户机构', 'O', null, '', 'sys:user:orgUpd', null, null, '修改用户所在的机构'), ('79', null, '流程管理', 'F', null, '', null, 'icon-standard-arrow-switch', null, ''), ('80', '79', '模型工作区', 'F', '1', 'workflow/model/list', null, 'icon-standard-book-next', null, ''), ('81', '79', '活动流程', 'F', null, 'workflow/processinstance/running', null, 'icon-hamburg-equalizer', null, ''), ('82', '79', '部署流程管理', 'F', null, 'workflow/process-list', null, 'icon-hamburg-graphic', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_cron_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'test1', 'testgroup', '0/5 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_job_details`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'test1', 'testgroup', null, 'com.tianyu.jty.system.service.TaskA', '0', '1', '0', '0', 0xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000b7363686564756c654a6f6273720028636f6d2e7469616e79752e6a74792e73797374656d2e656e746974792e5363686564756c654a6f6200000000000000010200064c0009636c6173734e616d657400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000b6465736372697074696f6e71007e00094c000567726f757071007e00094c00046e616d6571007e00094c000673746174757371007e00097870740023636f6d2e7469616e79752e6a74792e73797374656d2e736572766963652e5461736b4174000d302f35202a202a202a202a203f707400097465737467726f75707400057465737431740001317800);
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_locks`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'STATE_ACCESS'), ('scheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_scheduler_state`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('scheduler', 'chenjunfeideMacBook-Pro.local1461580382768', '1461581028144', '15000');
COMMIT;

-- ----------------------------
--  Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qrtz_triggers`
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'test1', 'testgroup', 'test1', 'testgroup', null, '1459838530000', '1459838525000', '5', 'PAUSED', 'CRON', '1421206412000', '0', null, '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `ROLE_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  `SORT` smallint(6) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', 'admin', 'admin', 'admin', '2', null), ('5', 'guest', 'guest', 'guest', '3', null), ('13', 'superadmin', 'superadmin', '超级管理员', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `PERMISSION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PER_REFERENCE_PERMISSI` (`PERMISSION_ID`) USING BTREE,
  KEY `FK_ROLE_PER_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES ('1', '1', '2'), ('2', '1', '1'), ('28', '5', '1'), ('61', '13', '1'), ('62', '13', '3'), ('63', '13', '16'), ('64', '13', '7'), ('65', '13', '2'), ('66', '13', '4'), ('67', '13', '5'), ('68', '13', '6'), ('69', '13', '12'), ('70', '13', '25'), ('71', '13', '26'), ('72', '13', '27'), ('74', '13', '15'), ('75', '13', '14'), ('76', '13', '20'), ('77', '13', '8'), ('81', '1', '3'), ('88', '1', '12'), ('93', '1', '15'), ('94', '1', '14'), ('95', '1', '20'), ('118', '1', '28'), ('120', '1', '30'), ('121', '1', '31'), ('125', '1', '33'), ('126', '1', '36'), ('127', '1', '35'), ('129', '1', '34'), ('130', '1', '32'), ('133', '5', '15'), ('135', '1', '37'), ('142', '1', '38'), ('145', '1', '40'), ('147', '1', '29'), ('151', '1', '61'), ('152', '1', '62'), ('153', '1', '63'), ('162', '5', '39'), ('164', '5', '58'), ('176', '5', '40'), ('177', '1', '39'), ('178', '1', '58'), ('179', '1', '59'), ('183', '1', '4'), ('184', '1', '6'), ('185', '1', '26'), ('186', '1', '27'), ('187', '1', '5'), ('189', '1', '25'), ('190', '1', '45'), ('191', '1', '7'), ('192', '1', '8'), ('193', '1', '16'), ('194', '13', '28'), ('195', '13', '34'), ('196', '13', '36'), ('197', '13', '29'), ('198', '13', '33'), ('199', '13', '35'), ('200', '13', '30'), ('201', '13', '39'), ('202', '13', '45'), ('203', '13', '58'), ('204', '13', '59'), ('205', '13', '40'), ('206', '13', '61'), ('207', '13', '62'), ('208', '13', '63'), ('209', '13', '31'), ('210', '13', '32'), ('211', '13', '37'), ('212', '13', '38'), ('213', '1', '69'), ('215', '5', '69'), ('216', '5', '20'), ('219', '5', '68'), ('220', '5', '38'), ('221', '1', '70'), ('222', '5', '70'), ('223', '5', '3'), ('227', '5', '29'), ('228', '5', '33'), ('229', '5', '35'), ('231', '5', '2'), ('234', '5', '28'), ('235', '5', '45'), ('236', '5', '59'), ('239', '5', '36'), ('240', '1', '68'), ('241', '1', '71'), ('242', '1', '72'), ('243', '1', '73'), ('244', '1', '74'), ('245', '1', '75'), ('246', '1', '76'), ('247', '1', '77'), ('248', '1', '79'), ('249', '1', '80'), ('250', '1', '81'), ('251', '1', '82');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SALT` varchar(255) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `GENDER` smallint(6) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ICON` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `DESCRIPTION` text,
  `LOGIN_COUNT` int(11) DEFAULT NULL,
  `PREVIOUS_VISIT` datetime DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DEL_FLAG` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '159ae5f48f14e89f3f9f54dc995f1f276d472b54', '3d06a5c14d010804', '2014-03-16 22:44:39', '1', '779205344@qq.com', '123456789', 'aaa', '2014-03-20 14:38:57', '0', null, '133', '2016-04-10 11:04:09', '2016-04-10 11:08:15', null), ('3', 'tianyu', 'tiany', '1e8df4b59b3a3ab452ed1707ad3cb1a8e63a0630', 'bb2aa40007ad1238', '2014-04-02 00:00:00', '0', '', '300', '', '2014-04-02 11:49:13', '0', null, null, null, null, null), ('5', 'test', 'tyty11', 'dc6d230074477c8d736bfe0205260e9320565aa6', '94886d7223c80850', '2014-12-05 00:00:00', '1', '', '', null, '2014-12-05 11:55:03', '1', 'ss', '1', null, '2014-12-14 00:09:27', null), ('6', 'superadmin', '超级管理员', 'df894ac0dd60772f22b5d67fe5d8b04fb4c9188d', '97efb48ee6adff63', '2015-01-15 00:00:00', '1', '779205344@qq.com', '13721035120', null, '2015-01-15 15:55:37', null, '超级管理员', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `user_org`
-- ----------------------------
DROP TABLE IF EXISTS `user_org`;
CREATE TABLE `user_org` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(9) NOT NULL,
  `org_id` int(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_org`
-- ----------------------------
BEGIN;
INSERT INTO `user_org` VALUES ('8', '6', '1');
COMMIT;

-- ----------------------------
--  Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  KEY `FK_USER_ROL_REFERENCE_USERS` (`USER_ID`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_role`
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES ('1', '1', '1'), ('19', '3', '5'), ('32', '5', '5'), ('35', '6', '13'), ('36', '6', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
