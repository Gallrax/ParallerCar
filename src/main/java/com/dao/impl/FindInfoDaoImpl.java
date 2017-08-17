package com.dao.impl;

import com.dao.FindInfoDao;
import com.entity.FindInfo;
import com.util.SearchUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class FindInfoDaoImpl extends BaseDao<FindInfo> implements FindInfoDao {

    public List<FindInfo> findAllFindInfo() {
        return super.findAll("from t_findinfo");
    }

    public FindInfo findFindInfoById(Integer id) {
        return super.findById(id);
    }

    public void saveFindInfo(FindInfo findInfo) {
        super.save(findInfo);
    }

    public void deleteFindInfo(Integer id) {
        super.delete(id);
    }

    public void updateFindInfo(FindInfo findInfo) {
        super.update(findInfo);
    }

    public void index() {
        super.index(findAllFindInfo());
    }

}
