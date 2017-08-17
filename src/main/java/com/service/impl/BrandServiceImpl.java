package com.service.impl;

import com.dao.BrandDao;
import com.entity.Brand;
import com.service.BrandService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class BrandServiceImpl implements BrandService {

    @Resource
    private BrandDao brandDao;

    public List<Brand> findAll() {
        return brandDao.findAllBrand();
    }

    public Brand findById(Integer id) {
        return brandDao.findBrandById(id);
    }

    public void saveBrand(Brand brand) {
        brandDao.saveBrand(brand);
    }

    public void deleteBrand(Integer id) {
        brandDao.deleteBrand(id);
    }

    public void updateBrand(Brand brand) {
        brandDao.updateBrand(brand);
    }

    public void index() {
        brandDao.index();
    }

    public List<Brand> search(String field, String value, Pager pager) {
        return brandDao.search(field, value, pager);
    }

    public List<Brand> searchFields(String[] fields, String value, Pager pager) {
        return brandDao.searchFields(fields, value, pager);
    }

    public List<Brand> searchAnd(String[] fields, String[] values, Pager pager) {
        return brandDao.searchAnd(fields, values, pager);
    }

    public List<Brand> searchOr(String[] fields, String[] values, Pager pager) {
        return brandDao.searchOr(fields, values, pager);
    }

    public List<Brand> searchAll(Pager pager) {
        return brandDao.searchAll(pager);
    }
}
