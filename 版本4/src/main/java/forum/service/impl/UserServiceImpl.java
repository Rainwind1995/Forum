package forum.service.impl;

import forum.dao.UserMapper;
import forum.entity.User;
import forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userDao;


    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user) > 0;
    }

    //username是否存在
    public boolean existUsername(String username) {
        return userDao.existUsername(username) == 1;
    }

    //登录验证 0:用户名不存在 1:密码错误 2:验证成功
    @Override
    public int login(String username, String password) {
        // 判断用户是否存在
        boolean isUser = existUsername(username);
        // 若存在则验证密码
        if(isUser){
            User user = userDao.selectByUsername(username);
            if(user.getPassword().equals(password)){
                return 2;
            }
            return 1;
        }
        return 0;
    }

    //登陆后获取用户信息
    public User getUserByUsername(String username){
        User resUser = userDao.selectByUsername(username);
        return resUser;
    }

    //增加积分
    public boolean addCredit(Integer points,Integer id) {
        return userDao.addCredit(points,id) > 0;
    }


    public int getUserCount() {
        return userDao.getUserCount();
    }



    public User getUserById(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }






}
