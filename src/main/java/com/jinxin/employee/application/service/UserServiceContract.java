package com.jinxin.employee.application.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.request.login.LoginUserRequest;
import com.jinxin.employee.application.request.user.AddUserRequest;
import com.jinxin.employee.application.request.user.UpdateUserRequest;

/**
 * <p>
 * 文件表 服务类
 * </p>
 *
 * @author Sipin ERP Development Team
 */
public interface UserServiceContract extends IService<User> {

   /**后台登录*/
   boolean banckendLogin(LoginUserRequest loginUserRequest);

   /**查询所有从业人员列表*/
   Page index(int page,int size);

   /**新增*/
   boolean add(AddUserRequest request);

   /**修改*/
   boolean update(UpdateUserRequest request);

}
