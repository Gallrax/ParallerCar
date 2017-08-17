package com.controller;

import com.entity.Merchant;
import com.service.MerchantService;
import com.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/3/9.
 */
@Controller
@RequestMapping("/merchant")
public class MerchantController {

    @Autowired
    private MerchantService merchantService;

    @RequestMapping("/login")
    public String login(Merchant m, HttpSession session) {
        Merchant merchant = merchantService.login(m.getUsername(), m.getPassword());
        if (merchant == null) return "login";
        session.setAttribute("user", null);
        session.setAttribute("merchant", merchant);
        return "merchantLogin";
    }

    @RequestMapping("/validateMerchant")
    public @ResponseBody String validateMerchant(String username) {
        boolean judge = merchantService.findByUsername(username);
        return judge + "";
    }

    @RequestMapping("/findForIndex")
    public @ResponseBody List<Merchant> findForIndex(Pager pager, HttpServletRequest request){
        List<Merchant> merchants = merchantService.searchAll(pager);
        request.setAttribute("pager", pager);
        return merchants;
    }

    @RequestMapping("/saveMerchant")
    public String saveMerchant(Merchant merchant) {
        merchantService.saveMerchant(merchant);
        return "index";
    }

    @RequestMapping("/updateMerchant")
    public String updateMerchant(Merchant merchant) {
        merchantService.updateMerchant(merchant);
        return "index";
    }

}