package com.qing.learn.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qing.learn.domain.SysUser;
import com.qing.learn.service.SysUserService;
import com.qing.learn.mapper.SysUserMapper;
import org.springframework.stereotype.Service;

/**
* @author Administrator
* @description 针对表【sys_user(用户表)】的数据库操作Service实现
* @createDate 2024-07-01 11:49:27
*/
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser>
    implements SysUserService{

}




