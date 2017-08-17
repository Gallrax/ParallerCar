import com.alibaba.fastjson.JSON;
import com.dao.impl.UserDaoImpl;
import com.entity.User;
import com.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2017/3/6.
 */
public class TestUser {

    ApplicationContext context;
    UserService userService;

    @Before
    public void before() {
        context = new ClassPathXmlApplicationContext("applicationContext.xml");
        userService = context.getBean(UserService.class);
    }

    @Test
    public void index() {
        userService.index();
    }

    @Test
    public void flush() {
        userService.flush();
    }

    @Test
    public void search() {
        List<User> users = userService.search("uid", 1 + "", null);
        for (User user : users) {
            System.out.println(user);
            /*for (FindInfo findInfo : user.getFindInfos()) {
                System.out.println(findInfo);
            }*/
        }
    }

    @Test
    public void test01() {
        List<User> users = userService.findAll();
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void test02() {
        User user = userService.findById(3);
        System.out.println(user);
//        Set<FindInfo> findInfos = user.getFindInfos();
//        for (FindInfo findInfo : findInfos) {
//            System.out.println(findInfo);
//        }
    }

    @Test
    public void test03() {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        Class<User> entityClass = userDaoImpl.getEntityClass();
        System.out.println(entityClass);
    }

    @Test
    public void test04() {
        User user = userService.login("tom", "tom");
        System.out.println(user);
    }

    @Test
    public void test05() {
        User user = userService.findById(3);
        String s = JSON.toJSONString(user);
        System.out.println(s);
        User u = JSON.parseObject(s, User.class);
        System.out.println(u);
    }

    @Test
    public void test06() {
        List<User> users = userService.findAll();
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void test07() {
        List<User> users = userService.searchAll(null);
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void test08() {
        List<User> users = userService.searchAnd(new String[]{"isAlone"}, new String[]{"1"}, null);
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void test09() {
        List<User> users = userService.search("username", "b", null);
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void test10() {
        userService.updateFileds(new String[]{"isAlone"}, new String[]{"1"}, 1);
    }

    @Test
    public void test11() {
        int c = '.';
        System.out.println(c);

    }

}
