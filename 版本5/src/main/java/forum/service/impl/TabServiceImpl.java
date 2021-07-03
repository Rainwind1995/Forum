package forum.service.impl;

import forum.dao.TabMapper;
import forum.entity.Tab;
import forum.service.TabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TabServiceImpl implements TabService {
    @Autowired
    TabMapper tabDao;

    @Override
    public List<Tab> getAllTabs() {
        return tabDao.getAllTabs();
    }

    @Override
    public Tab getByTabNameEn(String tabName) {
        return tabDao.getByTabNameEn(tabName);
    }
}
