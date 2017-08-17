package com.service;

import com.entity.Source;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface SourceService {

    List<Source> findAll();

    Source findById(Integer id);

    void saveSource(Source source);

    void deleteSource(Integer id);

    void updateSource(Source source);

    void index();

    List<Source> search(String field, String value, Pager pager);

    List<Source> searchFields(String[] fields, String value, Pager pager);

    List<Source> searchAnd(String[] fields, String[] values, Pager pager);

    List<Source> searchOr(String[] fields, String[] values, Pager pager);

    List<Source> searchAll(Pager pager);
}
