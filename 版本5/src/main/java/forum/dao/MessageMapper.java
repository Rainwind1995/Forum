package forum.dao;

import forum.entity.Message;

import java.util.List;

public interface MessageMapper {
    List<Message> getAllMessage(Integer userId);
    int getAllMessageNumOfUser(Integer userId);
    int getUnreadMessageNumOfUser(Integer userId);
    int readReplyOfTopic(Integer topidId);
    int insert(Message message);

}
