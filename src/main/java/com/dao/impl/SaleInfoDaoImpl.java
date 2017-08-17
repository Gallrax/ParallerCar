package com.dao.impl;

import com.dao.SaleInfoDao;
import com.entity.SaleInfo;
import com.util.SearchUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class SaleInfoDaoImpl extends BaseDao<SaleInfo> implements SaleInfoDao {


    public List<SaleInfo> findAllSaleInfo() {
        return super.findAll("from t_saleinfo");
    }

    public SaleInfo findSaleInfoById(Integer id) {
        return super.findById(id);
    }

    public void saveSaleInfo(SaleInfo saleInfo) {
        super.save(saleInfo);
    }

    public void deleteSaleInfo(Integer id) {
        super.delete(id);
    }

    public void updateSaleInfo(SaleInfo saleInfo) {
        super.update(saleInfo);
    }

    public void index() {
        super.index(findAllSaleInfo());
    }

}
