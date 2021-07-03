# 版本一 (2021-6-29)
## 主要的实现功能
1. 使用IDEA + Maven 完成了SSM框架的整合
2. 参考文章为:https://blog.csdn.net/u012430402/article/details/80385878
3. 这里需要自己新建一个数据库名为forum,里面新建一个表名为tb_user
4. 最后再浏览器里面输入:http://localhost:8080/getAll,能访问则表示整合成功。
## 注意事项
1. 关于springmvc.xml、applicationContext.xml、mybatis-config.xml的配置
2. 关于Maven里面的依赖配置
3. 关于IDEA配置Tomcat的一些细节


# 版本二  (2021-6-30)
1.https://github.com/lhf2018/Lhfly-BBS
## 主要实现功能
1. 完成登录、注册
2. 修复一些bug
## 注意事项
1. 跳转到登录界面静态资源失效的解决办法:在springmvc.xml里面配置静态资源映射,代码里面有注释
2. 解决SSM环境下的Java Web项目设置默认首页
2.1 问题描述: 使用IDEA + Maven搭建SSM项目会在webapp下默认生成一个index.jsp文件,每当我们启动项目的时候就会跳转到那里去,
   这与我们启动项目跳转到登录界面相违背,所以我们需要解决这个问题
2.2 解决方案:在WEB-INF下面的web.xml里面添加下面这段代码:
   <welcome-file-list>
   <welcome-file>/WEB-INF/jsp/cate.jsp</welcome-file>
   </welcome-file-list>
   


# 版本三 (2021-7-1)
## 主要实现功能
1. 完成查询个人信息,并解决了个人信息与side.jsp上积分不同步的bug
2. 完善了友情链接
3. 创建了板块数据表(tab)
4. 在user_info.jsp界面添加上了side.jsp
5. 完成分页功能

## 修复bug
1. 解决了user_info界面用户个人信息展示栏与side.jsp样式不一致
2. 解决了用户点击登录跳转到主界面无法显示热议主题以及全部帖子
3. 解决分页失效问题,原因是忘了在mybatis-config里面配置插件属性
   3.1 具体可以参考这篇文章:https://blog.csdn.net/qq_40241957/article/details/99625180
   3.2 在pom.xml 以及 mybatis-config里面配置两个插件即可