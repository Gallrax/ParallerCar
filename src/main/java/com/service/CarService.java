package com.service;

import com.entity.Car;
import com.util.Pager;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public interface CarService {

    List<Car> findAll();

    Car findById(Integer id);

    void saveCar(Car car);

    void deleteCar(Integer id);

    void updateCar(Car car);

    void index();

    List<Car> search(String field, String value, Pager pager);

    List<Car> searchFields(String[] fields, String value, Pager pager);

    List<Car> searchAnd(String[] fields, String[] values, Pager pager);

    List<Car> searchOr(String[] fields, String[] values, Pager pager);

    List<Car> searchAll(Pager pager);
}
