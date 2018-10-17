package com.jinxin.employee.application.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.jinxin.employee.application.mapper.UserMapper;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.request.user.AddUserRequest;
import com.jinxin.employee.application.request.user.SearchUserRequest;
import com.jinxin.employee.application.request.user.UpdateUserRequest;
import com.jinxin.employee.application.service.UserServiceContract;
import com.jinxin.employee.application.request.login.LoginUserRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
  public boolean banckendLogin(LoginUserRequest loginUserRequest) {

    //验证登录名是否存在
    Map<String,Object> map = new HashMap<>();
    map.put("code", loginUserRequest.getCode());
    List<User> userList = selectByMap(map);
    if(userList == null || userList.isEmpty()){
      return false;
    }
    User user = userList.get(0);
    //验证用户的密码
    if (!BCrypt.checkpw(loginUserRequest.getPassword(), user.getPassword())) {
      return false;
    }
    return true;
  }

  /**
   * 查询所有从业人员列表
   */
  @Override
  public Page index(int page, int size,SearchUserRequest request) {
    Page userPage = new Page<User>(page, size);
    try{
      List<User> userList= baseMapper.getUserList(userPage.getLimit(), userPage.getOffset(),request);
      List<User> totalUserList= baseMapper.getUserList(null, null,request);
      userPage.setRecords(userList);
      userPage.setTotal(totalUserList.size());
    }catch (Exception e){
      e.printStackTrace();
    }
    return userPage;
  }

  @Override
  public boolean add(AddUserRequest request) {
    try{
      User user = new User();
      BeanUtils.copyProperties(request,user);
      //设置密码
      if(request.getPassword()!=null){
        user.setPassword(BCrypt.hashpw(request.getPassword(), BCrypt.gensalt()));
      }
      insert(user);
    }catch (Exception e){
      e.printStackTrace();
      return false;
    }
     return true;
  }

  @Override
  public boolean update(UpdateUserRequest request) {
    try{

      User user =  selectById(request.getId());
      if(user == null){
        return false;
      }

      //设置帐号
      if(request.getCode()!=null && !"".equals(request.getCode())){
        user.setCode(request.getCode());
      }

      //设置手机号
      if(request.getCellphone()!=null && !"".equals(request.getCellphone())){
        user.setCellphone(request.getCellphone());
      }

      //设置身份证号
      if(request.getIdentityCard()!=null && !"".equals(request.getIdentityCard())){
        user.setIdentityCard(request.getIdentityCard());
      }

      //设置名称
      if(request.getName()!=null && !"".equals(request.getName())){
        user.setName(request.getName());
      }

      //设置密码
      if(request.getPassword()!=null){
        user.setPassword(BCrypt.hashpw(request.getPassword(), BCrypt.gensalt()));
      }
      updateById(user);
    }catch (Exception e){
      e.printStackTrace();
      return false;
    }
    return true;
  }

  @Override

  public boolean delete(String userId) {
    if(userId != null && !"".equals(userId)){
      List<Long> ids = new ArrayList<>();
      userId = userId.substring(0,userId.length()-1);
      String[] userIds = userId.split(",");
      for (int i = 0; i < userIds.length; i++) {
        ids.add(Long.parseLong(userIds[0]));
      }
      deleteBatchIds(ids);
      return true;
    }
    return false;
  }
}
