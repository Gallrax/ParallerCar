package com.util;

/**
 * Created by Administrator on 2017/4/11.
 */
public class JudgeUtil {

    public static boolean isInteger(String value){
        try {
            Integer.parseInt(value);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public static boolean isDouble(String value){
        try {
            Double.parseDouble(value);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public static Object returnVale(String value){
        if(isInteger(value)) {
            return Integer.parseInt(value);
        } else if (isDouble(value)) {
            return Double.parseDouble(value);
        } else {
            return value;
        }
    }

}
