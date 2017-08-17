package com.service;

import com.entity.Brand;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface BrandService {

    List<Brand> findAll();

    Brand findById(Integer id);

    void saveBrand(Brand brand);

    void deleteBrand(Integer id);

    void updateBrand(Brand brand);

    void index();

    List<Brand> search(String field, String value, Pager pager);

    List<Brand> searchFields(String[] fields, String value, Pager pager);

    List<Brand> searchAnd(String[] fields, String[] values, Pager pager);

    List<Brand> searchOr(String[] fields, String[] values, Pager pager);

    List<Brand> searchAll(Pager pager);
}
