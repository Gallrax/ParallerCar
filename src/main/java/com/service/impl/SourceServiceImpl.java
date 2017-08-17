package com.service.impl;

import com.dao.SourceDao;
import com.entity.Source;
import com.service.SourceService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class SourceServiceImpl implements SourceService {

    @Resource
    private SourceDao sourceDao;

    public List<Source> findAll() {
        return sourceDao.findAllSource();
    }

    public Source findById(Integer id) {
        return sourceDao.findSourceById(id);
    }

    public void saveSource(Source source) {
        sourceDao.saveSource(source);
    }

    public void deleteSource(Integer id) {
        sourceDao.deleteSource(id);
    }

    public void updateSource(Source source) {
        sourceDao.updateSource(source);
    }

    public void index() {
        sourceDao.index();
    }

    public List<Source> search(String field, String value, Pager pager) {
        return sourceDao.search(field, value, pager);
    }

    public List<Source> searchFields(String[] fields, String value, Pager pager) {
        return sourceDao.searchFields(fields, value, pager);
    }

    public List<Source> searchAnd(String[] fields, String[] values, Pager pager) {
        return sourceDao.searchAnd(fields, values, pager);
    }

    public List<Source> searchOr(String[] fields, String[] values, Pager pager) {
        return sourceDao.searchOr(fields, values, pager);
    }

    public List<Source> searchAll(Pager pager) {
        return sourceDao.searchAll(pager);
    }
}
