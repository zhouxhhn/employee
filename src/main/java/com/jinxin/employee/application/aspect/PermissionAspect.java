/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.aspect;



import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;


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
      String token = request.getHeader("token");

      return point.proceed(point.getArgs());
  }
}
