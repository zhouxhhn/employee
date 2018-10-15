package com.jinxin.employee.application.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.jinxin.employee.application.mapper.UserMapper;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.service.UserServiceContract;
import com.jinxin.employee.application.vo.login.LoginUserVo;

import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 */
@Primary
@Service
public class UserService extends ServiceImpl<UserMapper, User> implements UserServiceContract {

  @Override
  public boolean banckendLogin(LoginUserVo loginUserVo) {

    //验证登录名是否存在
    Map<String,Object> map = new HashMap<>();
    map.put("code",loginUserVo.getCode());
    List<User> userList = selectByMap(map);
    if(userList == null || userList.isEmpty()){
      return false;
    }
    User user = userList.get(0);
    //验证用户的密码
    if (!BCrypt.checkpw(loginUserVo.getPassword(), user.getPassword())) {
      return false;
    }
    return true;
  }

  /**
   * 查询所有从业人员列表
   */
  @Override
  public Page index(int page, int size) {
    Page userPage = new Page<User>(page, size);
    userPage = selectPage(userPage);
    return userPage;
  }
}
