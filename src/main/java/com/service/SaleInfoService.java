package com.service;

import com.entity.SaleInfo;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface SaleInfoService {

    List<SaleInfo> findAll();

    SaleInfo findById(Integer id);

    void saveSaleInfo(SaleInfo saleInfo);

    void deleteSaleInfo(Integer id);

    void updateSaleInfo(SaleInfo saleInfo);

    void index();

    List<SaleInfo> search(String field, String value, Pager pager);

    List<SaleInfo> searchFields(String[] fields, String value, Pager pager);

    List<SaleInfo> searchAnd(String[] fields, String[] values, Pager pager);

    List<SaleInfo> searchOr(String[] fields, String[] values, Pager pager);

    List<SaleInfo> searchAll(Pager pager);
}
