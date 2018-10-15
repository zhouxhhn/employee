package com.jinxin.employee.application.request.login;

import lombok.Data;

/**
 * Created by zhouxh on 2018/10/14.
 */
@Data
public class LoginUserRequest {

    private String code;

    private String password;
}
