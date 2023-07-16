package com.example.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.MemDao;
import com.example.back.vo.MemVO;

@Service
public class MemService {

    @Autowired
    MemDao dao;

    //회원가입
    public Integer insertSignup(MemVO member) {
        Integer mem = dao.insertSignup(member);
        return mem;
    }

    //로그인 여부
    public MemVO selectMem(String id,String pw) {

        Integer cnt = dao.selectIdCheck(id);

        //아이디가 select되었을 경우
        if(cnt == 1) {
            MemVO login = dao.selectMem(id);
            if(pw.equals(login.getMemPw()) ) {
                System.out.println("로그인 성공");
                return login;
            } else {
                System.out.println("비밀번호 확인하세요");
                return null;
            }

        } else {
            System.out.println("없는 아이디입니다.");
        }
        return null;

    }

    //아이디 중복 체크
    public Integer selectIdCheck(String idcheck) {
        Integer cnt = dao.selectIdCheck(idcheck);

        return cnt;
    }

    
}
