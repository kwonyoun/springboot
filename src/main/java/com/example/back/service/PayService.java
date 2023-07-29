package com.example.back.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.IndexDao;
import com.example.back.vo.ProdVO;

@Service
public class PayService {

    @Autowired
    IndexDao dao;

    //index페이지 상품selectList
    public ArrayList<ProdVO> selectProdLIst() {
        ArrayList<ProdVO> vo = dao.selectProdLIst();
        return vo;
    }
    
}
