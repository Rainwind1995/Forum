package forum.service.impl;

import forum.dao.VisitorMapper;
import forum.entity.Visitor;
import forum.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VisitorServiceImpl implements VisitorService {
    @Autowired
    VisitorMapper visitorDao;


    @Override
    public int countVisitor() {
        return visitorDao.countVisitor();
    }

    @Override
    public int todayVisitor() {
        return visitorDao.todayVisitor();
    }

    @Override
    public boolean insert(Visitor visitor) {
        return visitorDao.insert(visitor) > 0;
    }
}
