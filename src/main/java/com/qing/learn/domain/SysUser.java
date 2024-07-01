package com.qing.learn.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.qing.learn.domain.emus.UserStatusEnum;
import lombok.Data;

/**
 * 用户表
 * @TableName sys_user
 */
@TableName(value ="sys_user")
@Data
public class SysUser implements Serializable {
    /**
     * 用户id
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 部门id
     */
    private Long deptId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 用户昵称
     */
    private String nickName;

    /**
     * 用户类型（0-管理员；1-普通用户）
     */
    private String userType;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    private String phoneNumber;

    /**
     * 性别（0-男；1-女；2-保密）
     */
    private String gender;

    /**
     * 头像
     */
    private String avatar;

    /**
     * 帐号状态（0-正常；1-禁用）
     */
    private UserStatusEnum userStatus;

    /**
     * 备注
     */
    private String remark;

    /**
     * 创建时间
     */
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private Date createTime;
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private Date updateTime;
    private LocalDateTime updateTime;

    /**
     * 创建者id
     */
    private Long creatorId;

    /**
     * 修改者id
     */
    private Long updateId;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}