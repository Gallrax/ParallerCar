package com.service;

import com.entity.User;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface UserService {

    List<User> findAll();

    User findById(Integer id);

    User login(String username, String password);

    boolean findByUsername(String username);

    void saveUser(User user);

    void deleteBUser(Integer id);

    void updateUser(User user);

    void updateFileds(String[] fields, String[] values, Integer id);

    void index();

    void flush();

    List<User> search(String field, String value, Pager pager);

    List<User> searchFields(String[] fields, String value, Pager pager);

    List<User> searchAnd(String[] fields, String[] values, Pager pager);

    List<User> searchOr(String[] fields, String[] values, Pager pager);

    List<User> searchAll(Pager pager);
}
