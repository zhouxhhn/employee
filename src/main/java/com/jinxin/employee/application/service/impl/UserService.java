package com.jinxin.employee.application.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.jinxin.employee.application.mapper.UserMapper;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.service.UserServiceContract;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;


/**
 * <p>
 * 用户表 服务实现类
 * </p>
 */
@Primary
@Service
public class UserService extends ServiceImpl<UserMapper, User> implements UserServiceContract {


  @Override
  public boolean save(User user) {
    User user1 =  selectById(1);

    return true;
  }
}
