/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : admin

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 27/06/2024 19:55:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '参数id',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0: 系统内置',
  `config_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '配置分组',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表 - 对象存储等的配置也可以放在这里' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1377930337229471746, '测试配置', 'test_config_key', 'userinfo', '2', 'default', NULL, '2024-06-19 16:16:43', '2024-06-19 08:19:21', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) UNSIGNED NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `dept_sort` decimal(20, 0) NULL DEFAULT 0 COMMENT '显示顺序',
  `admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `dept_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0、正常；1、停用）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1377936163021258754 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '0', '总公司', 0, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '0,1', '深圳总公司', 1, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (3, 1, '0,1', '长沙分公司', 2, NULL, '22323', '11111', '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1371702174283571201, 3, '0,1,3', '财务部门', 5, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1377935436483919873, 2, '0,1,2', '研发部门', 1, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:31:15', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1377935480696078337, 2, '0,1,2', '测试部门', 3, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1377935517522067457, 2, '0,1,2', '产品部门', 5, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1377935562556309505, 2, '0,1,2', '运维部门', 7, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1377935601739497474, 2, '0,1,2', '市场部门', 8, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);
INSERT INTO `sys_dept` VALUES (1377936163021258753, 3, '0,1,3', '市场部门', 3, NULL, NULL, NULL, '0', '2024-06-19 08:30:53', '2024-06-19 08:30:53', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `parent_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '父级id',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `dict_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1372709863595810818, NULL, '男', '1', 'sex', 1, NULL, 'primary', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372709863595810819, NULL, '女', '2', 'sex', 2, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710732080979960, NULL, '正常', '0', 'dict_status', 1, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710732080979962, NULL, '正常', '0', 'role_status', 1, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710732080979966, NULL, '正常', '0', 'dept_status', 1, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710732080979967, NULL, '正常', '0', 'post_status', 1, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710732080979969, NULL, '正常', '0', 'user_status', 1, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710732080979980, NULL, '正常', '0', 'res_status', 1, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710783326986241, NULL, '禁用', '1', 'user_status', 2, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710783326986242, NULL, '禁用', '1', 'dict_status', 2, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710783326986243, NULL, '禁用', '1', 'role_status', 2, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710783326986245, NULL, '禁用', '1', 'dept_status', 2, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710783326986248, NULL, '禁用', '1', 'post_status', 2, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372710783326986281, NULL, '禁用', '1', 'res_status', 2, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372711039930310657, NULL, '管理员', '0', 'user_type', 1, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372711039930310673, NULL, '目录', '1', 'resource_type', 1, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372711076852768769, NULL, '普通用户', '1', 'user_type', 2, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372711076852768774, NULL, '菜单', '2', 'resource_type', 2, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372711076852768776, NULL, 'GET', 'GET', 'http_method', 2, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1372711076852768777, NULL, 'POST', 'POST', 'http_method', 3, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1376409914658590721, NULL, '全部数据权限', '1', 'data_scope', 1, NULL, 'primary', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1376409951539105794, NULL, '自定数据权限', '2', 'data_scope', 2, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1376409996724342786, NULL, '本部门数据权限', '3', 'data_scope', 3, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1376410032313012226, NULL, '本部门及以下数据权限', '4', 'data_scope', 4, NULL, 'error', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1378139151967047682, NULL, '是', '0', 'config_type', 0, NULL, 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1378139197374582785, NULL, '否', '1', 'config_type', 1, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1402133703081861122, NULL, '用户', '1', 'flow_type', 1, NULL, 'primary', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1402133733775777794, NULL, '角色', '2', 'flow_type', 2, NULL, 'info', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1402133777295876097, NULL, '部门', '3', 'flow_type', 3, NULL, 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1404971356122898433, NULL, '事假', '1', 'leave_type', 1, '', 'primary', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1404971356122898434, NULL, '病假', '2', 'leave_type', 2, '', 'success', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1404971356122898435, NULL, '婚假', '3', 'leave_type', 3, '', 'info', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1404971356122898436, NULL, '丧假', '4', 'leave_type', 4, '', 'warning', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1404971356122898437, NULL, '产假', '5', 'leave_type', 5, '', 'danger', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1404971356122898438, NULL, '陪产假', '6', 'leave_type', 6, '', '', '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (1455847279071858690, NULL, '按钮', '3', 'resource_type', 3, NULL, NULL, '0', '2024-06-19 08:31:27', '2024-06-19 08:31:27', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `dict_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1372709749485576194, '性别', 'sex', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372710292954128385, '用户类型', 'user_type', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372710383374934017, '用户状态', 'user_status', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372710383374934018, '字典状态', 'dict_status', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372714386955558914, '角色状态', 'role_status', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372714386955558915, '部门状态', 'dept_status', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372714386955558916, '岗位状态', 'post_status', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372720409946746881, '模块类型', 'resource_type', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372720457925390338, '请求方式', 'http_method', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1372742181504978945, '资源状态', 'res_status', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1376409832819331073, '数据范围', 'data_scope', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1378139043670118402, '参数配置系统内置选项', 'config_type', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1402133618805710849, '工作流审批类型', 'flow_type', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (1404971228288901121, '请假类型', 'leave_type', '0', '2024-06-19 08:31:33', '2024-06-19 08:31:33', NULL, NULL);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `md5` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'md5',
  `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `file_size` int(0) NOT NULL COMMENT '文件大小',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'url地址',
  `source_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源平台： aliyun、qiniu、minio...',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `oper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务模块名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回结果',
  `log_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` bigint(0) NULL DEFAULT NULL COMMENT '父级id',
  `parent_ids` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级ids',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题（目录名称、菜单名称、按钮名称）',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（1、目录；2、菜单；3、按钮）',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识（菜单和按钮）',
  `route_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址（目录和菜单）',
  `component_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单组件名称',
  `component_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单组件地址',
  `res_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（0、正常；1、禁用）',
  `res_sort` decimal(10, 2) NULL DEFAULT NULL COMMENT '排序',
  `menu_ext_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链菜单（1：是；2：否）',
  `menu_cache_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单缓存（1：是；2：否）',
  `menu_hidden_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单和目录可见（1：是；2：否）',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1456051083985825795 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES (1173787141281456130, 1455703600814428162, '0,1455496504403607553,1455703600814428162', '角色添加', '3', 'role:save', NULL, NULL, NULL, '0', 1002.10, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1173787273578192898, 1455703600814428162, '0,1455496504403607553,1455703600814428162', '角色修改', '3', 'role:update', NULL, NULL, NULL, '0', 1002.15, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1173787371326447617, 1455703600814428162, '0,1455496504403607553,1455703600814428162', '角色删除', '3', 'role:delete', NULL, NULL, NULL, '0', 1002.20, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1173787686142517250, 1455703600814428162, '0,1455496504403607553,1455703600814428162', '授权', '3', 'role:auth:resource', NULL, NULL, NULL, '0', 1002.25, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1173793141136859137, 1455496906708664322, '0,1455496504403607553,1455496906708664322', '资源添加', '3', 'resource:add', NULL, NULL, NULL, '0', 1003.10, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1173793218580488194, 1455496906708664322, '0,1455496504403607553,1455496906708664322', '资源修改', '3', 'resource:update', NULL, NULL, NULL, '0', 1003.14, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1173793287136387073, 1455496906708664322, '0,1455496504403607553,1455496906708664322', '资源删除', '3', 'resource:delete', NULL, NULL, NULL, '0', 1003.18, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1208938659106000810, 1455777270018715649, '0,1455496504403607553,1455777270018715649', '字典修改', '3', 'dict:update', NULL, NULL, NULL, '0', 1006.04, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1208938659106000811, 1455777270018715649, '0,1455496504403607553,1455777270018715649', '字典删除', '3', 'dict:delete', NULL, NULL, NULL, '0', 1006.09, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1208938659106000845, 1455777270018715649, '0,1455496504403607553,1455777270018715649', '字典列表', '3', 'dict:data:list', NULL, NULL, NULL, '0', 1006.14, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1208938659106000898, 1455777270018715649, '0,1455496504403607553,1455777270018715649', '字典添加', '3', 'dict:save', NULL, NULL, NULL, '0', 1006.14, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377928808594419714, 1455776367157030914, '0,1455496504403607553,1455776367157030914', '部门添加', '3', 'dept:save', NULL, NULL, NULL, '0', 1004.02, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377928808594419715, 1455776367157030914, '0,1455496504403607553,1455776367157030914', '部门修改', '3', 'dept:update', NULL, NULL, NULL, '0', 1004.04, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377928808594419716, 1455776367157030914, '0,1455496504403607553,1455776367157030914', '部门删除', '3', 'dept:delete', NULL, NULL, NULL, '0', 1004.12, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377929323734642691, 1455776928103247874, '0,1455496504403607553,1455776928103247874', '岗位添加', '3', 'post:save', NULL, NULL, NULL, '0', 1005.04, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377929323734642692, 1455776928103247874, '0,1455496504403607553,1455776928103247874', '岗位修改', '3', 'post:update', NULL, NULL, NULL, '0', 1005.08, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377929323734642693, 1455776928103247874, '0,1455496504403607553,1455776928103247874', '岗位删除', '3', 'post:delete', NULL, NULL, NULL, '0', 1005.14, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377930633724821506, 1455777407700938753, '0,1455496504403607553,1455777407700938753', '配置添加', '3', 'config:save', NULL, NULL, NULL, '0', 1007.02, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377930633724821507, 1455777407700938753, '0,1455496504403607553,1455777407700938753', '配置修改', '3', 'config:update', NULL, NULL, NULL, '0', 1007.07, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377930633724821508, 1455777407700938753, '0,1455496504403607553,1455777407700938753', '配置删除', '3', 'config:delete', NULL, NULL, NULL, '0', 1007.14, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1377930633724821509, 1455777407700938753, '0,1455496504403607553,1455777407700938753', '配置删除（批量）', '3', 'config:batch:delete', NULL, NULL, NULL, '0', 1007.16, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455496504403607553, 0, '0', '系统管理', '1', NULL, '/admin', 'admin', 'Layout', '0', 1000.00, '2', '2', '1', 'system', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455496906708664321, 1455496504403607553, '0,1455496504403607553', '用户管理', '2', 'user:list', 'user-manage', 'user-manage', 'admin/user/user-manage', '0', 1001.00, '2', '2', '1', 'user', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455496906708664322, 1455496504403607553, '0,1455496504403607553', '资源管理', '2', 'resource:list', 'resource-manage', 'resource-manage', 'admin/resource/resource-manage', '0', 1003.00, '2', '2', '1', 'people', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455703600814428162, 1455496504403607553, '0,1455496504403607553', '角色管理', '2', 'role:list', 'role-manage', 'role-manage', 'admin/role/role-manage', '0', 1002.00, '2', '2', '1', 'role', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455710855135870977, 0, '0', '嵌套菜单', '1', NULL, '/nested', 'nested', 'Layout', '0', 1200.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455711672903516161, 1455710855135870977, '0,1455710855135870977', '菜单1', '1', NULL, '/menu1', NULL, 'ParentView', '0', 500.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455711998473781250, 1455711672903516161, '0,1455710855135870977,1455711672903516161', '菜单1-1', '2', NULL, 'menu1-1', 'menu1-1', 'nested/menu1/menu1-1/index', '0', 500.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455712265919381505, 1455711672903516161, '0,1455710855135870977,1455711672903516161', '菜单1-2', '1', NULL, 'menu1-2', 'menu1-2', 'ParentView', '0', 502.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455712369480941569, 1455712265919381505, '0,1455710855135870977,1455711672903516161,1455712265919381505', '菜单1-2-1', '2', NULL, 'menu1-2-1', 'menu1-2-1', 'nested/menu1/menu1-2/menu1-2-1/index', '0', 500.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455712458534404098, 1455712265919381505, '0,1455710855135870977,1455711672903516161,1455712265919381505', '菜单1-2-2', '2', NULL, 'menu1-2-2', 'menu1-2-2', 'nested/menu1/menu1-2/menu1-2-2/index', '0', 502.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455712586129326081, 1455711672903516161, '0,1455710855135870977,1455711672903516161', '菜单1-3', '2', NULL, 'menu1-3', 'menu1-3', 'nested/menu1/menu1-3/index', '0', 504.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455712684905185281, 1455710855135870977, '0,1455710855135870977', '菜单2', '2', NULL, '/menu2', 'menu2', 'nested/menu2/index', '0', 502.00, '2', '2', '1', NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455774928233910274, 1455496504403607553, '0,1455496504403607553', '接口文档', '2', NULL, 'http://localhost:8999/doc.html', NULL, NULL, '0', 1011.00, '1', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455776367157030914, 1455496504403607553, '0,1455496504403607553', '部门管理', '2', 'dept:list', 'dept-manage', 'dept-manage', 'admin/dept/dept-manage', '0', 1004.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455776928103247874, 1455496504403607553, '0,1455496504403607553', '岗位管理', '2', 'post:list', 'post-manage', 'post-manage', 'admin/post/post-manage', '0', 1005.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455777270018715649, 1455496504403607553, '0,1455496504403607553', '字典管理', '2', 'dict:list', 'dict-manage', 'dict-manage', 'admin/dict/dict-type-manage', '0', 1006.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455777407700938753, 1455496504403607553, '0,1455496504403607553', '配置管理', '2', 'config:list', 'config-manage', 'config-manage', 'admin/config/config-manage', '0', 1007.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455777591243681793, 1455496504403607553, '0,1455496504403607553', '日志管理', '2', 'log:list', 'log-manage', 'log-manage', 'admin/log/log-manage', '0', 1008.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455777952633303042, 1455496504403607553, '0,1455496504403607553', '数据监控', '2', NULL, 'http://localhost:8999/druid/login.html', NULL, NULL, '0', 1010.00, '1', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455778042701787138, 0, '0', '协同管理', '1', NULL, '/flow', 'flow', 'Layout', '0', 1100.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455778473704271874, 1455778042701787138, '0,1455778042701787138', '模型管理', '2', 'model:list', 'model-manage', 'model-manage', 'flow/model/model-manage', '0', 1110.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455778622019055618, 1455778042701787138, '0,1455778042701787138', '流程管理', '2', 'process:list', 'process-manage', 'process-manage', 'flow/process/process-manage', '0', 1120.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455801448314703873, 1455496906708664321, '0,1455496504403607553,1455496906708664321', '用户添加', '3', 'user:save', NULL, NULL, NULL, '0', 1001.20, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464001, 1455496906708664321, '0,1455496504403607553,1455496906708664321', '用户修改', '3', 'user:update', NULL, NULL, NULL, '0', 1001.31, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464002, 1455496906708664321, '0,1455496504403607553,1455496906708664321', '用户删除', '3', 'user:delete', NULL, NULL, NULL, '0', 1001.35, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464004, 1455496906708664321, '0,1455496504403607553,1455496906708664321', '重置密码', '3', 'user:reset:pass', NULL, NULL, NULL, '0', 1001.45, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464005, 1455496906708664321, '0,1455496504403607553,1455496906708664321', '授权角色', '3', 'user:auth:role', NULL, NULL, NULL, '0', 1001.50, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464010, 1455778473704271874, '0,1455778042701787138,1455778473704271874', '模型添加', '3', 'model:save', NULL, NULL, NULL, '0', 1110.02, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464011, 1455778473704271874, '0,1455778042701787138,1455778473704271874', '模型修改', '3', 'model:update', NULL, NULL, NULL, '0', 1110.05, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464012, 1455778473704271874, '0,1455778042701787138,1455778473704271874', '模型删除', '3', 'model:delete', NULL, NULL, NULL, '0', 1110.14, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464013, 1455778473704271874, '0,1455778042701787138,1455778473704271874', '模型部署', '3', 'model:deploy', NULL, NULL, NULL, '0', 1110.20, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464020, 1455778622019055618, '0,1455778042701787138,1455778622019055618', '设置审批', '3', 'process:approve', NULL, NULL, NULL, '0', 1120.03, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464021, 1455778622019055618, '0,1455778042701787138,1455778622019055618', '流程图', '3', 'process:chart', NULL, NULL, NULL, '0', 1120.06, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464022, 1455778622019055618, '0,1455778042701787138,1455778622019055618', '激活或者挂起', '3', 'process:hang:change', NULL, NULL, NULL, '0', 1120.10, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1455836405246464023, 1455778622019055618, '0,1455778042701787138,1455778622019055618', '删除', '3', 'process:delete', NULL, NULL, NULL, '0', 1120.16, NULL, NULL, NULL, NULL, '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456050068800679937, 0, '0', '在线办公', '1', NULL, '/leave', 'leave', 'Layout', '0', 1150.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456050203655942145, 1456050068800679937, '0,1456050068800679937', '请假管理', '1', NULL, 'apply', 'apply', 'ParentView', '0', 1151.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456050419205419009, 1456050068800679937, '0,1456050068800679937', '我的任务', '1', NULL, 'task', 'task', 'ParentView', '0', 1152.00, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456050688999829505, 1456050203655942145, '0,1456050068800679937,1456050203655942145', '请假申请', '2', NULL, 'leave-apply', 'leave-apply', 'office/leave/leave-apply', '0', 1151.02, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456050814514376706, 1456050203655942145, '0,1456050068800679937,1456050203655942145', '我的申请', '2', NULL, 'me-apply', 'me-apply', 'office/leave/me-leave-apply', '0', 1151.05, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456050986438897665, 1456050419205419009, '0,1456050068800679937,1456050419205419009', '代办任务', '2', NULL, 'run-task', 'run-task', 'office/task/run-task-manager', '0', 1152.02, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456051083985825793, 1456050419205419009, '0,1456050068800679937,1456050419205419009', '已办任务', '2', NULL, 'his-task', 'his-task', 'office/task/his-task-manager', '0', 1152.05, '2', '2', '1', 'nested', '2024-06-19 08:32:10', '2024-06-19 08:32:10', NULL, NULL);
INSERT INTO `sys_resource` VALUES (1456051083985825794, 27, NULL, '人习严全手计你', '1', 'voluptate ullamco', 'voluptate ipsum minim enim', '状验界计起马', 'mollit', '1', 34.00, '1', '1', '1', 'http://dummyimage.com/100x100', '2024-06-26 03:01:32', '2024-06-26 03:22:17', NULL, 1170896100656156674);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色权限字符串',
  `role_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色状态（0、正常；1、禁用）',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1、全部数据权限；2、自定数据权限；3、本部门数据权限；4、本部门及以下数据权限）',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1171709223680184321, '管理员', 'ROLE_ADMIN', '0', '1', '2024-06-19 08:32:15', '2024-06-19 08:32:15', NULL, NULL);
