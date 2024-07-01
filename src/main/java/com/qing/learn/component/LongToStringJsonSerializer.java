package com.qing.learn.component;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

/**
 * 自定义Long类型序列化规则，暂时没有用，只是给个样例，因为Jackson默认提供了个Long类型序列化规则。
 */
public class LongToStringJsonSerializer extends JsonSerializer<Long> {
    @Override
    public void serialize(Long aLong, JsonGenerator jsonGenerator, SerializerProvider serializerProvider)
            throws IOException {
        //定义 long的写出规则
        jsonGenerator.writeString(aLong.toString());
    }
}
