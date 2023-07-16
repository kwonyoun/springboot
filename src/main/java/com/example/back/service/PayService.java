package com.example.back.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.PayDao;
import com.example.back.vo.CartinfoVO;

@Service
public class PayService {

    @Autowired
    PayDao dao;

    //장바구니 insert
    public void insertCart(CartinfoVO cart) {
        dao.insertCart(cart);
    }

    //장바구니 selectList
    public ArrayList<CartinfoVO> selectCartList(String cartmemid) {
        ArrayList<CartinfoVO> vo = dao.selectCartList(cartmemid);
        return vo;
    }
    
}
