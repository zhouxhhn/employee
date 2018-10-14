package com.jinxin.employee.application.service;

import com.baomidou.mybatisplus.service.IService;
import com.jinxin.employee.application.pojo.User;

/**
 * <p>
 * 文件表 服务类
 * </p>
 *
 * @author Sipin ERP Development Team
 */
public interface UserServiceContract extends IService<User> {

   boolean save(User user);



}
