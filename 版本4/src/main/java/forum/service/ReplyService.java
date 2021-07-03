package forum.service;

import forum.entity.Reply;

import java.util.List;

public interface ReplyService {
    // 获取全部主题评论
    List<Reply> getRepliesOfTopic(Integer topidId);
    // 获取评论次数
    int repliesNum(Integer topicId);
    // 添加回复
    boolean addReply(Reply reply);
    //删除某个回复
    int deleteByPrimaryKey(Long id);



}
