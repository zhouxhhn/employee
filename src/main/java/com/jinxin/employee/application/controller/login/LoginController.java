package com.jinxin.employee.application.controller.login;

import com.jinxin.employee.application.service.UserServiceContract;
import com.jinxin.employee.application.vo.login.LoginUserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

/**
 * Created by zhouxh on 2018/10/14.
 */
@Controller
public class LoginController {

    @Autowired
    private UserServiceContract userService;

    /** web登录 */
    @RequestMapping("index")
    public ModelAndView index(){
        return new ModelAndView("login/login", "loginUserVo", new LoginUserVo());
    }

//    @PermissionAnnotation
    @RequestMapping(value = "/login")
    public ModelAndView login(@Valid @ModelAttribute("loginUserVo")LoginUserVo loginUserVo, HttpSession session){

        boolean results = userService.banckendLogin(loginUserVo);

        //登录失败
        if(!results){
            return new ModelAndView("login/login", "loginUserVo", loginUserVo).addObject("message","用户名或密码错误");
        }

        //登录成功，返回到首页
        return new ModelAndView("home/home");

    }

    @RequestMapping(value = "/logout")
    public ModelAndView logout(@Valid @ModelAttribute("loginUserVo")LoginUserVo loginUserVo, HttpSession session){

        boolean results = userService.banckendLogin(loginUserVo);

        //登录失败
        if(!results){
            return new ModelAndView("login/login", "loginUserVo", loginUserVo).addObject("message","用户名或密码错误");
        }

        //登录成功，返回到首页
        return new ModelAndView("redirect:/home/list?roomType=3");

    }
}
