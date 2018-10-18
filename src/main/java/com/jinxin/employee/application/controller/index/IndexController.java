package com.jinxin.employee.application.controller.index;

import com.jinxin.employee.application.annotation.PermissionAnnotation;
import com.jinxin.employee.application.pojo.User;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by zhouxh on 2018/10/14.
 */
@Controller
public class IndexController {
    /**
     * 主页
     */
    @PermissionAnnotation
    @RequestMapping(value = "/index")
    public ModelAndView index(HttpSession session){

      User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
      if(user != null){
        //登录成功，返回到首页
        return new ModelAndView("index/index");
      }
      return new ModelAndView("redirect:/login");
    }
}
