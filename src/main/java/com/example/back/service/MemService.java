package com.example.back.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.back.dao.MemDao;
import com.example.back.vo.MemVO;

@Service
public class MemService {

    @Autowired
    MemDao dao;

    public Integer insertSignup(MemVO member) {

        Integer mem = dao.insertSignup(member);
        System.out.println("memsvc    "+mem);

        return mem;
    }

    public MemVO selectMem(String id) {
        System.out.println("memsvc      "+id);

        MemVO login = dao.selectMem(id);
        System.out.println("svcvoID      "+login.getMemId());
        System.out.println("svcvoPW      "+login.getMemPw());
        return login; 
    }

    public Integer selectIdCheck(String idcheck) {
        System.out.println("memsvc    "+idcheck);
        Integer cnt = dao.selectIdCheck(idcheck);

        return cnt;
    }
    
}
