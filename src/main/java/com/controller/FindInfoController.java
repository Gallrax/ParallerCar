package com.controller;

import com.entity.FindInfo;
import com.entity.User;
import com.service.FindInfoService;
import com.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
@RequestMapping("/findInfo")
@Controller
public class FindInfoController {

    @Autowired
    private FindInfoService findInfoService;

    @RequestMapping("/findPager")
    public @ResponseBody Pager findPager(@RequestParam(required = false) String[] fields, @RequestParam(required = false) String[] values) {
        Pager pager = new Pager();
        if(fields == null || fields.length <= 0) {
            findInfoService.searchAll(pager);
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
            findInfoService.searchAnd(fields, values, pager);
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
        findInfoService.searchFields(new String[]{"title", "content", "user.name", "car.name", "car.brand.name", "source.name"}, value, pager);
        return pager;
    }


    @RequestMapping("/findAndFields")
    public @ResponseBody List<FindInfo> findAndFields(@RequestParam(required = false) String[] fields, @RequestParam(required = false) String[] values, Pager pager, HttpServletRequest request){
        if(fields == null || fields.length <= 0) return findInfoService.searchAll(pager);
        for (int i = 0; i < fields.length; i++) {
            if(fields[i].equals("user.city")){
                try {
                    values[i] = URLDecoder.decode(values[i], "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
        }
        List<FindInfo> findInfos = findInfoService.searchAnd(fields, values, pager);
        return findInfos;
    }

    //关键字查询配置
    @RequestMapping("/searchByValue")
    public @ResponseBody List<FindInfo> searchByFields(String value, Pager pager) {
        try {
            value = URLDecoder.decode(value, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<FindInfo> findInfos = findInfoService.searchFields(new String[]{"title", "content", "user.name", "car.name", "car.brand.name", "source.name"}, value, pager);
        return findInfos;
    }


    @RequestMapping("/findAll")
    public @ResponseBody List<FindInfo> findAll(HttpSession session, Pager pager, HttpServletRequest request) {
        List<FindInfo> findInfos = findInfoService.searchAll(pager);
        return findInfos;
    }

    @RequestMapping("/findInfoDetail")
    public String findInfoDetail(Integer id, HttpServletRequest request) {
        FindInfo findInfo = findInfoService.search("fiid", id.toString(), null).get(0);
        request.setAttribute("findInfo", findInfo);
        return "findInfoDetail";
    }

    @RequestMapping("/writeFindInfo")
    public String writeFindInfo(Integer id,HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) return "login";
        if (id != null && id != 0) {
            FindInfo findInfo = findInfoService.search("fiid", id.toString(), null).get(0);
            request.setAttribute("findInfo", findInfo);
        }
        return "writeFindInfo";
    }

    @RequestMapping("/saveFindInfo")
    public String saveFindInfo(FindInfo findInfo, HttpSession session) {
        User user = (User) session.getAttribute("user");
        findInfo.setUser(user);
        findInfo.setInsertTime(new Date());
        findInfoService.saveFindInfo(findInfo);
        return "userFindInfo";
    }

    @RequestMapping("/updateFindInfo")
    public String updateFindInfo(FindInfo findInfo) {
        findInfo.setInsertTime(new Date());
        findInfoService.updateBFindInfo(findInfo);
        return "userFindInfo";
    }

    @RequestMapping("/deleteFindInfo")
    public String deleteFindInfo(Integer id) {
        findInfoService.deleteFindInfo(id);
        return "userFindInfo";
    }

}