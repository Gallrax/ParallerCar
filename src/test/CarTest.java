import com.entity.Car;
import com.service.CarService;
import com.util.Pager;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public class CarTest {

    ApplicationContext context;
    CarService carService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        carService = context.getBean(CarService.class);
    }

    @Test
    public void index() {
        carService.index();
    }

    @Test
    public void search() {
        List<Car> cars = carService.search("brand.name", "丰田", null);
        for (Car car : cars) {
            System.out.println(car);
        }
    }

    @Test
    public void searchFields() {
        List<Car> cars = carService.searchFields(new String[]{"brand.name", "saleInfos.title"}, "丰田", null);
        for (Car car : cars) {
            System.out.println(car);
        }
    }

    @Test
    public void searchOr() {
        List<Car> cars = carService.searchOr(new String[]{"brand.name", "saleInfos.title"}, new String[]{"奔驰", "霸道"}, null);
        for (Car car : cars) {
            System.out.println(car);
        }
    }

    @Test
    public void searchAnd() {
        List<Car> cars = carService.searchAnd(new String[]{"brand.name", "saleInfos.title"}, new String[]{"奔驰", "霸道"}, null);
        for (Car car : cars) {
            System.out.println(car);
        }
    }

    @Test
    public void test01() {
        List<Car> cars = carService.findAll();
        for (Car car : cars) {
            System.out.println(car +"--->"+ car.getBrand());
        }
    }

    @Test
    public void test02() {
        Car car = carService.findById(3);
        /*Set<Source> sources = car.getSources();
        for (Source source : sources) {
            System.out.println(source);
        }*/
    }

    @Test
    public void test03() {
        Car car = carService.findById(1);
//        Set<FindInfo> findInfos = car.getFindInfos();
//        for (FindInfo findInfo : findInfos) {
//            System.out.println(findInfo);
//        }
    }

    @Test
    public void test04() {
        Car car = carService.findById(1);
//        Set<SaleInfo> saleInfos = car.getSaleInfos();
//        System.out.println(saleInfos.size());
//        for (SaleInfo saleInfo : saleInfos) {
//            System.out.println(saleInfo);
//        }
    }

    @Test
    public void test05() {
        List<Car> cars = carService.searchAll(new Pager());
        for (Car car : cars) {
            System.out.println(car);
        }
    }

    @Test
    public void test06() {
        List<Car> cars = carService.search("brand.bid", "4", null);
        for (Car car : cars) {
            System.out.println(car);
        }
    }
}
