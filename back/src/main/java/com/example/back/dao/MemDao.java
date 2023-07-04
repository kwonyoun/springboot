package com.example.back.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.InfoMember;

@Mapper
public interface MemDao {

    public Integer insertSignup(InfoMember mem);

    public InfoMember selectMem(InfoMember param);

    //회원가입시 아이디 중복방지
    public Integer joincheck(InfoMember mem);


    
}
