package com.service.impl;

import com.dao.SaleInfoDao;
import com.entity.SaleInfo;
import com.service.SaleInfoService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class SaleInfoServiceImpl implements SaleInfoService {

    @Resource
    private SaleInfoDao saleInfoDao;

    public List<SaleInfo> findAll() {
        return saleInfoDao.findAllSaleInfo();
    }

    public SaleInfo findById(Integer id) {
        return saleInfoDao.findSaleInfoById(id);
    }

    public void saveSaleInfo(SaleInfo saleInfo) {
        saleInfoDao.saveSaleInfo(saleInfo);
    }

    public void deleteSaleInfo(Integer id) {
        saleInfoDao.deleteSaleInfo(id);
    }

    public void updateSaleInfo(SaleInfo saleInfo) {
        saleInfoDao.updateSaleInfo(saleInfo);
    }

    public void index() {
        saleInfoDao.index();
    }

    public List<SaleInfo> search(String field, String value, Pager pager) {
        return saleInfoDao.search(field, value, pager);
    }

    public List<SaleInfo> searchFields(String[] fields, String value, Pager pager) {
        return saleInfoDao.searchFields(fields, value, pager);
    }

    public List<SaleInfo> searchAnd(String[] fields, String[] values, Pager pager) {
        return saleInfoDao.searchAnd(fields, values, pager);
    }

    public List<SaleInfo> searchOr(String[] fields, String[] values, Pager pager) {
        return saleInfoDao.searchOr(fields, values, pager);
    }

    public List<SaleInfo> searchAll(Pager pager) {
        return saleInfoDao.searchAll(pager);
    }
}
