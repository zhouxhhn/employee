/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.exception;

public class PermissionDenyException extends  BaseException{

  public PermissionDenyException(int code, String feedback) {
    super(code, feedback);
  }
}
