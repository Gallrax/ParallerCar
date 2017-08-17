package com.service.impl;

import com.dao.FindInfoDao;
import com.entity.FindInfo;
import com.service.FindInfoService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class FindInfoServiceImpl implements FindInfoService {

    @Resource
    private FindInfoDao findInfoDao;

    public List<FindInfo> findAll() {
        return findInfoDao.findAllFindInfo();
    }

    public FindInfo findById(Integer id) {
        return findInfoDao.findFindInfoById(id);
    }

    public void saveFindInfo(FindInfo findInfo) {
        findInfoDao.saveFindInfo(findInfo);
    }

    public void deleteFindInfo(Integer id) {
        findInfoDao.deleteFindInfo(id);
    }

    public void updateBFindInfo(FindInfo findInfo) {
        findInfoDao.updateFindInfo(findInfo);
    }

    public void index() {
        findInfoDao.index();
    }

    public List<FindInfo> search(String field, String value, Pager pager) {
        return findInfoDao.search(field, value, pager);
    }

    public List<FindInfo> searchFields(String[] fields, String value, Pager pager) {
        return findInfoDao.searchFields(fields, value, pager);
    }

    public List<FindInfo> searchAnd(String[] fields, String[] values, Pager pager) {
        return findInfoDao.searchAnd(fields, values, pager);
    }

    public List<FindInfo> searchOr(String[] fields, String[] values, Pager pager) {
        return findInfoDao.searchOr(fields, values, pager);
    }

    public List<FindInfo> searchAll(Pager pager) {
        return findInfoDao.searchAll(pager);
    }
}
