package com.util;

import com.entity.FindInfo;
import com.entity.SaleInfo;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.hibernate.Session;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.BooleanJunction;
import org.hibernate.search.query.dsl.QueryBuilder;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public class SearchUtil {

    public static<T> void index(Session session, List<T> list) {
        FullTextSession fts = Search.getFullTextSession(session);
        for (T t : list) {
            fts.index(t);
        }
    }

    public static void flush(Session session){
        FullTextSession fts = Search.getFullTextSession(session);
        try {
            fts.createIndexer().startAndWait();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static<T> List<T> search(String field, String value, Session session, Class<T> clazz, Pager pager) {
        FullTextSession fts = Search.getFullTextSession(session);
        QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(clazz).get();
        Object o = JudgeUtil.returnVale(value);
        Query luceneQuery = qb.keyword().onField(field).matching(o).createQuery();
        FullTextQuery ftq = fts.createFullTextQuery(luceneQuery, clazz);
        if(clazz.equals(FindInfo.class) || clazz.equals(SaleInfo.class)){
            Sort sort = qb.sort().byField("insertTime").desc().createSort();
            ftq.setSort(sort);
        }
        if (pager != null) {
            pager.setTotalCount(ftq.getResultSize());
            ftq.setFirstResult(pager.getFirstResult());
            ftq.setMaxResults(pager.getPageLimit());
        }
        return ftq.list();
    }

    public static<T> List<T> searchFields(String[] fields, String value, Session session, Class clazz, Pager pager) {
        FullTextSession fts = Search.getFullTextSession(session);
        QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(clazz).get();
        Object o = JudgeUtil.returnVale(value);//进行Integer、Double判断
        Query query = qb.keyword().onFields(fields).matching(o).createQuery();
        FullTextQuery ftq = fts.createFullTextQuery(query, clazz);
        if(clazz.equals(FindInfo.class) || clazz.equals(SaleInfo.class)){
            Sort sort = qb.sort().byField("insertTime").desc().createSort();
            ftq.setSort(sort);
        }
        if (pager != null) {
            pager.setTotalCount(ftq.getResultSize());
            ftq.setFirstResult(pager.getFirstResult());
            ftq.setMaxResults(pager.getPageLimit());
        }
        return ftq.list();
    }

    public static<T> List<T> searchAnd(String[] fields, String[] values, Session session, Class<T> clazz, Pager pager) {
        FullTextSession fts = Search.getFullTextSession(session);
        QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(clazz).get();
        BooleanJunction<BooleanJunction> bool = qb.bool();
        for (int i = 0; i < fields.length; i++) {
            Object o = JudgeUtil.returnVale(values[i]);//进行Integer、Double判断
            bool.must(qb.keyword().onField(fields[i]).matching(o).createQuery());
        }
        Query query = bool.createQuery();
        FullTextQuery ftq = fts.createFullTextQuery(query, clazz);
        if(clazz.equals(FindInfo.class) || clazz.equals(SaleInfo.class)){
            Sort sort = qb.sort().byField("insertTime").desc().createSort();
            ftq.setSort(sort);
        }
        if (pager != null) {
            pager.setTotalCount(ftq.getResultSize());
            ftq.setFirstResult(pager.getFirstResult());
            ftq.setMaxResults(pager.getPageLimit());
        }
        return ftq.list();
    }

    public static<T> List<T> searchOr(String[] fields, String[] values, Session session, Class<T> clazz, Pager pager) {
        FullTextSession fts = Search.getFullTextSession(session);
        QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(clazz).get();
        BooleanJunction<BooleanJunction> bool = qb.bool();
        for (int i = 0; i < fields.length; i++) {
            Object o = JudgeUtil.returnVale(values[i]);//进行Integer、Double判断
            bool.should(qb.keyword().onField(fields[i]).matching(o).createQuery());
        }
        Query query = bool.createQuery();
        FullTextQuery ftq = fts.createFullTextQuery(query, clazz);
        if(clazz.equals(FindInfo.class) || clazz.equals(SaleInfo.class)){
            Sort sort = qb.sort().byField("insertTime").desc().createSort();
            ftq.setSort(sort);
        }
        if (pager != null) {
            pager.setTotalCount(ftq.getResultSize());
            ftq.setFirstResult(pager.getFirstResult());
            ftq.setMaxResults(pager.getPageLimit());
        }
        return ftq.list();
    }

    public static<T> List<T> searchAll(Session session, Class<T> clazz, Pager pager) {
        FullTextSession fts = Search.getFullTextSession(session);
        QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(clazz).get();
        Query query = qb.all().createQuery();
        FullTextQuery ftq = fts.createFullTextQuery(query, clazz);
        if(clazz.equals(FindInfo.class) || clazz.equals(SaleInfo.class)){
            Sort sort = qb.sort().byField("insertTime").desc().createSort();
            ftq.setSort(sort);
        }
        if (pager != null) {
            pager.setTotalCount(ftq.getResultSize());
            ftq.setFirstResult(pager.getFirstResult());
            ftq.setMaxResults(pager.getPageLimit());
        }
        return ftq.list();
    }
}
