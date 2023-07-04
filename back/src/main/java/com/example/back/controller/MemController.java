package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.back.service.MemService;
import com.example.back.vo.InfoMember;

@Controller
public class MemController {

    @Autowired
    MemService memService;

    @GetMapping("/signup")
    public String member() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute InfoMember member) {
        Integer mem = memService.insertSignup(member);
        if(mem == 1)
        {
              return "login";
        }
        return "/signup";
    }
    
}
