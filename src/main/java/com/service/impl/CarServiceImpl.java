package com.service.impl;

import com.dao.CarDao;
import com.entity.Car;
import com.service.CarService;
import com.util.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Service
public class CarServiceImpl implements CarService {

    @Resource
    private CarDao carDao;

    public List<Car> findAll() {
        return carDao.findAllCar();
    }

    public Car findById(Integer id) {
        return carDao.findCarById(id);
    }

    public void saveCar(Car car) {
        carDao.saveCar(car);
    }

    public void deleteCar(Integer id) {
        carDao.deleteCar(id);
    }

    public void updateCar(Car car) {
        carDao.updateCar(car);
    }

    public void index() {
        carDao.index();
    }

    public List<Car> search(String field, String value, Pager pager) {
        return carDao.search(field, value, pager);
    }

    public List<Car> searchFields(String[] fields, String value, Pager pager) {
        return carDao.searchFields(fields, value, pager);
    }

    public List<Car> searchAnd(String[] fields, String[] values, Pager pager) {
        return carDao.searchAnd(fields, values, pager);
    }

    public List<Car> searchOr(String[] fields, String[] values, Pager pager) {
        return carDao.searchOr(fields, values, pager);
    }

    public List<Car> searchAll(Pager pager) {
        return carDao.searchAll(pager);
    }
}
