import com.e.Type;
import org.junit.Test;

/**
 * Created by Administrator on 2017/3/6.
 */
public class TestEnum {

    @Test
    public void test01() {
        System.out.println(Type.SMALL);
    }

    @Test
    public void test02() {
        System.out.println(Type.SMALL.getValue());
    }

    @Test
    public void test03() {
        Type[] values = Type.values();
        for (int i = 0; i < values.length; i++) {
            System.out.println(values[i].getValue());
        }
        for (Type value : values) {
            System.out.println(value.getValue());
        }
    }
}
