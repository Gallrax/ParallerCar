import com.entity.Brand;
import com.service.BrandService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public class TestBrand {

    ApplicationContext context;
    BrandService brandService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        brandService = context.getBean(BrandService.class);
    }

    @Test
    public void index() {
        brandService.index();
    }

    @Test
    public void search() {
        List<Brand> brands = brandService.search("name", "奔", null);
        for (Brand brand : brands) {
            System.out.println(brand);
//            for (Car car : brand.getCars()) {
//                System.out.println(car);
//            }
        }
    }

    @Test
    public void test01() {
        List<Brand> brands = brandService.findAll();
        for (Brand brand : brands) {
            System.out.println(brand);
        }
    }

    @Test
    public void test02() {
        Brand brand = brandService.findById(4);
//        Set<Car> cars = brand.getCars();
//        for (Car car : cars) {
//            System.out.println(car);
//        }
    }

    @Test
    public void findAll() {
        List<Brand> brands = brandService.findAll();
        for (Brand brand : brands) {
            System.out.println(brand);
        }
    }
}
