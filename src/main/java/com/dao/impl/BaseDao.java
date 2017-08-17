package com.dao.impl;

import com.util.Pager;
import com.util.SearchUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
@Component
public class BaseDao<T> {

    @Resource
    SessionFactory factory;

    Session getSession() {
        return factory.getCurrentSession();
    }

    /**
     * 获取泛型对象class
     *
     * @return
     */
    @SuppressWarnings("unchecked")
    public Class<T> getEntityClass() {
        return (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    public List<T> findAll(String query) {
        return getSession().createQuery(query).list();
    }

    public T findById(Integer id) {
        return getSession().get(getEntityClass(), id);
    }

    public T login(String username, String password, String sql) {
        List<T> list = getSession().createSQLQuery(sql).addEntity(getEntityClass()).list();
        System.out.println(list.isEmpty());
        if(list != null && !list.isEmpty()) return list.get(0);
        return null;
    }

    public boolean findByUsername(String sql) {
        List<T> list = getSession().createSQLQuery(sql).addEntity(getEntityClass()).list();
        if(list == null || list.isEmpty()) return true;
        return false;
    }

    public void save(T t) {
        getSession().save(t);
    }

    public void delete(Integer id) {
        getSession().delete(getSession().load(getEntityClass(), id));
    }

    public void update(T t) {
        getSession().update(t);
    }

    public void updateFileds(String[] fields, String[] values, Integer id) {
        String t = getEntityClass().toString().split(" ")[1];
        StringBuilder sb = new StringBuilder("update "+ t +" t set t.");
        if(fields.length > 1) {
            sb.append(fields[0] +" = '"+ values[0] +"'");
            for (int i = 1; i < fields.length; i++) {
                sb.append(", and t."+ fields[i] +" = '"+ values[i] +"'");
            }
        }else {
            sb.append(fields[0] +" = '"+ values[0] +"'");
        }
        sb.append(" where t.id = "+ id);
        Query query = getSession().createQuery(sb.toString());
        int i = query.executeUpdate();
    }

    public void index(List<T> list) {
        SearchUtil.index(getSession(), list);
    }

    public void flush() {
        SearchUtil.flush(getSession());
    }

    public List<T> search(String field, String value, Pager pager) {
        return SearchUtil.search(field, value, getSession(), getEntityClass(), pager);
    }

    public List<T> searchFields(String[] fields, String value, Pager pager) {
        return SearchUtil.searchFields(fields, value, getSession(), getEntityClass(), pager);
    }

    public List<T> searchAnd(String[] fields, String[] values, Pager pager) {
        return SearchUtil.searchAnd(fields, values, getSession(), getEntityClass(), pager);
    }

    public List<T> searchOr(String[] fields, String[] values, Pager pager) {
        return SearchUtil.searchOr(fields, values, getSession(), getEntityClass(), pager);
    }

    public List<T> searchAll(Pager pager) {
        return SearchUtil.searchAll(getSession(), getEntityClass(), pager);
    }

}
