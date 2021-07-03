package forum.service.impl;

import forum.dao.UserMapper;
import forum.entity.User;
import forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getAll() throws Exception {
        List<User> list = userMapper.getAll();
        return list;
    }
}
