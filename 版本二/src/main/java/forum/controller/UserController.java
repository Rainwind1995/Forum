package forum.controller;

import forum.entity.User;
import forum.service.UserService;
import forum.util.ProduceMD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 用户注册
     */
    @RequestMapping("/user/add/do")
    public String addUser(HttpServletRequest request){
        //新建User对象
        User user=new User();
        //处理手机号
        String phoneNum=request.getParameter("tel");
        String areaCode=request.getParameter("areaCode");
        String phone=areaCode+phoneNum;
        //用户类型
        Byte type=new Byte("0");
        //密码加密处理
        String password= ProduceMD5.getMD5(request.getParameter("password"));
        //生成随机数，用于生成头像URL
        Random rand=new Random();
        int randomNum=rand.nextInt(10)+1;
        String avatarUrl="/img/avatar/avatar-default-" + randomNum + ".png";
        //初始化User对象
        user.setUsername(request.getParameter("username"));
        user.setPassword(password);
        user.setEmail(request.getParameter("email"));
        user.setPhoneNum(phone);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setCredit(0);
        user.setType(type);
        user.setAvatar(avatarUrl);

        boolean ifSucc = userService.addUser(user);
        System.out.print(ifSucc);
        return "redirect:/";
    }


    /**
     * 用户登陆 ajax从后台发送请求验证
     * @param request
     * @param session
     * @return 0:用户名不存在 1:密码错误 2:登录成功
     */
    @RequestMapping("/api/loginCheck")
    @ResponseBody
    public Object signin(HttpServletRequest request, HttpSession session){
        //处理参数
        String password = ProduceMD5.getMD5(request.getParameter("password"));
        String username = request.getParameter("username");
        //验证用户名密码
        int loginVerify = userService.login(username,password);
        HashMap<String,String> res = new HashMap<String, String>();
        //登陆成功
        if(loginVerify == 2){
            User user = userService.getUserByUsername(username);
            Integer userCredit = user.getCredit();

            Integer userId = user.getId();
            //添加积分
            boolean ifSuccAddCredit = userService.addCredit(1, userId);
            //用户信息写入session
            session.setAttribute("userId",userId);
            session.setAttribute("username", username);
            session.setAttribute("credit", userCredit);
            res.put("stateCode","2");
        }
        // 密码错误
        else if(loginVerify == 1){
            res.put("stateCode", "1");
        }else {
            res.put("stateCode", "0");
        }
        return res;
    }



    /**
     * 用户登出
     */
    @RequestMapping("/signout")
    public String signout(HttpSession session){
        session.removeAttribute("userId");
        session.removeAttribute("username");
        return "redirect:/";
    }



    /**
     * 进入主界面
     */
    @RequestMapping("/mainPage")
    public ModelAndView mainPage(){
        ModelAndView mv = new ModelAndView("cate");
        return  mv;
    }


}
