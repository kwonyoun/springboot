package com.example.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.OrderDao;
import com.example.back.vo.MemVO;
import com.example.back.vo.ProdVO;

@Service
public class OrderService {

    @Autowired
    OrderDao dao;

    //주문자 정보 select
    public MemVO selectMeminfo(String id) {
        MemVO vo = dao.selectMeminfo(id);
        return vo;
    }

    //주문 상품정보 select
    public ProdVO selectOrdProd(int prodnum) {
        ProdVO vo = dao.selectOrdProd(prodnum);
        return vo;
    }

    
    
}
