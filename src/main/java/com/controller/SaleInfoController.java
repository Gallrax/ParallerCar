package com.controller;

import com.entity.SaleInfo;
import com.entity.User;
import com.service.SaleInfoService;
import com.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
@RequestMapping("/saleInfo")
@Controller
public class SaleInfoController {

    @Autowired
    private SaleInfoService saleInfoService;

    @RequestMapping("/findAll")
    public @ResponseBody List<SaleInfo> findAll(Pager pager) {
        List<SaleInfo> saleInfos = saleInfoService.searchAll(pager);
        return saleInfos;
    }

    @RequestMapping("/findPager")
    public @ResponseBody Pager findPager(@RequestParam(required = false) String[] fields, @RequestParam(required = false) String[] values) {
        Pager pager = new Pager();
        if(fields == null || fields.length <= 0) {
            saleInfoService.searchAll(pager);
        }else{
            for (int i = 0; i < fields.length; i++) {
                if(fields[i].equals("user.city")){
                    try {
                        values[i] = URLDecoder.decode(values[i], "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                }
            }
            saleInfoService.searchAnd(fields, values, pager);
        }
        return pager;
    }

    @RequestMapping("/findSearchPager")
    public @ResponseBody Pager findSearchPager(String value) {
        Pager pager = new Pager();
        try {
            value = URLDecoder.decode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        saleInfoService.searchFields(new String[]{"title", "content", "user.name", "car.name", "car.brand.name", "source.name"}, value, pager);
        return pager;
    }

    @RequestMapping("/findAndFields")
    public @ResponseBody List<SaleInfo> findForIndex(@RequestParam(required = false) String[] fields, @RequestParam(required = false) String[] values, Pager pager, HttpServletRequest request , HttpServletResponse response){
        if(fields == null || fields.length <= 0) return saleInfoService.searchAll(pager);
        for (int i = 0; i < fields.length; i++) {
            if(fields[i].equals("user.city")){
                try {
                    values[i] = URLDecoder.decode(values[i], "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }
        List<SaleInfo> saleInfos = saleInfoService.searchAnd(fields, values, pager);
        return saleInfos;
    }

    //关键字查询配置
    @RequestMapping("/searchByValue")
    public @ResponseBody List<SaleInfo> searchByFields(String value, Pager pager) {
        try {
            value = URLDecoder.decode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<SaleInfo> saleInfos = saleInfoService.searchFields(new String[]{"title", "content", "user.name", "car.name", "car.brand.name", "source.name"}, value, pager);
        return saleInfos;
    }

    @RequestMapping("/saleInfoDetail")
    public String findInfoDetail(Integer id, HttpServletRequest request) {
        SaleInfo saleInfo = saleInfoService.search("siid", id.toString(), null).get(0);
        request.setAttribute("saleInfo", saleInfo);
        return "saleInfoDetail";
    }

    @RequestMapping("/writeSaleInfo")
    public String writeSaleInfo(Integer id,HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) return "login";
        if (id != null && id != 0) {
            SaleInfo saleInfo = saleInfoService.search("siid", id.toString(), null).get(0);
            request.setAttribute("saleInfo", saleInfo);
        }
        return "writeSaleInfo";
    }

    @RequestMapping("/saveSaleInfo")
    public String saveSaleInfo(SaleInfo saleInfo, HttpSession session) {
        User user = (User) session.getAttribute("user");
        saleInfo.setUser(user);
        saleInfo.setInsertTime(new Date());
        saleInfoService.saveSaleInfo(saleInfo);
        return "userSaleInfo";
    }

    @RequestMapping("/updateSaleInfo")
    public String updateSaleInfo(SaleInfo saleInfo) {
        saleInfoService.updateSaleInfo(saleInfo);
        return "userSaleInfo";
    }

    @RequestMapping("deleteSaleInfo")
    public String deleteSaleInfo(Integer id) {
        saleInfoService.deleteSaleInfo(id);
        return "userSaleInfo";
    }

}