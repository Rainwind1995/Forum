package forum.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import forum.entity.Message;
import forum.entity.Topic;
import forum.entity.User;
import forum.service.MessageService;
import forum.service.TopicService;
import forum.service.UserService;
import forum.service.VisitorService;
import forum.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MessageController {
    @Autowired
    TopicService topicService;
    @Autowired
    UserService userService;
    @Autowired
    VisitorService visitorService;
    @Autowired
    MessageService messageService;

    /**
     * 查看未读消息
     * @param userId
     * @param session
     * @param page
     * @return
     */
    @RequestMapping("/message/{userId}")
    public ModelAndView getMessage(@PathVariable("userId") Integer userId, HttpSession session, Page page) {
        ModelAndView mv = new ModelAndView("message");
        //获取第1页，10条内容，默认查询总数count
        PageHelper.offsetPage(page.getStart(), page.getCount());
        List<Message> messages = messageService.getAllMessage(userId);
        //分页
        int total = (int) new PageInfo<Message>(messages).getTotal();
        page.setTotal(total);
        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();

        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);
        //获取访问量
        Integer visitorNum = visitorService.countVisitor();
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        //把user查出来赋值给message中的sender
        for (int i = 0; i < messages.size(); i++) {
            User sender = userService.getUserById(messages.get(i).getSender_id());
            messages.get(i).setSender(sender);
        }
        //把topic查出来赋值给message中的topic_name
        for (int i = 0; i < messages.size(); i++) {
            Topic topic = topicService.selectById(messages.get(i).getTopic_id());
            if (topic == null) {
                //如果帖子不存在，就显示删除
                messages.get(i).setTopic_name("该主题已被删除");
            } else {
                messages.get(i).setTopic_name(topic.getTitle());
            }
        }
        //消息数量
        int messNum = messageService.getAllMessageNumOfUser(userId);
        mv.addObject("hotestTopics", hotestTopics);
        mv.addObject("visitorNum", visitorNum);
        mv.addObject("todayVisitor", visitorService.todayVisitor());
        mv.addObject("unreadMessage", messageService.getUnreadMessageNumOfUser(uid));
        mv.addObject("messages", messages);
        mv.addObject("user", user);
        mv.addObject("page", page);
        mv.addObject("topicsNum", topicsNum);
        mv.addObject("usersNum", usersNum);
        mv.addObject("messNum", messNum);
        return mv;
    }

    /**
     * 点击完成未读消息
     *
     * @param topicId
     * @return
     */
    @RequestMapping("/message/read/{topicId}")
    public String readMessage(@PathVariable("topicId") Integer topicId) {
        messageService.readReplyOfTopic(topicId);
        return "redirect:/t/" + topicId;
    }



}
