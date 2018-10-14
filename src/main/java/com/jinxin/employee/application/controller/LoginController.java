package com.jinxin.employee.application.controller;

import com.jinxin.employee.application.vo.login.LoginUserVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zhouxh on 2018/10/14.
 */
@Controller
public class LoginController {

    /** web登录 */
    @RequestMapping("index")
    public String index(){
        return "login/login";
    }

    @RequestMapping(value = "/login")
    public ModelAndView paginationAgent(LoginUserVo loginUserVo){
        String password = loginUserVo.getPassword();

        ModelAndView mv = new ModelAndView();
        mv.setViewName("welcome");
        mv.addObject("name","xx");
        return mv;

    }
}
