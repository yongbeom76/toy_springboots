package com.kybex.toy_springboots.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kybex.toy_springboots.Dao.MainDao;

@Service
public class MainService {

    @Autowired
    MainDao mainDao;

    public Object getUserList(Object dataMap) {
        String sqlMapId = "Main.selectAllFromUsers";
        Object result = mainDao.getUserList(sqlMapId, dataMap);
        return result;
    }
}
