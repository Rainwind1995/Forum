package forum.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import forum.entity.Topic;
import forum.entity.User;
import forum.service.TopicService;
import forum.service.UserService;
import forum.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TopicController {
    @Autowired
    UserService userService;
    @Autowired
    TopicService topicService;


    /**
     * 首页
     */
    @RequestMapping("/")
    public ModelAndView toMain(HttpSession session, Page page) {
        ModelAndView modelAndView = new ModelAndView("cate");
        System.out.println("------------------------");
        System.out.println(page.getCount());
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
//        Integer visitorNum = visitorService.countVisitor();
        //热门主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        modelAndView.addObject("topics", topics);
        modelAndView.addObject("hotestTopics", hotestTopics);
        modelAndView.addObject("topicsNum", topicsNum);
        modelAndView.addObject("usersNum", usersNum);
        modelAndView.addObject("user", user);
//        modelAndView.addObject("visitorNum", visitorNum);
        modelAndView.addObject("page", page);
//        modelAndView.addObject("todayVisitor", visitorService.todayVisitor());
//        modelAndView.addObject("unreadMessage", messageService.getUnreadMessageNumOfUser(uid));
        return modelAndView;
    }


}
