# 时间处理

`@JsonFormat`注解，通常与Jackson库一起使用，用于JSON序列化和反序列化。这个注解允许你自定义日期和时间的格式，以及时区。

让我们详细解析这段代码：

```java
@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
```

1. **@JsonFormat**: 这是Jackson库中的一个注解，用于定义日期、时间或日期时间的格式。
2. **pattern = "yyyy-MM-dd HH:mm:ss"**: 这部分定义了日期时间的格式。具体解释如下：
    - `yyyy`: 四位数的年份
    - `MM`: 两位数的月份（01-12）
    - `dd`: 两位数的日期（01-31）
    - `HH`: 24小时制的小时（00-23）
    - `mm`: 分钟（00-59）
    - `ss`: 秒（00-59）
3. **timezone = "GMT+8"**: 这部分定义了时区。这里指定的是GMT+8，也就是东八区，通常是中国的标准时间。

当这个注解被应用于一个日期、时间或日期时间类型的字段（如`java.util.Date`, `java.util.Calendar`, `java.sql.Date`, `java.sql.Time`, `java.sql.Timestamp`, `java.time.LocalDate`, `java.time.LocalTime`, `java.time.LocalDateTime`等）时，Jackson库在将该字段序列化为JSON字符串时，会按照指定的格式和时区进行转换。同样，当从JSON字符串反序列化到该字段时，也会按照指定的格式和时区进行解析。

例如：

```java
public class MyObject {

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date myDate;

    // getters and setters...
}
```

当`MyObject`的实例被序列化为JSON时，`myDate`字段将按照指定的格式和时区进行转换。同样，当从JSON字符串反序列化到该字段时，也会按照指定的格式和时区进行解析。





# 1. 优雅处理枚举

## 1.1. 枚举-json处理

- 前端传递 枚举code
- 后端响应 枚举code

```java
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum RoleStatusEnum {
    NORMAL(0,"启用"),
    DISABLE(1,"禁用");

    @JsonValue
    private final int code;
    private final String desc;

    RoleStatusEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }
    public int getCode() {
        return code;
    }

}
```



## 1.2. 枚举-数据库处理

- 数据库保存：  枚举code
- 数据库查询：  根据code封装枚举对象

```java
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum RoleStatusEnum {
    NORMAL(0,"启用"),
    DISABLE(1,"禁用");

    @EnumValue
    @JsonValue
    private final int code;
    private final String desc;

    RoleStatusEnum(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }
    public int getCode() {
        return code;
    }

}
```



## 1.3. 枚举-mapper.xml

- mapper.xml 中，直接使用 枚举对象.code 进行判断

```java
List<SysUser> getEnumeData(@Param("ut") RoleStatusEnum roleStatus);
```

```java
<select id="getEnumeData" resultType="com.atguigu.admin.entity.SysUser">
    select * from sys_user where user_type = #{ut.code}
</select>
```





# 2. 前端丢失大Long精度问题

## 2.1. 局部解决

```java
@Data
public class SysResource implements Serializable {
    /**
     * 主键id
     */
    @JsonSerialize(using = LongToStringConverter.class)
    private Long id;
}
```

```java
@Component
public class LongToStringConverter extends JsonSerializer<Long> {

    @Override
    public void serialize(Long aLong, JsonGenerator jsonGenerator,
                          SerializerProvider serializerProvider) throws IOException {
        jsonGenerator.writeString(aLong.toString());
    }
}
```



## 2.2. 统一解决

```java
//统一将 Long 类型序列化为 String
@Configuration
public class JacksonConfiguration {

    @Bean
    public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
        return builder -> {
            // 把 Long 类型序列化为 String
            builder.serializerByType(Long.class, ToStringSerializer.instance);
        };
    }
}
```





# 3 统一进行时间格式化处理

## 3.1. LocalDateTime

### 3.1.1 简单处理

在实体类中使用`@JsonFormat`注解来指定`LocalDateTime`字段的格式化：

```java
package com.qing.learn.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.qing.learn.domain.emus.UserStatusEnum;
import lombok.Data;

import java.time.LocalDateTime;


@Data
public class SysUserVo {

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime updateTime;
}

```





### 3.1.2 统一处理

