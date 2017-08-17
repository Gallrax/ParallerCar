import com.entity.Source;
import com.service.SourceService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/7.
 */
public class SourceTest {

    ApplicationContext context;
    SourceService sourceService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        sourceService = context.getBean(SourceService.class);
    }

    @Test
    public void index() {
        sourceService.index();
    }

    @Test
    public void test01() {
        List<Source> sources = sourceService.findAll();
        for (Source source : sources) {
            System.out.println(source);
        }
    }
}
