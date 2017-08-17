package com.controller;

import com.entity.Brand;
import com.entity.Car;
import com.service.CarService;
import com.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/3/10.
 */
@RequestMapping("/car")
@Controller
public class CarController {

    @Autowired
    private CarService carService;

    @RequestMapping("/findAndFields")
    public @ResponseBody List<Car> findAndFields(String[] fields, String[] values, Pager pager) {
        List<Car> cars = carService.searchAnd(fields, values, pager);
        return cars;
    }

    @RequestMapping("/findAll")
    public @ResponseBody List<Car> findAll(Pager pager, HttpServletRequest request) {
        List<Car> cars = carService.searchAll(pager);
        return cars;
    }

    //从brand传过来的name查询car
    @RequestMapping("/findByHot")
    public @ResponseBody List<Car> findByHot(Pager pager, HttpServletRequest request){
        List<Brand> brands = (List<Brand>) request.getAttribute("brands");
        List<Car> cars = new ArrayList<Car>();
        for (Brand brand : brands) {
            List<Car> cs = carService.search("brand.name", brand.getName(), pager);
            if(cs != null && !cs.isEmpty()) cars.add(cs.get(0));
        }
        return cars;
    }


}
