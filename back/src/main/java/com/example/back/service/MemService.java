package com.example.back.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.MemDao;
import com.example.back.vo.InfoMember;

@Service
public class MemService {

    @Autowired
    MemDao dao;

    public Integer insertSignup(InfoMember member) {

        Integer joinchekc = dao.joincheck(member);
        Integer mem = 0;

        if(joinchekc == 0)
        {
          mem = dao.insertSignup(member);
    
        }else
        {
            System.out.println("이미 사용중인 아이디입니다.");
        }
           
        return mem;
    }

     public InfoMember selectMem(InfoMember loginmem) {
        
        Integer joinchekc = dao.joincheck(loginmem);
        InfoMember login = new InfoMember();

        if(joinchekc == 1)
        {
             login = dao.selectMem(loginmem);
            if(loginmem.getMempw().equals(login.getMempw()))
            {
                System.out.println("로그인성공");
                return login;
            }else
            {
                System.out.println("로그인실패");
            }
        }
        else{
            System.out.println("없는 아이디입니다.");
        }
        return null;
    }
   
}
