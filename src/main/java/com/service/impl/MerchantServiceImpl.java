package com.service.impl;

import com.dao.MerchantDao;
import com.entity.Merchant;
import com.service.MerchantService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class MerchantServiceImpl implements MerchantService {

    @Resource
    private MerchantDao merchantDao;

    public List<Merchant> findAll() {
        return merchantDao.findAllMerchant();
    }

    public Merchant findById(Integer id) {
        return merchantDao.findMerchantById(id);
    }

    public Merchant login(String username, String password) {
        return merchantDao.login(username, password);
    }

    public boolean findByUsername(String username) {
        return merchantDao.findByUsername(username);
    }

    public void saveMerchant(Merchant merchant) {
        merchantDao.saveMerchant(merchant);
    }

    public void deleteMerchant(Integer id) {
        merchantDao.deleteMerchant(id);
    }

    public void updateMerchant(Merchant merchant) {
        merchantDao.updateMerchant(merchant);
    }

    public void index() {
        merchantDao.index();
    }

    public List<Merchant> search(String field, String value, Pager pager) {
        return merchantDao.search(field, value, pager);
    }

    public List<Merchant> searchFields(String[] fields, String value, Pager pager) {
        return merchantDao.searchFields(fields, value, pager);
    }

    public List<Merchant> searchAnd(String[] fields, String[] values, Pager pager) {
        return merchantDao.searchAnd(fields, values, pager);
    }

    public List<Merchant> searchOr(String[] fields, String[] values, Pager pager) {
        return merchantDao.searchOr(fields, values, pager);
    }

    public List<Merchant> searchAll(Pager pager) {
        return merchantDao.searchAll(pager);
    }
}
