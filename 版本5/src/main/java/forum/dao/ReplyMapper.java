package forum.dao;

import forum.entity.Reply;

import java.util.List;

public interface ReplyMapper {
    List<Reply> getRepliesOfTopic(Integer id);
    int getRepliesNum(Integer id);
    int insert(Reply reply);
    int deleteByPrimaryKey(Long id);
    int deleteByTopicId(int id);

}
