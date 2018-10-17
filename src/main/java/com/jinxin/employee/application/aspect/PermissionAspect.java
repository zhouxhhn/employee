/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.aspect;



import com.jinxin.employee.application.constants.ResponseBackCode;
import com.jinxin.employee.application.exception.PermissionDenyException;
import com.jinxin.employee.application.pojo.User;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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
      HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
      HttpSession session = request.getSession();
      User user = (User)session.getAttribute("user");
      if(user==null) {//没有用户
         //response.sendRedirect("login/login");
      }

      return point.proceed(point.getArgs());
  }
}
