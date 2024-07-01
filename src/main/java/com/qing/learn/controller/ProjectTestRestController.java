package com.qing.learn.controller;



import com.qing.learn.domain.SysUser;
import com.qing.learn.domain.emus.UserStatusEnum;
import com.qing.learn.service.SysUserService;
import com.qing.learn.vo.SysUserVo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/test")
public class ProjectTestRestController {


    @Autowired
    private SysUserService sysUserService;


    @GetMapping("/getUser")
    public SysUser getUser(){
        SysUser sysUser = new SysUser();
        sysUser.setId(1L);
        sysUser.setUsername("zhangsan");
        sysUser.setNickName("张三");
        //枚举对象; 默认JSON处理返回的是枚举的名。
        //需求：json需要返回枚举的code
        sysUser.setUserStatus(UserStatusEnum.ENABLE);
        return sysUser;
    }

    @PostMapping("/saveUser")
    public Long saveUser(@RequestBody SysUser userJson){
        System.out.println("保存的用户："+userJson);

        //枚举对象
        System.out.println("用户状态："+userJson.getUserStatus());

        //数据库处理：自动转为枚举code
        boolean save = sysUserService.save(userJson);
        return userJson.getId();
    }

    // 枚举：前端 《-》 后端 《-》 数据库
    //为了强类型约束；
    //后端给前端返回数据的时候：原理
    // 1、JSON数据：后端： SysUser 对象转为 Json 交给前端。 利用内部的 Converters 转换器。
    // 2、转换器最终调用 jackson 的 ObjectMapper 将对象转为 Json。
    // 3、对象转为 json 怎么转是 jackson 决定的。
    @GetMapping("/user/{id}")
    public SysUserVo getUserById(@PathVariable("id") Long id){
        SysUser sysUser = sysUserService.getById(id);
        //枚举对象;
        System.out.println("用户状态："+sysUser.getUserStatus());
        SysUserVo sysUserVo = new SysUserVo();
        // 即使直接把 Long 定义 为 String， Do - Vo 进行属性对拷的时候。由于Long!=String。默认会被忽略。Id就是空的
        BeanUtils.copyProperties(sysUser, sysUserVo);
        return sysUserVo;
    }
}
