<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <title>消息<c:if test="${!empty userInfo}">${userInfo.username}</c:if><c:if test="${!empty errorInfo}">会员未找到</c:if></title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 70%;margin:1% 2% 5% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/">通知</a> › 消息列表 <span style="font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;共有消息 ${messNum} 条，未读消息 ${unreadMessage} 条</span>
        </div>

        <div class="panel-body">
            <c:if test="${messNum!=0}">
                <ul class="list-group" style="width: 100%">
                    <c:forEach items="${messages}" var="message">
                        <c:if test="${! empty message}">
                        <li class="list-group-item">
                            <c:if test="${message.is_read==0}">
                                <span style="color: #c9302c">[ 未读 ]</span>
                                <span style="font-weight: bold">${message.sender.username}</span> 回复了你<br>
                                <span style="font-weight: bold">内容: </span>${message.context}<br>
                                <a href="/message/read/${message.topic_id}"><span style="font-weight: bold">查看主题: </span>${message.topic_name}</a>
                            </c:if>
                            <c:if test="${message.is_read==1}">
                                <span style="color: green">[ 已读 ]</span>
                                <span style="font-weight: bold">${message.sender.username}</span> 回复了你<br>
                                <span style="font-weight: bold">内容: </span>${message.context}<br>
                                <a href="/message/read/${message.topic_id}"><span style="font-weight: bold">查看主题: </span>${message.topic_name}</a>
                            </c:if>
                        </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test="${messNum==0}">
                没有未读消息
            </c:if>
        </div>
    </div>
    <div class="pageDiv" align="center" style="display:block;">
        <%@include file="../jsp/page.jsp" %>
    </div>
</div>
<div >
    <!-- 引入侧边栏文件 -->
    <%@ include file="side.jsp"%>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>