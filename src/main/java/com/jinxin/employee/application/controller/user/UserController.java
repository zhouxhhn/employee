/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.controller.user;

import com.baomidou.mybatisplus.plugins.Page;
import com.jinxin.employee.application.service.UserServiceContract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/user")
public class UserController {

  @Autowired
  private UserServiceContract userService;

  /**
   * 查询所有从业人员
   */
  @RequestMapping(value = "/list",method = RequestMethod.GET)
  public ModelAndView list(){

    Page page = userService.index(1, 15);
    return new ModelAndView("/user/list","page", page);
  }
}
