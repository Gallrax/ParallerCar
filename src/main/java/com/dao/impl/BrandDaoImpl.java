package com.dao.impl;

import com.dao.BrandDao;
import com.entity.Brand;
import com.util.SearchUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/3.
 */
@Repository
public class BrandDaoImpl extends BaseDao<Brand> implements BrandDao {

    public List<Brand> findAllBrand() {
        return super.findAll("from t_brand");
    }

    public Brand findBrandById(Integer id) {
        return super.findById(id);
    }

    public void saveBrand(Brand brand) {
        super.save(brand);
    }

    public void deleteBrand(Integer id) {
        super.delete(id);
    }

    public void updateBrand(Brand brand) {
       super.update(brand);
    }

    public void index() {
        super.index(findAllBrand());
    }

}
