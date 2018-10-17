package com.jinxin.employee.application.request.user;

import lombok.Data;

/**
 * Created by zhouxh on 2018/10/15.
 */
@Data
public class AddUserRequest {

    //登录帐号
    private String code;

    //姓名
    private String name;

    //密码
    private String password;

    //身份证号码
    private String identityCard;

    //手机号码
    private String cellphone;

    //性别
    private Long sex;
}
