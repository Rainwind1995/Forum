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
    //查看是否帖子存在
    boolean existTopic(Integer topicId);
    //点击量加一
    boolean clickAddOne(Integer id);
    //获取指定ID主题
    Topic selectById(Integer id);
    //新建主题
    boolean addTopic(Topic topic);
    //更新帖子
    int updateByPrimaryKeySelective(Topic topic);


}
