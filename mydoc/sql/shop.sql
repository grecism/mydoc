/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-11-22 15:26:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `hello_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `hello_system_config`;
CREATE TABLE `hello_system_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项名称',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '类型',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `disable_flag` int(10) NOT NULL DEFAULT '0' COMMENT '是否禁用该配置，0不禁用 1禁用',
  `config_value` varchar(512) NOT NULL DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数配置表';

-- ----------------------------
-- Records of hello_system_config
-- ----------------------------

-- ----------------------------
-- Table structure for `hello_sys_button`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_button`;
CREATE TABLE `hello_sys_button` (
  `fhbutton_id` varchar(100) NOT NULL COMMENT '按钮主键',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `qx_name` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`fhbutton_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统按钮表';

-- ----------------------------
-- Records of hello_sys_button
-- ----------------------------
INSERT INTO `hello_sys_button` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `hello_sys_button` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `hello_sys_button` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');

-- ----------------------------
-- Table structure for `hello_sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_log`;
CREATE TABLE `hello_sys_log` (
  `fhlog_id` varchar(100) NOT NULL COMMENT '日志主键',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `cztime` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `content` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`fhlog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

-- ----------------------------
-- Records of hello_sys_log
-- ----------------------------
INSERT INTO `hello_sys_log` VALUES ('0805f5ac727748b0aad7164dbb5dcb09', 'admin', '2017-11-21 14:35:47', '登录系统');

-- ----------------------------
-- Table structure for `hello_sys_loginimg`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_loginimg`;
CREATE TABLE `hello_sys_loginimg` (
  `loginimg_id` varchar(100) NOT NULL COMMENT '登录背景图片ID',
  `name` varchar(30) DEFAULT NULL COMMENT '文件名',
  `filepath` varchar(100) DEFAULT NULL COMMENT '路径',
  `type` int(2) NOT NULL COMMENT '状态  1启用 2停用',
  `forder` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`loginimg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录背景图片表';

-- ----------------------------
-- Records of hello_sys_loginimg
-- ----------------------------

-- ----------------------------
-- Table structure for `hello_sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_menu`;
CREATE TABLE `hello_sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '上级菜单ID',
  `menu_order` varchar(100) DEFAULT NULL COMMENT '菜单序号',
  `menu_icon` varchar(60) DEFAULT NULL COMMENT '菜单图标',
  `menu_type` varchar(10) DEFAULT NULL COMMENT '菜单类型',
  `menu_state` int(1) DEFAULT NULL COMMENT '菜单状态 1显示 2隐藏',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of hello_sys_menu
-- ----------------------------
INSERT INTO `hello_sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-home blue', '2', '1');
INSERT INTO `hello_sys_menu` VALUES ('2', '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('3', '日志管理', 'log/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('20', '在线管理', 'onlinemanager/list.do', '1', '5', 'menu-icon fa fa-laptop green', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('36', '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('37', '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('39', '按钮管理', 'button/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', '1');
INSERT INTO `hello_sys_menu` VALUES ('40', '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `hello_sys_menu` VALUES ('41', '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', '1');

-- ----------------------------
-- Table structure for `hello_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_role`;
CREATE TABLE `hello_sys_role` (
  `role_id` varchar(100) NOT NULL COMMENT '角色ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `rights` varchar(255) DEFAULT NULL COMMENT '角色对应权限值',
  `parent_id` varchar(100) DEFAULT NULL COMMENT '父角色ID',
  `add_qx` varchar(255) DEFAULT NULL COMMENT '角色是否有增加权限 1是 0否',
  `del_qx` varchar(255) DEFAULT NULL COMMENT '角色是否有删除权限 1是 0否',
  `edit_qx` varchar(255) DEFAULT NULL COMMENT '角色是否有编辑权限 1是 0否',
  `cha_qx` varchar(255) DEFAULT NULL COMMENT '角色是否有查询权限 1是 0否',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of hello_sys_role
-- ----------------------------
INSERT INTO `hello_sys_role` VALUES ('1', '系统管理组', '1410519908679396969752962939771994285284524046', '0', '1', '1', '1', '1');
INSERT INTO `hello_sys_role` VALUES ('2', '系统管理', '1410519908679396969752962939771994285284524046', '0', '1', '1', '1', '1');
INSERT INTO `hello_sys_role` VALUES ('d66b96116d8a4a4c9881e77983e85b1d', '运营管理员', '19552943817996112490415001860022403596288', '1', '0', '0', '0', '16725558898897967356151788704486271129485312');

-- ----------------------------
-- Table structure for `hello_sys_role_button`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_role_button`;
CREATE TABLE `hello_sys_role_button` (
  `rb_id` varchar(100) NOT NULL COMMENT '主键ID',
  `role_id` varchar(100) DEFAULT NULL COMMENT '角色ID',
  `button_id` varchar(100) DEFAULT NULL COMMENT '按钮ID',
  PRIMARY KEY (`rb_id`),
  KEY `角色表外键` (`role_id`) USING BTREE,
  KEY `fbutton` (`button_id`),
  CONSTRAINT `fbutton` FOREIGN KEY (`button_id`) REFERENCES `hello_sys_button` (`fhbutton_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`role_id`) REFERENCES `hello_sys_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色按钮关联表';

-- ----------------------------
-- Records of hello_sys_role_button
-- ----------------------------

-- ----------------------------
-- Table structure for `hello_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `hello_sys_user`;
CREATE TABLE `hello_sys_user` (
  `user_id` varchar(100) NOT NULL COMMENT '用户ID',
  `username` varchar(255) DEFAULT NULL COMMENT '登录账号',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `rights` varchar(255) DEFAULT NULL COMMENT '拥有的权限值',
  `role_id` varchar(100) DEFAULT NULL COMMENT '对应角色ID值',
  `last_login` varchar(255) DEFAULT NULL COMMENT '最后登录时间',
  `ip` varchar(100) DEFAULT NULL COMMENT '最后登录IP',
  `status` varchar(32) DEFAULT NULL COMMENT '状态 0可用 1禁用',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `skin` varchar(100) DEFAULT NULL COMMENT '头像路径',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱账号',
  `number` varchar(100) DEFAULT NULL COMMENT '编号',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机',
  `current_review_count` int(10) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台系统用户表';

-- ----------------------------
-- Records of hello_sys_user
-- ----------------------------
INSERT INTO `hello_sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'admin', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-11-22 15:12:28', '0:0:0:0:0:0:0:1', '0', 'admin', 'default', '', '', '', '399', '2017-09-29 17:52:44', '2017-09-17 17:52:46');
INSERT INTO `hello_sys_user` VALUES ('efd3f9f46ef146749efaefba8682da98', 'admin2', 'ae175d714b81ec798b111b26a610c6e0bdf0053d', 'admin2', '1133671055321055258374707980945218933803269864762743594642571294', '2', '2017-11-22 15:24:37', '0:0:0:0:0:0:0:1', '0', 'admin', 'default', 'admin2@126.com', '002', '13244556677', '6', '2017-11-22 14:44:01', '2017-11-22 14:44:01');

-- ----------------------------
-- Table structure for `hello_user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `hello_user_admin`;
CREATE TABLE `hello_user_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '(管理用户id)',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT 'md5密码',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `seal_flag` int(11) DEFAULT '0' COMMENT '是否停用(0:启用 1:停用)',
  `current_review_count` int(11) NOT NULL COMMENT '登陆次数',
  `last_login_ip` varchar(64) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hellodai后台用户表';

-- ----------------------------
-- Records of hello_user_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `sp_user`
-- ----------------------------
DROP TABLE IF EXISTS `sp_user`;
CREATE TABLE `sp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `password` int(11) DEFAULT NULL COMMENT '密码',
  `user_gid` varchar(255) DEFAULT NULL COMMENT '用户唯一标识',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `id_card_no` int(11) DEFAULT NULL COMMENT '身份证号码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sp_user
-- ----------------------------
