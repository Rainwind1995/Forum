package forum.service;

import forum.entity.Message;

import java.util.List;

public interface MessageService {
    // 获取全部消息
    List<Message> getAllMessage(Integer userId);
    // 获取用户个人全部消息
    int getAllMessageNumOfUser(Integer userId);
    // 获取未读消息
    int getUnreadMessageNumOfUser(Integer userId);
    // 读取未读消息
    int readReplyOfTopic(Integer topidId);
    // 将回复加入到message中
    int insert(Message message);
}
