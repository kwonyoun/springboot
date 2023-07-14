package com.example.back.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.ProdVO;

@Mapper
public interface CartDao {

    public void insertCart(ProdVO cart);
    
}
