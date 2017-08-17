package com.dao;

import com.entity.FindInfo;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface FindInfoDao {

    List<FindInfo> findAllFindInfo();

    FindInfo findFindInfoById(Integer id);

    void saveFindInfo(FindInfo findInfo);

    void deleteFindInfo(Integer id);

    void updateFindInfo(FindInfo findInfo);

    void index();

    List<FindInfo> search(String field, String value, Pager pager);

    List<FindInfo> searchFields(String[] fields, String value, Pager pager);

    List<FindInfo> searchAnd(String[] fields, String[] values, Pager pager);

    List<FindInfo> searchOr(String[] fields, String[] values, Pager pager);

    List<FindInfo> searchAll(Pager pager);
}
