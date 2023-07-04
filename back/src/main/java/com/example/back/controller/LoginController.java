package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.back.service.MemService;
import com.example.back.vo.InfoMember;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    MemService memService;

    @GetMapping("/login")
    public String loginmain() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute InfoMember param, HttpSession session ) {

        InfoMember in =  memService.selectMem(param);
    
        if(in == null)
        {
            return "/login";
        }
        else{
            session.setAttribute("mem_id", in.getMemid());
        }
       return "redirect:/";
    }
}
