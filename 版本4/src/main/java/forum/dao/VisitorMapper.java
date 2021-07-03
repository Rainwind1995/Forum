package forum.dao;

import forum.entity.Visitor;

public interface VisitorMapper {
    int countVisitor();
    int todayVisitor();
    int insert(Visitor visitor);
}
