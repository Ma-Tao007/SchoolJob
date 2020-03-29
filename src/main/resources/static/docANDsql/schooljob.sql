/*
 Navicat Premium Data Transfer

 Source Server         : myLocal
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : schooljob

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 29/03/2020 22:37:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业管理',
  `companyno` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业编码',
  `companyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `post` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘职位',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业地址',
  `people` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '招聘负责人',
  `peoplephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `date` date NULL DEFAULT NULL COMMENT '发布时间',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '面试方式',
  `qualiy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所需学历',
  `money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪资代码',
  `isdel` int(255) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, 'GS202003', '公司1', '电力工程师', '繁华大道', '黎明 ', '19978451245', '2020-02-19', '电话米娜是', '本科', '4000-5000', 0);
INSERT INTO `company` VALUES (2, 'GS202002', '公司2', '电力工程师', '繁华大道', '黎明 ', '19978451245', '2020-03-03', '电话米娜是', '本科', '4000-5000', 0);
INSERT INTO `company` VALUES (3, 'GS202001', '公司3', 'java开发', '北京市沿海区地方政法', '小吗', '15545784578', '2020-03-02', '电话面试', '本科', '4000-5000', 0);
INSERT INTO `company` VALUES (4, 'GS202004', '公司4', '会计', '和覅饿', '小工', '15245784578', '2020-03-03', '现场面试', '大专', '5000', 0);

-- ----------------------------
-- Table structure for passprodect
-- ----------------------------
DROP TABLE IF EXISTS `passprodect`;
CREATE TABLE `passprodect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of passprodect
-- ----------------------------
INSERT INTO `passprodect` VALUES (1, 2, NULL, '你是不是猪', '是的');
INSERT INTO `passprodect` VALUES (2, 1, NULL, '你是狗吗', '不是');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `kind` int(11) NULL DEFAULT NULL COMMENT '用户类型（1 管理员 0学生）',
  `persname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `qualiy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `skill` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技能',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所学专业',
  `isdel` int(255) NULL DEFAULT 0 COMMENT '是否删除（0 否 1 是）',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态（0 禁用 1启用）',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '自我介绍\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES (1, 'admin', 'admin', 1, '马涛', '女', '2020-02-27', '15056408321', '2568819232@qq.com', '本科', '任帅', '软件工程', 1, 1, '真水');
INSERT INTO `sysuser` VALUES (2, 'username', 'a111111', 0, '马涛', '女', '2020-02-28', '15056408321', '2568819232@qq.com', '本科', '任帅', '软件工程', 0, 1, NULL);
INSERT INTO `sysuser` VALUES (3, 'maker', 'a111111', 1, '马涛', '男', '2020-02-28', '15056408321', '2568819232@qq.com', '本科', '任帅', '软件工程', 0, 0, NULL);
INSERT INTO `sysuser` VALUES (4, 'xm', 'a111111', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `sysuser` VALUES (5, 'xaa', 'a111111', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL);
INSERT INTO `sysuser` VALUES (6, 'wfj', '154043', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
