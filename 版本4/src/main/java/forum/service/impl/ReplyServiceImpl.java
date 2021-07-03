package forum.service.impl;

import forum.dao.ReplyMapper;
import forum.entity.Reply;
import forum.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {
    @Autowired
    public ReplyMapper replyDao;

    @Override
    public List<Reply> getRepliesOfTopic(Integer topidId) {
        return replyDao.getRepliesOfTopic(topidId);
    }

    @Override
    public int repliesNum(Integer topicId) {
        return replyDao.getRepliesNum(topicId);
    }

    @Override
    public boolean addReply(Reply reply) {
        return replyDao.insert(reply) > 0;
    }

    @Override
    public int deleteByPrimaryKey(Long id) {
        return replyDao.deleteByPrimaryKey(id);
    }

}
