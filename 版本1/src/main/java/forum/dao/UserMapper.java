package forum.dao;

import forum.entity.User;

import java.util.List;

public interface UserMapper {
    public List<User> getAll() throws Exception;
}
