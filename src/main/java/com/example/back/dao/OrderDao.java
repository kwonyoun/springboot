package com.example.back.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.MemVO;
import com.example.back.vo.ProdVO;

@Mapper
public interface OrderDao {

    public MemVO selectMeminfo(String id);
    public ProdVO selectOrdProd(int prodnum);
    
    
}
