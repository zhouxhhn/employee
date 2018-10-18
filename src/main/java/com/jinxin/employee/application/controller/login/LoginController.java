package com.jinxin.employee.application.controller.login;

import com.jinxin.employee.application.annotation.PermissionAnnotation;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.service.UserServiceContract;
import com.jinxin.employee.application.request.login.LoginUserRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by zhouxh on 2018/10/14.
 */
@Controller
public class LoginController {

    @Autowired
    private UserServiceContract userService;

    /**
     * 登录
     */

    @RequestMapping(value = "/login")
    public ModelAndView login(@ModelAttribute("loginUserVo") @Valid LoginUserRequest loginUserRequest, HttpServletRequest request){

        if(loginUserRequest == null || loginUserRequest.getCode() == null || loginUserRequest.getPassword() == null){
            return new ModelAndView("login/login", "loginUserVo", new LoginUserRequest());
        }

        User user = userService.banckendLogin(loginUserRequest);

        //登录失败
        if(user == null){
            return new ModelAndView("login/login", "loginUserVo", loginUserRequest).addObject("message","用户名或密码错误");
        }

        request.getSession().setAttribute("user", user);

        //登录成功，返回到首页
        return new ModelAndView("redirect:/index");

    }



    /**
     * 退出
     */
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request){

         request.getSession().removeAttribute("user");

        //退出返回到登录页
        return new ModelAndView("login/login", "loginUserVo", new LoginUserRequest());

    }
}
