import com.entity.Car;
import com.entity.FindInfo;
import com.service.FindInfoService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public class TestFindInfo {

    ApplicationContext context;
    FindInfoService findInfoService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        findInfoService = context.getBean(FindInfoService.class);
    }

    @Test
    public void index() {
        findInfoService.index();
    }

    @Test
    public void test01() {
        List<FindInfo> all = findInfoService.findAll();
        for (FindInfo findInfo : all) {
            System.out.println(findInfo +"--->"+ findInfo.getUser());
        }
    }

    @Test
    public void test02() {
        FindInfo findInfo = findInfoService.findById(1);
        Car car = findInfo.getCar();
        System.out.println(car);
    }

    @Test
    public void test03() {
        List<FindInfo> findInfos = findInfoService.search("user.uid", "1", null);
        for (FindInfo findInfo : findInfos) {
            System.out.println(findInfo);
        }
    }

    @Test
    public void test04() {
        findInfoService.deleteFindInfo(7);
    }

}
