package forum.service;

import forum.entity.User;

import java.util.List;

public interface UserService {
    public List<User> getAll() throws Exception;
}
