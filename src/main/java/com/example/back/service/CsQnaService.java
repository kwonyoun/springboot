package com.example.back.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.CsDao;
import com.example.back.vo.CsQnaVO;

@Service
public class CsQnaService {

    @Autowired
    CsDao dao;

    //질문등록
    public Integer insertQna(CsQnaVO vo) {
        Integer right = dao.insertQna(vo);
        return right;
    }

    //질문목록
    public ArrayList<CsQnaVO> selectQnaList() {
        ArrayList<CsQnaVO> vo = dao.selectQna();
        return vo;

    }
    
}
