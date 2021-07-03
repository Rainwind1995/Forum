package forum.controller;


import forum.entity.Reply;
import forum.entity.Topic;
import forum.entity.User;
import forum.service.ReplyService;
import forum.service.TopicService;
import forum.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;


@Controller
public class ReplyController {
    @Autowired
    UserService userService;
    @Autowired
    TopicService topicService;
    @Autowired
    ReplyService replyService;


    /**
     * 添加评论
     */
    @RequestMapping(value = "/reply/add", method = RequestMethod.POST)
    public ModelAndView addReply(HttpServletRequest request, HttpSession session) {
        Integer topicId = Integer.parseInt(request.getParameter("topicId"));
        Integer replyUserId = Integer.parseInt(request.getParameter("replyUserId"));
        User replyuser = userService.getUserById(replyUserId);
        String content = request.getParameter("content");

        //创建reply
        Reply reply = new Reply();
        reply.setTopicId(topicId);
        reply.setReplyUserId(replyUserId);
        reply.setContent(content);
        reply.setCreateTime(new Date());
        reply.setUpdateTime(new Date());
        reply.setUser(replyuser);

        //更新主题最后被回复的时间
        Topic topic = topicService.selectById(topicId);
        topic.setUpdateTime(new Date());
        topicService.updateByPrimaryKeySelective(topic);
        //添加
        replyService.addReply(reply);
        //添加积分
        userService.addCredit(1, replyUserId);
        //新建视图
        ModelAndView view = new ModelAndView("redirect:/t/" + topicId);
        view.addObject("reply", reply);
        return view;
    }


    /**
     * 删除评论
     */
    @RequestMapping("/reply/delete/{replyId}/{topicId}")
    @Transactional
    public String delete(@PathVariable("replyId") Long replyId, @PathVariable("topicId") Integer topicId) {
        replyService.deleteByPrimaryKey(replyId);
        return "redirect:/t/" + topicId;
    }


}
