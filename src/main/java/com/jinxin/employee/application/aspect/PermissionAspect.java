/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.aspect;



import com.jinxin.employee.application.constants.ResponseBackCode;
import com.jinxin.employee.application.exception.PermissionDenyException;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.request.login.LoginUserRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 权限拦截器,验证token
 */
@Aspect
@Order(100)
@Component
public class PermissionAspect {


  @Pointcut("@annotation(com.jinxin.employee.application.annotation.PermissionAnnotation)")
  private void permission() {
  }

  @Around("permission()")
  public Object judgetPermission(ProceedingJoinPoint point) throws Throwable {
    // 获取session中的用户信息
    HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    User user = (User) request.getSession().getAttribute("user");

    if (user == null) {
      return new ModelAndView("forward:login", "loginUserVo", new LoginUserRequest());
    }
    return point.proceed();

  }
}
