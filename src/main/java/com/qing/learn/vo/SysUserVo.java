package com.qing.learn.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.qing.learn.domain.emus.UserStatusEnum;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;


//1、JSON 相关的注解不要标注在 entity 实体类上。entity和数据库对应
//2、JSON 相关注解标注在vo上，vo和entity是一个模型。只不过 entity 对应数据库，vo 对应前端, 对前端的所有规则都在vo中设置
//3、响应给前端的 和 接受前端的 都用vo
//4、自定义 vo 和 entity 属性对拷规则

// 注意： 所有Long字段对应给前端都可能存在精度丢失问题，每个Long标注注解麻烦...
// 统一抽取: jackson原理：  SpringBoot 自动配置：
// JacksonAutoConfiguration： jackson 自动配置类

@Data
public class SysUserVo {
    /**
     * 用户ID
     */
//    @JsonSerialize(using = LongToStringJsonSerializer.class)
    private Long id; // 跟前端对应。 两个对象之间必须有转换器

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


}
