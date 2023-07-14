package com.example.back.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.ProdVO;

@Mapper
public interface IndexDao {

    public ArrayList<ProdVO> selectProdLIst();
    
}
