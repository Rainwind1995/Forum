package forum.dao;

import forum.entity.Tab;

import java.util.List;

public interface TabMapper {
    List<Tab> getAllTabs();//获取全部版面
    Tab getByTabNameEn(String tabName);//根据名字选择版面
}
