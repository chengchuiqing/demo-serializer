package com.qing.learn.config;

import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.qing.learn.component.CustomDateDeserializer;
import com.qing.learn.component.CustomDateSerializer;
import com.qing.learn.component.CustomLocalDateTimeDeserializer;
import com.qing.learn.component.CustomLocalDateTimeSerializer;
import com.qing.learn.domain.emus.UserStatusEnum;
import org.springframework.boot.autoconfigure.jackson.Jackson2ObjectMapperBuilderCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;
import java.util.Date;

@Configuration
public class JacksonRuleCustomizerConfiguration {
    /**
     * 自定义枚举序列化器
     * @return
     */
    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {

        // Serializer：后端写给前端： 枚举变为code
        // Deserializer：前端发过来，后端解析： code 变为枚举
        return builder -> builder
                // 序列化器
                .serializerByType(Long.class, ToStringSerializer.instance) //Long全局序列化器自定义处理，解决前端精度丢失问题
                .serializerByType(Date.class, new CustomDateSerializer()) //Date全局序列化器自定义处理
                .serializerByType(LocalDateTime.class, new CustomLocalDateTimeSerializer()) // LocalDateTime全局序列化器自定义处理

                // 反序列化器
                .deserializerByType(Date.class, new CustomDateDeserializer()) //Date全局反序列化器自定义处理
                .deserializerByType(LocalDateTime.class, new CustomLocalDateTimeDeserializer()); // LocalDateTime全局反序列化器自定义处理
    }
}
