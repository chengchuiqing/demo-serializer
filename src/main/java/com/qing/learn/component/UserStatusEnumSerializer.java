package com.qing.learn.component;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.qing.learn.domain.emus.UserStatusEnum;

import java.io.IOException;


/**
 * 暂时没有用，如果要使用的话最好编写一个序列化，和反序列化两个
 * 个人认为注解方式比较简单且明晰，不需要自己编写序列化器
 */
public class UserStatusEnumSerializer extends JsonSerializer<UserStatusEnum> {
    @Override
    public void serialize(UserStatusEnum userStatusEnum, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeString(userStatusEnum.getDesc()+"");
    }
}
