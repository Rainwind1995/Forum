package forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
    /**
     * 进入登陆页面
     */
    @RequestMapping("/signin")
    public ModelAndView signin(){
        ModelAndView mv = new ModelAndView("signin");

        //获取统计信息
//        int topicsNum=topicService.getTopicsNum();
//        int userNum=userService.getUserCount();
        //获取访问量
//        Integer visitorNum=visitorService.countVisitor();
//        mv.addObject("topicsNum", topicsNum);
//        mv.addObject("usersNum", userNum);
//        mv.addObject("visitorNum",visitorNum);
//        mv.addObject("todayVisitor", visitorService.todayVisitor());
        return mv;
    }



    /**
     * 进入注册界面
     */
    @RequestMapping("/signup")
    public ModelAndView signup(){
        ModelAndView mv = new ModelAndView("signup");

        //获取统计信息
//        int topicsNum=topicService.getTopicsNum();
//        int usersNum=userService.getUserCount();
        //获取访问量
//        Integer visitorNum=visitorService.countVisitor();
//        mv.addObject("topicsNum",topicsNum);
//        mv.addObject("usersNum",usersNum);
//        mv.addObject("visitorNum",visitorNum);
//        mv.addObject("todayVisitor", visitorService.todayVisitor());
        return  mv;
    }







}
