package com.example.back.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.MemVO;

@Mapper
public interface MemDao {

    public Integer insertSignup(MemVO mem);

    public MemVO selectMem(String loginmem);

    public Integer selectIdCheck(String idcheck);


    
}
