package com.kybex.toy_springboots.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MainDao {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public Object insert(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object getUserList(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object deleteOne(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }

    public Object deleteSurvey(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.delete(sqlMapId, dataMap);
        return result;
    }

    public Object updateOne(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.update(sqlMapId, dataMap);
        return result;
    }

    public Object selectOne(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

}
