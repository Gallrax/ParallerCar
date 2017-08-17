package com.listener;

import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2017/4/20.
 */
@Component
public class InitListener implements ApplicationListener<ContextRefreshedEvent> {

    @Autowired
    private UserService userService;

    public void onApplicationEvent(ContextRefreshedEvent event) {
        if(event.getApplicationContext().getParent() == null){
            userService.flush();
        }
    }
}
