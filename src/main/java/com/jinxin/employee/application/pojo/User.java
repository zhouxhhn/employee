package com.jinxin.employee.application.pojo;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import java.io.Serializable;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.experimental.Accessors;

/**用户表*/
@Data
@Accessors(chain = true)
@TableName("e_user")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 名字
     */
    @TableField("name")
    private String name;

    /**
     * 密码
     */
    @TableField("password")
    private String password;

    /**
     *身份证号码
     */
    @TableField("identity_card")
    private Long identityCard;
    /**
     * 手机号码
     */
    @TableField("cellphone")
    private String cellphone;

    /**
     * 性别
     */
    @TableField("sex")
    private Long sex;

    /**
     * 类型
     */
    @TableField("type")
    private Long type;

    /**
     * 图像url
     */
    @TableField("image_url")
    private String imageUrl;

    /**
     * 创建时间
     */
    @TableField("create_at")
    private LocalDateTime createAt;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
