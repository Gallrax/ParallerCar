import com.alibaba.fastjson.JSON;
import com.entity.User;
import org.junit.Test;

/**
 * Created by Administrator on 2017/3/10.
 */
public class JsonTest {

    @Test
    public void test01() {
        User user = new User();
        user.setId(1);
        String s = JSON.toJSONString(user);
        System.out.println(s);
    }
}
