package forum.service.impl;

import forum.dao.TopicMapper;
import forum.entity.Topic;
import forum.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class TopicServiceImpl implements TopicService {
    @Autowired
    public TopicMapper topicDao;

    @Override
    public List<Topic> getAllTopics() {
        return topicDao.getAllTopics();
    }

    @Override
    public List<Topic> listTopicsAndUsers() {
        return topicDao.listTopicsAndUsers();
    }

    @Override
    public List<Topic> listMostCommentsTopics() {
        return topicDao.listMostCommentsTopics();
    }

    @Override
    public int getTopicsNum() {
        return topicDao.getTopicsNum();
    }


}
