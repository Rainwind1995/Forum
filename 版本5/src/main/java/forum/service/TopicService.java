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
    //获取某个板块下的主题及用户信息 用于渲染板块页面
    List<Topic> listTopicsAndUsersOfTab(Integer tabId);
    //获取活跃主题
    List<Topic> listActiveTopics(Integer tabId);
    //获取部分精品帖子
    List<Topic> listEssenceTopics(Integer tabId);
    //获取最近主题
    List<Topic> listRecentTopics(Integer tabId);
    //获取全部活跃主题
    List<Topic> listAllActiveTopics();
    //获取全部精品帖子
    List<Topic> listAllEssenceTopics();
    //获取全部最近主题
    List<Topic> listAllRecentTopics();
    //删除主题
    int deleteByPrimaryKey(int topicId);

}
