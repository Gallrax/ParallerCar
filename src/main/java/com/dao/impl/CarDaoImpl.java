package com.dao.impl;

import com.dao.CarDao;
import com.entity.Car;
import com.util.SearchUtil;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
@Repository
public class CarDaoImpl extends BaseDao<Car> implements CarDao {

    public List<Car> findAllCar() {
        return super.findAll("from t_car");
    }

    public Car findCarById(Integer id) {
        return super.findById(id);
    }

    public void saveCar(Car car) {
        super.save(car);
    }

    public void deleteCar(Integer id) {
        super.delete(id);
    }

    public void updateCar(Car car) {
        super.update(car);
    }

    public void index() {
        super.index(findAllCar());
    }

}
