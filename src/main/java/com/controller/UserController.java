package com.controller;

import com.entity.User;
import com.service.UserService;
import com.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/3/9.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpSession session) {
        User u = userService.login(user.getUsername(), user.getPassword());
        if (u == null) return "login";
        session.setAttribute("user", u);
        return "index";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.setAttribute("user", null);
        return "index";
    }

    @RequestMapping("/validateUser")
    public @ResponseBody String validate(String field, String value) {
        try {
            List<User> users = userService.search(field, value, null);
            if (!users.isEmpty() && users.size() > 0) return "false";
            return "true";
        } catch (Exception e) {
            return "true";
        }
    }

    @RequestMapping("/findPager")
    public @ResponseBody Pager findPager(@RequestParam(required = false) String[] fields, @RequestParam(required = false) String[] values) {
        Pager pager = new Pager();
        userService.searchAnd(fields, values, pager);
        return pager;
    }

    @RequestMapping("/findAndFields")
    public
    @ResponseBody
    List<User> findByFields(@RequestParam(required = false) String[] fields, @RequestParam(required = false) String[] values, Pager pager, HttpServletRequest request) {
        List<User> users = userService.searchAnd(fields, values, pager);
        return users;
    }

    @RequestMapping("/saveUser")
    public String save(User user, HttpSession session) {
        user.setInsertTime(new Date());
        userService.saveUser(user);
        User u = userService.findById(user.getId());
        session.setAttribute("user", u);
        return "index";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user, HttpSession session) {
        userService.updateUser(user);
        User u = userService.findById(user.getId());
        session.setAttribute("user", u);
        return "index";
    }

    @RequestMapping("/updateFields")
    public String updateFields(String[] fields, String[] values, HttpSession session) {
        for (int i = 0; i < fields.length; i++) {
            try {
                values[i] = URLDecoder.decode(values[i], "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        User user = (User) session.getAttribute("user");
        userService.updateFileds(fields, values, user.getId());
        User u = userService.findById(user.getId());
        session.setAttribute("user", u);
        return "userInfo";
    }

    @RequestMapping("/changePassword")
    public @ResponseBody String changePassword(String oldPassword, String newPassword, HttpSession session) {
        User user = (User) session.getAttribute("user");
        User u = userService.findById(user.getId());
        if (!u.getPassword().equals(oldPassword)) {
            return "false";
        } else {
            u.setPassword(newPassword);
            userService.updateUser(u);
            session.setAttribute("user", u);
            return "true";
        }
    }

}
