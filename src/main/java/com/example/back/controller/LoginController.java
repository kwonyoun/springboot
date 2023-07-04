package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.back.service.MemService;
import com.example.back.vo.MemVO;

@Controller
public class LoginController {

    @Autowired
    MemService memService;

    @GetMapping("/login")
    public String loginmain() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("memId") String id, @RequestParam("memPw") String pw) {

        System.out.println("formID    "+id);
        System.out.println("formPW    "+pw);
       
       MemVO login = memService.selectMem(id);
       System.out.println("controllerID    "+login.getMemId());
        System.out.println("controllerPW   "+login.getMemPw());

       return "index";
    }
}
