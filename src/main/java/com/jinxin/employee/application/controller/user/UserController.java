/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.controller.user;

import com.baomidou.mybatisplus.plugins.Page;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.request.user.AddUserRequest;
import com.jinxin.employee.application.request.user.SearchUserRequest;
import com.jinxin.employee.application.request.user.UpdateUserRequest;
import com.jinxin.employee.application.service.UserServiceContract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/user")
public class UserController {

  @Autowired
  private UserServiceContract userService;

  /**
   * 查询所有从业人员
   */
  @RequestMapping(value = "/list",method = RequestMethod.GET)
  public ModelAndView list(@ModelAttribute("request") @Valid SearchUserRequest request){

    Page page = userService.index(1, 15,request);
    return new ModelAndView("/user/list","page", page).addObject("searchRequest",request);
  }

  /**
   * 新增从业人员
   */
  @RequestMapping(value = "/add",method = RequestMethod.POST)
  public ModelAndView add(@ModelAttribute("addUserRequest") @Valid AddUserRequest addUserRequest){

    boolean results =  userService.add(addUserRequest);
    return new ModelAndView("redirect:/user/list");
  }

  /**
   * 更新从业人员
   */
  @RequestMapping(value = "/update",method = RequestMethod.POST)
  public ModelAndView update(@ModelAttribute("updateUserRequest") @Valid UpdateUserRequest updateUserRequest){

    boolean results =  userService.update(updateUserRequest);
    return new ModelAndView("redirect:/user/list");
  }

  /**
   * 查询指定的从业人员
   */
  @RequestMapping(value = "/search",method = RequestMethod.GET)
  public ModelAndView search(Long userId){
    User user =  userService.selectById(userId);
    return new ModelAndView("redirect:/user/list","user",user);
  }

  /**
   * 删除指定的从业人员
   */
  @RequestMapping(value = "/delete/{userId}",method = RequestMethod.GET)
  public ModelAndView delete(@PathVariable String userId){
    boolean results =  userService.delete(userId);
    return new ModelAndView("redirect:/user/list");
  }
}
