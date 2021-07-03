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
    //查看是否帖子存在
    int existTopic(Integer topicId);
    //增加访问流量
    int clickAddOne(Integer id);
    //帖子详情
    Topic selectById(Integer id);
    // 新建主题
    int insert(Topic topic);
    // 更新帖子
    int updateByPrimaryKeySelective(Topic topic);
    //根据tab页查询topic
    List<Topic> listTopicsAndUsersOfTab(Integer tabId);
    //获取活跃主题
    List<Topic> listActiveTopics(Integer tabiId);
    //获取全部活跃主题
    List<Topic> listAllActiveTopics();
    //获取部分精品帖子
    List<Topic> listEssenceTopics(Integer tabId);
    //获取最近主题
    List<Topic> listRecentTopics(Integer tabId);
    //获取全部精品帖子
    List<Topic> listAllEssenceTopics();
    //获取全部最近主题
    List<Topic> listAllRecentTopics();
    //删除主题
    int deleteByPrimaryKey(int topicId);



}
