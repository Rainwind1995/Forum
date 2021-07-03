package forum.controller;

import forum.entity.Tab;
import forum.service.TabService;
import forum.service.TopicService;
import forum.service.UserService;
import forum.service.VisitorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    UserService userService;
    @Autowired
    TabService tabService;
    @Autowired
    TopicService topicService;
    @Autowired
    VisitorService visitorService;


    /**
     * 进入登陆页面
     */
    @RequestMapping("/signin")
    public ModelAndView signin() {
        ModelAndView mv = new ModelAndView("signin");

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int userNum = userService.getUserCount();
        //获取访问量
        Integer visitorNum = visitorService.countVisitor();
        mv.addObject("topicsNum", topicsNum);
        mv.addObject("usersNum", userNum);
        mv.addObject("visitorNum", visitorNum);
        mv.addObject("todayVisitor", visitorService.todayVisitor());
        return mv;
    }


    /**
     * 进入注册界面
     */
    @RequestMapping("/signup")
    public ModelAndView signup() {
        ModelAndView mv = new ModelAndView("signup");

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //获取访问量
        Integer visitorNum = visitorService.countVisitor();
        mv.addObject("topicsNum", topicsNum);
        mv.addObject("usersNum", usersNum);
        mv.addObject("visitorNum", visitorNum);
        mv.addObject("todayVisitor", visitorService.todayVisitor());
        return mv;
    }


    /**
     * 进入新建主题界面
     */
    @RequestMapping("/new")
    public ModelAndView newTopic() {
        ModelAndView mv = new ModelAndView("new");
        List<Tab> tabs = tabService.getAllTabs();
        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        //获取访问量
        Integer visitorNum = visitorService.countVisitor();
        mv.addObject("tabs", tabs);
        mv.addObject("topicsNum", topicsNum);
        mv.addObject("usersNum", usersNum);
        mv.addObject("visitorNum", visitorNum);
        mv.addObject("todayVisitor", visitorService.todayVisitor());
        return mv;
    }


}
