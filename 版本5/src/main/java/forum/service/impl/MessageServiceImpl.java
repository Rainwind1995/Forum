package forum.service.impl;

import forum.dao.MessageMapper;
import forum.entity.Message;
import forum.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageMapper messageDao;

    @Override
    public List<Message> getAllMessage(Integer userId) {
        return messageDao.getAllMessage(userId);
    }

    @Override
    public int getAllMessageNumOfUser(Integer userId) {
        return messageDao.getAllMessageNumOfUser(userId);
    }

    @Override
    public int getUnreadMessageNumOfUser(Integer userId) {
        return messageDao.getUnreadMessageNumOfUser(userId);
    }

    @Override
    public int readReplyOfTopic(Integer topidId) {
        return messageDao.readReplyOfTopic(topidId);
    }

    @Override
    public int insert(Message message) {
        return messageDao.insert(message);
    }
}
