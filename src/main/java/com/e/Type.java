package com.e;

/**
 * Created by Administrator on 2017/3/6.
 */
public enum Type {
    SMALL("轿车"), SPORT("跑车"), SUV("SUV"), MPV("MPV");

    private String value;

    Type(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }
}
