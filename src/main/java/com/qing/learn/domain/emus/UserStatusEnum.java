package com.qing.learn.domain.emus;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

@Getter
//@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum UserStatusEnum {

    /**
     * 用户状态
     */
    ENABLE(0,"启用"),
    DISABLE(1,"禁用");

    @EnumValue
    @JsonValue
    private Integer code;
    private String desc;
    UserStatusEnum(Integer code,String desc){
        this.code = code;
        this.desc = desc;
    }
}
