# BBS 论坛使用说明
## 技术要求
1. 本项目基于Spring、Spring MVC、MyBatis框架实现  
2. 数据库采用MySql 5.7.27  
3. 前端采用HTML、CSS、jQuery、Bootstrap
4. 采用Maven项目管理工具
## 功能实现
1. 发布主题、回复主题
2. 用户登陆与注册、用户信息界面展示、用户修改头像
3. 后台统计访客信息、统计用户登陆信息
4. 用户发帖、登陆、回帖行为的积分系统
5. 分页功能
6. 管理员账户能够实现设置主题为精品、删除主题、删除回复功能

## 相关软件安装指南
1. 安装navicat教程：https://www.jianshu.com/p/78db1eb7d71d（亲测有用）
2. 安装mysql教程：https://www.jianshu.com/p/ea4accd7afb4  
3. 安装Tomcat教程  
   3.1 参考文章：https://blog.51cto.com/u_14757829/2479540（看安装）  
   3.2 https://blog.csdn.net/u012964753/article/details/81045716（看配置环境变量）   
   3.3 startup.bat出现乱码的解决方案：https://blog.csdn.net/weixin_43244698/article/details/85304535  
4. 安装Maven: https://blog.csdn.net/qq_42150520/article/details/108739219




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
## 参考样例
1. 主要是基于Github上开源作品基础上进行二次开发:https://github.com/lhf2018/Lhfly-BBS
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
3. 在user_info.jsp界面添加上了side.jsp
4. 完成分页功能


## 注意事项
1. 实现上面上面的功能我们需要新建tab、topic、reply三个数据表

## 修复bug
1. 解决了user_info界面用户个人信息展示栏与side.jsp样式不一致
2. 解决了用户点击登录跳转到主界面无法显示热议主题以及全部帖子
3. 解决分页失效问题,原因是忘了在mybatis-config里面配置插件属性  
   3.1 具体可以参考这篇文章:https://blog.csdn.net/qq_40241957/article/details/99625180  
   3.2 在pom.xml 以及 mybatis-config里面配置两个插件即可  
4. 完善了运行项目直接跳转到主页面,无须在web.xml添加<welcome-file-list><welcome-file>/WEB-INF/jsp/cate.jsp</welcome-file></welcome-file-list>  
   4.1 解决办法在TopicController里面写了一个toMain()函数
   


# 版本四 (2021-7-2)
## 主要实现功能
1. 实现了点击相应的主题可以查看详细信息
2. 实现了统计今日访问量以及总访问量
3. 实现了评论功能
4. 实现了显示评论分页功能

## 注意事项
1. 对于显示今日访问量以及总访问量之前并没有将这两个小功能加上去,所以需要做下面几个步骤  
   1.1 在footer.jsp里面添加总访问量以及今日访问量    
   1.2 在TopicController、MainController以及UserController里把之前注释掉统计访问人数的去掉注释  
   1.3 这里我们还需要在forum数据库里面新建一个visitor数据表

## 修复bug
1. 对于实现统计今日访问量这个功能刚开始进入主页就直接插入三条访问数量,这显然是不正确的,这里我的错误记录在我的数据库:forum里面的visitor里的id为19-21的信息  
   1.1 对于这个错误涉及到计算机网络里面的一些知识,可以参考这篇文章:https://www.cnblogs.com/ITtangtang/p/3927768.html  
   1.2 我的解决办法TopicController里面的toMain()函数最下面写了解决思路
2. 对于评论分页功能出现的一些问题记录在我的博客中  
   2.1 参考链接:https://blog.csdn.net/wyf2017/article/details/118417422
   



# 版本五 (2021-7-3)
## 主要实现功能
1. 实现了header.jsp顶部栏中:技术、好玩、创意、工作以及交易的跳转
2. 实现了活跃/精华/最近 版面的跳转中转
3. 实现了查看未读消息以及阅读消息
4. 实现了用户上传头像
5. 完成了管理员设置文章类型为精品、取消文章精品以及删除主题

## 注意事项
1. 关于顶部栏中:技术、好玩、创意、工作以及交易各自的活跃/精华/最近 版面的跳转相关问题  
   1.1 这个功能的实现在TopicController中需要temp() 和 classify() 函数的结合,这里需要好好理解下
2. 关于查看未读消息需要注意的事项  
   2.1 查看未读消息我们需要在side.jsp里面修改下未读消息那个标签,添加个跳转的链接,具体细节在代码里面    
   2.2 实现未读消息需要新建message数据库表  
3. 关于用户上传文件需要注意的事项  
   3.1 在pom.xml里面配置依赖:文件上传  
   3.2 在springmvc.xml里面配置MultipartResolver处理器  
4. 关于上传头像的存储位置  
   4.1 文件上传后的存储位置在target/forums/static/img

   















   
