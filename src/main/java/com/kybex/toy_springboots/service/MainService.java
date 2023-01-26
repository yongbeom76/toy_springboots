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

    public Object deleteAndList(Object dataMap) {
        this.deleteSurvey(dataMap);
        this.deleteOne(dataMap);
        Object result = this.getUserList(dataMap);
        return result;
    }

    public Object deleteOne(Object dataMap) {
        String sqlMapId = "Main.deleteOne";
        Object result = mainDao.deleteOne(sqlMapId, dataMap);
        return result;
    }

    public Object deleteSurvey(Object dataMap) {
        String sqlMapId = "Main.deleteSurvey";
        Object result = mainDao.deleteSurvey(sqlMapId, dataMap);
        return result;
    }

}
