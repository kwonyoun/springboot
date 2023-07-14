package com.example.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.CartDao;
import com.example.back.vo.ProdVO;

@Service
public class CartService {

    @Autowired
    CartDao dao;

    //장바구니 insert
    public void insertCart(ProdVO cart) {
        dao.insertCart(cart);
    }
    
}
