package com.example.back.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.ProdVO;

@Mapper
public interface ProdDao {

    public ProdVO selectProd(int prodnum);
    
}
