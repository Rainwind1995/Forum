package forum.service;

import forum.entity.User;



public interface UserService {
    /**
     * 用户注册
     */
    boolean addUser(User user);
    /**
     * 登录验证
     */
    public int login(String username,String password);

    /**
     * 判断username是否存在
     */
    public boolean existUsername(String username);

    /**
     * 获取用户信息
     */
    public User getUserByUsername(String username);

    /**
     * 添加积分
     */
    public boolean addCredit(Integer points,Integer id);
}
