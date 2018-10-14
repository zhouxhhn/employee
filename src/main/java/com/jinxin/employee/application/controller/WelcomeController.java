package com.jinxin.employee.application.controller;

import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.service.UserServiceContract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/welcome")
public class WelcomeController {

    @Autowired
    private UserServiceContract userServiceContract;


    /**
     * 访问welcome.jsp页面
     * @return
     */
    @RequestMapping("welcomeIndex")
    public ModelAndView welcomeIndex(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("welcome");
        mv.addObject("name","xx");
        return mv;
    }

    @RequestMapping("hello")
    public String hello(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("name","mr xx");
        return "welcome";
    }

    @RequestMapping("save")
    public String save(){
        ModelAndView mv = new ModelAndView();
        boolean re = userServiceContract.save(new User());
        mv.addObject("name",re);
       return "welcome";
    }



}
