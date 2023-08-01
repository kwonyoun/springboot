package com.example.back.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.PayDao;
import com.example.back.vo.PayinfoVO;

@Service
public class PayService {

    @Autowired
    PayDao dao;

    //Service
    public void paySuccess(Map<String, Object> map){
        dao.paySuccess(map);
    };

    public PayinfoVO payInfoSelect(String uid){
        System.out.println("svc");
        PayinfoVO vo = dao.payInfoSelect(uid);
        System.out.println("vo"+vo);
        return vo;
    };
    
}
