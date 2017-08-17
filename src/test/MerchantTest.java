import com.entity.Merchant;
import com.service.MerchantService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public class MerchantTest {

    ApplicationContext context;
    MerchantService merchantService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        merchantService = context.getBean(MerchantService.class);
    }

    @Test
    public void index() {
        merchantService.index();
    }

    @Test
    public void test01() {
        List<Merchant> merchants = merchantService.findAll();
        for (Merchant merchant : merchants) {
            System.out.println(merchant);
        }
    }

    @Test
    public void test02() {
        Merchant merchant = merchantService.findById(1);
        /*Set<SaleInfo> saleInfos = merchant.getSaleInfos();
        for (SaleInfo saleInfo : saleInfos) {
            System.out.println(saleInfo);
        }*/
    }

    @Test
    public void test03() {
        Merchant merchant = merchantService.login("merchant", "merchant");
        System.out.println(merchant);
    }
}
