package com.controller;

import com.entity.Brand;
import com.service.BrandService;
import com.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
@RequestMapping("/brand")
@Controller
public class BrandController {

    @Autowired
    private BrandService brandService;

    @RequestMapping("/findAll")
    public @ResponseBody List<Brand> findAll(Pager pager, HttpServletRequest request) {
        List<Brand> brands = brandService.searchAll(pager);
        return brands;
    }

    //查询每个品牌的第一辆车，跳转至car
    @RequestMapping("/findByHot")
    public String findByHot(HttpServletRequest request, Pager pager){
        List<Brand> brands = brandService.searchAll(pager);
        request.setAttribute("brands", brands);
        request.setAttribute("pager", pager);
        return "forward:/car/findByHot";
    }
}
