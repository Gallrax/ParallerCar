package com.service.impl;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    public List<User> findAll() {
        return userDao.findAllUser();
    }

    public User findById(Integer id) {
        return userDao.findUserById(id);
    }

    public User login(String username, String password) {
        return userDao.login(username, password);
    }

    public boolean findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    public void deleteBUser(Integer id) {
        userDao.deleteUser(id);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public void updateFileds(String[] fields, String[] values, Integer id) {
        userDao.updateFileds(fields, values, id);
    }

    public void index() {
        userDao.index();
    }

    //@PostConstruct
    public void flush() {
        userDao.flush();
    }

    public List<User> search(String field, String value, Pager pager) {
        return userDao.search(field, value, pager);
    }

    public List<User> searchFields(String[] fields, String value, Pager pager) {
        return userDao.searchFields(fields, value, pager);
    }

    public List<User> searchAnd(String[] fields, String[] values, Pager pager) {
        return userDao.searchAnd(fields, values, pager);
    }

    public List<User> searchOr(String[] fields, String[] values, Pager pager) {
        return userDao.searchOr(fields, values, pager);
    }

    public List<User> searchAll(Pager pager) {
        return userDao.searchAll(pager);
    }
}
