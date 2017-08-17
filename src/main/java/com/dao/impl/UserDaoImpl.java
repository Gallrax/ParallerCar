package com.dao.impl;

import com.dao.UserDao;
import com.entity.User;
import com.util.SearchUtil;
import org.apache.lucene.search.Query;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class UserDaoImpl extends BaseDao<User> implements UserDao {


    public List<User> findAllUser() {
        return super.findAll("from t_user");
    }

    public User findUserById(Integer id) {
        return super.findById(id);
    }

    public User login(String username, String password) {
        String sql = "select * from t_user where username = '"+ username +"' and password = '"+ password +"'";
        return super.login(username, password, sql);
    }

    @Override
    public boolean findByUsername(String username) {
        String sql = "select * from t_user where username = '"+ username +"'";
        return super.findByUsername(sql);
    }

    public void saveUser(User user) {
        super.save(user);
    }

    public void updateFileds(String[] fields, String[] values, Integer id) {
        super.updateFileds(fields, values, id);
    }

    public void deleteUser(Integer id) {
        super.delete(id);
    }

    public void updateUser(User user) {
        super.update(user);
    }

    public void index() {
        super.index(findAllUser());
    }

    /*public List<User> searchAll() {
        FullTextSession fts = Search.getFullTextSession(super.getSession());
        QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(User.class).get();
        Query query = qb.all().createQuery();
        FullTextQuery fullTextQuery = fts.createFullTextQuery(query, User.class);
        return fullTextQuery.list();
    }*/

}