为了处理`LocalDateTime`，可以类似地创建自定义的序列化器和反序列化器。以下是具体的实现步骤：

1. **创建LocalDateTime格式化器**

   编写自定义的`LocalDateTime`序列化器和反序列化器类：
   ```java
   import com.fasterxml.jackson.core.JsonGenerator;
   import com.fasterxml.jackson.core.JsonParser;
   import com.fasterxml.jackson.core.JsonProcessingException;
   import com.fasterxml.jackson.databind.DeserializationContext;
   import com.fasterxml.jackson.databind.JsonDeserializer;
   import com.fasterxml.jackson.databind.JsonSerializer;
   import com.fasterxml.jackson.databind.SerializerProvider;
   import java.io.IOException;
   import java.time.LocalDateTime;
   import java.time.format.DateTimeFormatter;

   public class CustomLocalDateTimeSerializer extends JsonSerializer<LocalDateTime> {
       private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

       @Override
       public void serialize(LocalDateTime dateTime, JsonGenerator gen, SerializerProvider serializers) throws IOException {
           String formattedDate = dateTime.format(formatter);
           gen.writeString(formattedDate);
       }
   }

   public class CustomLocalDateTimeDeserializer extends JsonDeserializer<LocalDateTime> {
       private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

       @Override
       public LocalDateTime deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
           String date = p.getText();
           return LocalDateTime.parse(date, formatter);
       }
   }
   ```

2. **配置Jackson ObjectMapper**

   在之前的`JacksonConfig`配置类中注册新的`LocalDateTime`序列化器和反序列化器：
   ```java
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
   
   @Configuration
   public class JacksonRuleCustomizerConfiguration {
   
       @Bean
       public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
   
           return builder -> builder
                   // 序列化器
                   .serializerByType(LocalDateTime.class, new CustomLocalDateTimeSerializer())
                   // 反序列化器
                   .deserializerByType(LocalDateTime.class, new CustomLocalDateTimeDeserializer());
       }
   }
   
   ```




## 3.2. Date

### 3.2.1 简单处理

在实体类中使用`@JsonFormat`注解来指定`Date`字段的格式化：

```java
package com.qing.learn.vo;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.qing.learn.domain.emus.UserStatusEnum;
import lombok.Data;

import java.time.Date;


@Data
public class SysUserVo {

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 修改时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;
}

```



### 3.2.2 统一处理

1. **创建日期格式化器**  
   编写自定义日期序列化器和反序列化器类：

   ```java
   import com.fasterxml.jackson.core.JsonGenerator;
   import com.fasterxml.jackson.core.JsonParser;
   import com.fasterxml.jackson.core.JsonProcessingException;
   import com.fasterxml.jackson.databind.DeserializationContext;
   import com.fasterxml.jackson.databind.JsonDeserializer;
   import com.fasterxml.jackson.databind.JsonSerializer;
   import com.fasterxml.jackson.databind.SerializerProvider;
   import java.io.IOException;
   import java.text.ParseException;
   import java.text.SimpleDateFormat;
   import java.util.Date;
   
   public class CustomDateSerializer extends JsonSerializer<Date> {
       private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   
       @Override
       public void serialize(Date date, JsonGenerator gen, SerializerProvider serializers) throws IOException {
           String formattedDate = dateFormat.format(date);
           gen.writeString(formattedDate);
       }
   }
   
   public class CustomDateDeserializer extends JsonDeserializer<Date> {
       private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   
       @Override
       public Date deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
           String date = p.getText();
           try {
               return dateFormat.parse(date);
           } catch (ParseException e) {
               throw new RuntimeException(e);
           }
       }
   }
   ```

2. **配置Jackson ObjectMapper**  
   创建一个配置类，将自定义序列化器和反序列化器注册到Jackson的`ObjectMapper`中：

   ```java
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
       @Bean
       public Jackson2ObjectMapperBuilderCustomizer jackson2ObjectMapperBuilderCustomizer() {
           return builder -> builder
                   // 序列化器
                   .serializerByType(Date.class, new CustomDateSerializer()) //Date全局序列化器自定义处理
                   // 反序列化器
                   .deserializerByType(Date.class, new CustomDateDeserializer()) //Date全局反序列化器自定义处理
       }
   }
   ```













































# -End-