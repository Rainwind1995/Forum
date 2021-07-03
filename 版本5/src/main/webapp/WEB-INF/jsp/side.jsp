<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<c:if test="${empty userId}">
    <!-- 未登录 -->
    <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
        <div class="panel-heading" style="background-color: white;text-align: center">
            <blockquote>
                Genesis
                <small>一个分享创造的开发者社区</small>
            </blockquote>
        </div>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                <a  href="/signin" class="btn btn-primary btn-block">登录</a>
                <a  href="/signup" class="btn btn-default btn-block">注册</a>
            </li>
        </ul>
    </div>
</c:if>

<c:if test="${!empty userId}">
    <!-- 已登录 -->
    <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
        <div class="panel-heading" style="background-color: white;text-align: center">
            <a href="/member/${sessionScope.username}">${sessionScope.username}</a>
        </div>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item"><a href="/new">创作新主题</a></li>
            <li class="list-group-item"><a href="/message/${userId}">${unreadMessage}条未读消息</a></li>
            <li class="list-group-item"><a href="">积分:${user.credit}</a></li>
        </ul>
    </div>
</c:if>

<div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        热议主题
    </div>
    <ul class="list-group" style="width: 100%">
        <c:forEach items="${hotestTopics}" var="hotestTopic">
            <li class="list-group-item"><a href="/t/${hotestTopic.id}">${hotestTopic.title}</a></li>
        </c:forEach>
    </ul>
</div>


