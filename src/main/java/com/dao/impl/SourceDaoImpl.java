package com.dao.impl;

import com.dao.SourceDao;
import com.entity.Source;
import com.util.SearchUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class SourceDaoImpl extends BaseDao<Source> implements SourceDao {

    public List<Source> findAllSource() {
        return super.findAll("from t_source");
    }

    public Source findSourceById(Integer id) {
        return super.findById(id);
    }

    public void saveSource(Source source) {
        super.save(source);
    }

    public void deleteSource(Integer id) {
        super.delete(id);
    }

    public void updateSource(Source source) {
        super.update(source);
    }

    public void index() {
        super.index(findAllSource());
    }

}
