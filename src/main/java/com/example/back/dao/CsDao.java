package com.example.back.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.back.vo.CsQnaVO;

//@Mapper는 interface로 해야한다. (class아님!)
//mapper의 dao는 xml로 간다.

@Mapper
public interface CsDao {
    public Integer insertQna(CsQnaVO qna);
    public ArrayList<CsQnaVO> selectQna();
}
