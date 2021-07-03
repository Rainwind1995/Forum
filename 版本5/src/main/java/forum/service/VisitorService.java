package forum.service;

import forum.entity.Visitor;

public interface VisitorService {
    // 统计访问数
    int countVisitor();
    // 统计今日访问数
    int todayVisitor();
    // 添加访问用户
    boolean insert(Visitor visitor);
}
