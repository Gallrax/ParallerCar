import org.junit.Test;

/**
 * Created by Administrator on 2017/3/7.
 */
public class TestOther {

    @Test
    public void test01() {
        System.out.println(Math.round(11.5));
        System.out.println(Math.round(-11.5));
        System.out.println(Math.round(-11.7));
        System.out.println(Math.round(11.3));
    }

    @Test
    public void test() {
        System.out.println("tom".equals("TOM"));
    }

    @Test
    public void test02() {
        int temp1 = -2147483648;
        int temp2 = 2147483647;
        System.out.println(" temp1 bit : " + Integer.toBinaryString(temp1) + ", length : " + Integer.toBinaryString(temp1).length() + ", value : " + temp1);
        System.out.println(" temp2 bit : " + Integer.toBinaryString(temp2) + ", length : " + Integer.toBinaryString(temp2).length() + ", value : " + temp2);
        int i1 = temp1 >> 1;
        int i2 = temp2 >> 1;
        System.out.println(" i1 bit : " + Integer.toBinaryString(i1) + ", length : " + Integer.toBinaryString(i1).length() + ", value : " + i1);
        System.out.println(" i2 bit : " + Integer.toBinaryString(i2) + ", length : " + Integer.toBinaryString(i2).length() + ", value : " + i2);
    }
}