INSERT INTO `sys_role` VALUES (1171953892250918913, '开发组长', 'ROLE_DEVELOP', '0', '4', '2024-06-19 08:32:15', '2024-06-19 08:32:15', NULL, NULL);
INSERT INTO `sys_role` VALUES (1171953965877731330, '测试组长', 'ROLE_TEST', '0', '4', '2024-06-19 08:32:15', '2024-06-19 08:32:15', NULL, NULL);
INSERT INTO `sys_role` VALUES (1171954063797952514, '项目经理', 'ROLE_MANAGE', '1', '1', '2024-06-19 08:32:15', '2024-06-19 08:32:15', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) UNSIGNED NOT NULL COMMENT '角色id',
  `dept_id` bigint(0) UNSIGNED NOT NULL COMMENT '部门id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (1171953892250918913, 1, '2024-06-19 08:32:20', '2024-06-19 08:32:20', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res`  (
  `role_id` bigint(0) UNSIGNED NOT NULL COMMENT '角色id',
  `res_id` bigint(0) UNSIGNED NOT NULL COMMENT '资源id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和资源关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173787141281456130, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173787273578192898, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173787371326447617, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173787686142517250, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173793141136859137, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173793218580488194, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1173793287136387073, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1208938659106000810, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1208938659106000811, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1208938659106000845, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1208938659106000898, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377928808594419714, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377928808594419715, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377928808594419716, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377929323734642691, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377929323734642692, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377929323734642693, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377930633724821506, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377930633724821507, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377930633724821508, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1377930633724821509, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455496504403607553, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455496906708664321, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455496906708664322, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455703600814428162, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455710855135870977, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455710855135870988, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455711672903516161, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455711998473781250, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455712265919381505, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455712369480941569, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455712458534404098, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455712586129326081, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455712684905185281, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455774928233910274, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455776367157030914, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455776928103247874, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455777270018715649, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455777407700938753, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455777591243681793, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455777952633303042, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455778042701787138, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455778473704271874, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455778622019055618, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455801448314703873, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464001, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464002, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464004, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464005, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464010, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464011, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464012, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464013, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464020, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464021, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464022, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1455836405246464023, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456050068800679937, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456050203655942145, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456050419205419009, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456050688999829505, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456050814514376706, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456050986438897665, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1171709223680184321, 1456051083985825793, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173787141281456130, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173787273578192898, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173787371326447617, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173787686142517250, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173793141136859137, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173793218580488194, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1173793287136387073, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1208938659106000810, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1208938659106000811, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1208938659106000845, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1208938659106000898, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377928808594419714, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377928808594419715, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377928808594419716, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377929323734642691, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377929323734642692, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377929323734642693, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377930633724821506, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377930633724821507, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377930633724821508, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1377930633724821509, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455496504403607553, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455496906708664321, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455496906708664322, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455703600814428162, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455774928233910274, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455776367157030914, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455776928103247874, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455777270018715649, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455777407700938753, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455777591243681793, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455777952633303042, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455801448314703873, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455836405246464001, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455836405246464002, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455836405246464004, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);
