package com.jinxin.employee.application.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.jinxin.employee.application.pojo.User;
import com.jinxin.employee.application.request.user.SearchUserRequest;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 文件表 Mapper 接口
 * </p>
 *
 * @author Sipin ERP Development Team
 */
public interface UserMapper extends BaseMapper<User> {

  List<User> getUserList(@Param("limit") Integer limit, @Param("offset") Integer offset, @Param("request") SearchUserRequest request);

}
