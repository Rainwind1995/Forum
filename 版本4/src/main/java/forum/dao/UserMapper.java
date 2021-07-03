package forum.dao;

import forum.entity.User;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {
    // 用户注册
    int addUser(User user);
    //查询username是否存在
    int existUsername(String username);

    User selectByUsername(String username);

    //增加积分,多参数注解
    int addCredit(@Param("points") Integer points, @Param("id")Integer id);

    //查询用户数
    int getUserCount();

    User selectByPrimaryKey(Integer id);

}