INSERT INTO `sys_role_res` VALUES (1650308365715365889, 1455836405246464005, '2024-06-19 08:32:25', '2024-06-19 08:32:25', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `dept_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_type` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '用户类型（0-管理员；1-普通用户）',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别（0-男；1-女；2-保密）',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0-正常；1-禁用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1650308201147654151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1170896100656156674, 1, 'admin', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '管理员', '0', '13223423@qq.com', '15988888885', '1', NULL, '0', '管理员', '2024-06-19 08:32:30', '2024-06-24 06:42:55', NULL, NULL);
INSERT INTO `sys_user` VALUES (1171948965562806274, 2, '1234567', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '啊啊啊222', '1', 'dsfa', '112312', '1', NULL, '0', 'dd', '2024-06-19 08:32:30', '2024-06-24 05:33:11', NULL, 1170896100656156674);
INSERT INTO `sys_user` VALUES (1298494547157360642, 3, '121212121', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '千千万万1', '1', 'ddasfsda@qq', '154123123213', '1', NULL, '0', 'ddd', '2024-06-19 08:32:30', '2024-06-19 08:32:30', NULL, NULL);
INSERT INTO `sys_user` VALUES (1339368705646702593, 3, '12345676', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1116', '1', '11116', '123123412346', '2', NULL, '1', NULL, '2024-06-19 08:32:30', '2024-06-19 08:32:30', NULL, NULL);
INSERT INTO `sys_user` VALUES (1455798474943238145, 2, 'zhangsan', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '张三', '1', NULL, '123123123', '1', NULL, '0', NULL, '2024-06-19 08:32:30', '2024-06-19 08:32:30', NULL, NULL);
INSERT INTO `sys_user` VALUES (1650308201147654145, 1, 'zhangsan233', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '张三xxx', '1', '1111', '15945784578', '1', NULL, '0', NULL, '2024-06-19 08:32:30', '2024-06-19 08:32:30', NULL, NULL);
INSERT INTO `sys_user` VALUES (1650308201147654147, 0, 'leifengyang', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '', '', '', '', '', '', '', '', '2024-06-19 08:32:30', '2024-06-19 08:32:30', NULL, NULL);
INSERT INTO `sys_user` VALUES (1650308201147654149, 1, 'zhangsan111', '123456', '张三', '0', 'aaa@qq.com', '13223232211', '0', '', '0', '', '2024-06-24 05:51:03', '2024-06-24 05:51:03', 1170896100656156674, NULL);
INSERT INTO `sys_user` VALUES (1650308201147654150, 52, '毛艳', 'deserunt sunt dolore ut', '丁平', '0', 'f.btkcf@qq.com', '84', '1', 'http://dummyimage.com/100x100', '0', 'commodo labore anim proident', '2024-06-24 05:54:59', '2024-06-24 06:48:07', 1170896100656156674, 1170896100656156674);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` bigint(0) UNSIGNED NOT NULL COMMENT '角色id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `creator_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '创建者id',
  `update_id` bigint(0) UNSIGNED NULL DEFAULT NULL COMMENT '修改者id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1170896100656156674, 1171709223680184321, '2024-06-19 08:32:39', '2024-06-19 08:32:39', NULL, NULL);
INSERT INTO `sys_user_role` VALUES (1171948965562806274, 1171953965877731330, '2024-06-19 08:32:39', '2024-06-19 08:32:39', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
