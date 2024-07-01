package com.qing.learn;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.qing.learn.mapper")
@SpringBootApplication
public class LearnEnumApplication {

    public static void main(String[] args) {
        SpringApplication.run(LearnEnumApplication.class, args);
    }

}
