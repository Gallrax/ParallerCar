import com.entity.SaleInfo;
import com.service.SaleInfoService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/8.
 */
public class SaleInfoTest {

    ApplicationContext context;
    SaleInfoService saleInfoService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        saleInfoService = context.getBean(SaleInfoService.class);
    }

    @Test
    public void index() {
        saleInfoService.index();
    }

    @Test
    public void search() {
        List<SaleInfo> saleInfos = saleInfoService.search("title", "霸道", null);
        for (SaleInfo saleInfo : saleInfos) {
            System.out.println(saleInfo);
        }
    }

    @Test
    public void searchAll() {
        List<SaleInfo> saleInfos = saleInfoService.searchAll(null);
        for (SaleInfo saleInfo : saleInfos) {
            System.out.println(saleInfo);
        }
    }

    @Test
    public void test01() {
        List<SaleInfo> saleInfos = saleInfoService.search("user.uid", "1", null);
        for (SaleInfo saleInfo : saleInfos) {
            System.out.println(saleInfo);
        }
    }

    @Test
    public void test02() {
        List<SaleInfo> saleInfos = saleInfoService.search("car.type", "SUV", null);
        for (SaleInfo saleInfo : saleInfos) {
            System.out.println(saleInfo);
        }
    }

    @Test

    public void test03() {
        saleInfoService.deleteSaleInfo(9);
    }
}
