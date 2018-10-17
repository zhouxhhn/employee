/*
 * (C) Copyright 2018 Siyue Holding Group.
 */
package com.jinxin.employee.application.exception;

public class RequestException extends  BaseException{

  public RequestException(int code, String feedback) {
    super(code, feedback);
  }
}
