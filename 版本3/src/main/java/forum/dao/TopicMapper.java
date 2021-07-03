package forum.dao;

import forum.entity.Topic;

import java.util.List;

public interface TopicMapper {
    // 获取全部主题
    List<Topic> getAllTopics();
    //一个帖子完整的信息
    List<Topic> listTopicsAndUsers();
    //热门帖子
    List<Topic> listMostCommentsTopics();
    //获取主题总数
    int getTopicsNum();

}
