package forum.service;

import forum.entity.Topic;

import java.util.List;

public interface TopicService {
    // 获取全部主题
    List<Topic> getAllTopics();
    //获取全部主题及用户信息 用于首页
    List<Topic> listTopicsAndUsers();
    //获取最多评论主题列表
    List<Topic> listMostCommentsTopics();
    //获取主题总数
    int getTopicsNum();


}
