package forum.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import eu.bitwalker.useragentutils.UserAgent;
import forum.entity.Reply;
import forum.entity.Topic;
import forum.entity.User;
import forum.entity.Visitor;
import forum.service.ReplyService;
import forum.service.TopicService;
import forum.service.UserService;
import forum.service.VisitorService;
import forum.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class TopicController {
    @Autowired
    UserService userService;
    @Autowired
    TopicService topicService;
    @Autowired
    ReplyService replyService;
    @Autowired
    VisitorService visitorService;


    /**
     * 首页
     */
    @RequestMapping("/")
    public ModelAndView toMain(HttpSession session, HttpServletRequest request, Page page) {
        ModelAndView modelAndView = new ModelAndView("cate");
        //获取第1页，10条内容，默认查询总数count
        PageHelper.offsetPage(page.getStart(), page.getCount());
        //首页全部主题
        List<Topic> topics = topicService.listTopicsAndUsers();

        //分页
        int total = (int) new PageInfo<Topic>(topics).getTotal();
        page.setTotal(total);
        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);
        //获取访问量
        Integer visitorNum = visitorService.countVisitor();
        //热门主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        modelAndView.addObject("topics", topics);
        modelAndView.addObject("hotestTopics", hotestTopics);
        modelAndView.addObject("topicsNum", topicsNum);
        modelAndView.addObject("usersNum", usersNum);
        modelAndView.addObject("user", user);
        modelAndView.addObject("visitorNum", visitorNum);
        modelAndView.addObject("page", page);
        modelAndView.addObject("todayVisitor", visitorService.todayVisitor());
//        modelAndView.addObject("unreadMessage", messageService.getUnreadMessageNumOfUser(uid));

        //获取登陆ip信息
        String ip = getRemortIP(request);
        //获取用户浏览器名
        UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        String userbrowser = userAgent.getBrowser().toString();
        // 写入登录属性
        Visitor visitor = new Visitor();
        visitor.setIP(ip);
        visitor.setDevice(userbrowser);
        visitor.setVisitTime(new Date());
        // 这里做一个判断,因为刚开始登录无法获取到浏览器名称,默认为UNKNOWN,而且IP地址也默认为:127.0.0.1,当不为UNKNOWN则插入登录信息到visitor
        if (userbrowser != "UNKNOWN") {
            visitorService.insert(visitor);
        }
        return modelAndView;
    }


    /**
     * 获取客户端IP
     */
    private String getRemortIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }


    /**
     * 加载主题详细页面
     */
    @RequestMapping("/t/{id}")
    public ModelAndView toTopic(@PathVariable("id") int id, HttpSession session, Page page) {
        //先检验这个帖子是否存在
        if (!topicService.existTopic(id)) {
            //不存在跳转到404界面
            return new ModelAndView("404");
        }
        //点击量+1
        boolean ifSuccess = topicService.clickAddOne(id);
        //获取主题信息
        Topic topic = topicService.selectById(id);

        //获取评论数
        int repliesNum = replyService.repliesNum(id);

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        //获取访问量
        Integer visitorNum = visitorService.countVisitor();


        //获取第1页，10条内容，默认查询总数count
        PageHelper.offsetPage(page.getStart(), page.getCount());
        //获取主题全部评论
        List<Reply> replies = replyService.getRepliesOfTopic(id);
        //分页
        int total = (int) new PageInfo<Reply>(replies).getTotal();
        page.setTotal(total);


        ModelAndView topicPage = new ModelAndView("detail");

        topicPage.addObject("topic", topic);
        topicPage.addObject("replies", replies);
        topicPage.addObject("repliesNum", repliesNum);
        topicPage.addObject("topicsNum", topicsNum);
        topicPage.addObject("usersNum", usersNum);
        topicPage.addObject("user", user);
        topicPage.addObject("hotestTopics", hotestTopics);
        topicPage.addObject("visitorNum", visitorNum);
        topicPage.addObject("todayVisitor", visitorService.todayVisitor());
        topicPage.addObject("page", page);
//        topicPage.addObject("unreadMessage", messageService.getUnreadMessageNumOfUser(uid));
        return topicPage;
    }


    /**
     * 发表主题
     */
    @RequestMapping(value = "/topic/add", method = RequestMethod.POST)
    public ModelAndView addTopic(HttpServletRequest request, HttpSession session) {
        ModelAndView mv;
        //未登录
        if (session.getAttribute("userId") == null) {
            mv = new ModelAndView("redirect:/signin");
            return mv;
        }
        //处理参数
        Integer userId = (Integer) session.getAttribute("userId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Byte tabId = Byte.parseByte(request.getParameter("tab"));
        //新建topic
        Topic topic = new Topic();
        topic.setUserId(userId);
        topic.setTitle(title);
        topic.setContent(content);
        topic.setTabId(tabId);
        topic.setCreateTime(new Date());
        topic.setUpdateTime(new Date());
        //添加topic
        topicService.addTopic(topic);
        // 发表一篇文章积分加1
        userService.addCredit(1, userId);
        mv = new ModelAndView("redirect:/");
        return mv;
    }


}




