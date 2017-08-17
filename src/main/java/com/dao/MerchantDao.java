package com.dao;

import com.entity.Merchant;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface MerchantDao {

    List<Merchant> findAllMerchant();

    Merchant findMerchantById(Integer id);

    Merchant login(String username, String password);

    boolean findByUsername(String username);

    void saveMerchant(Merchant merchant);

    void deleteMerchant(Integer id);

    void updateMerchant(Merchant merchant);

    void index();

    List<Merchant> search(String field, String value, Pager pager);

    List<Merchant> searchFields(String[] fields, String value, Pager pager);

    List<Merchant> searchAnd(String[] fields, String[] values, Pager pager);

    List<Merchant> searchOr(String[] fields, String[] values, Pager pager);

    List<Merchant> searchAll(Pager pager);
}
