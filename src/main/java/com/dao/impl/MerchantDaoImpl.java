package com.dao.impl;

import com.dao.MerchantDao;
import com.entity.Merchant;
import com.util.SearchUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class MerchantDaoImpl extends BaseDao<Merchant> implements MerchantDao {

    public List<Merchant> findAllMerchant() {
        return super.findAll("from t_merchant");
    }

    public Merchant findMerchantById(Integer id) {
        return super.findById(id);
    }

    public Merchant login(String username, String password) {
        String sql = "select * from t_merchant where username = '"+ username +"' and password = '"+ password +"'";
        return super.login(username, password, sql);
    }

    public boolean findByUsername(String username) {
        return super.findByUsername("select * from t_merchant where username = '"+ username +"'");
    }

    public void saveMerchant(Merchant merchant) {
        super.save(merchant);
    }

    public void deleteMerchant(Integer id) {
        super.delete(id);
    }

    public void updateMerchant(Merchant merchant) {
        super.update(merchant);
    }

    public void index() {
        super.index(findAllMerchant());
    }

}
