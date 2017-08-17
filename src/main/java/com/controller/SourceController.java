package com.controller;

import com.entity.Source;
import com.service.SourceService;
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
@RequestMapping("/source")
@Controller
public class SourceController {

    @Autowired
    private SourceService sourceService;

    @RequestMapping("/findByCar")
    public @ResponseBody List<Source> findByCar(String car, Pager pager, HttpServletRequest request) {
        List<Source> sources = sourceService.search("cars.name", car, pager);
        return sources;
    }

    @RequestMapping("/findAll")
    public @ResponseBody List<Source> findAll(Pager pager, HttpServletRequest request) {
        List<Source> sources = sourceService.searchAll(pager);
        return sources;
    }
}
