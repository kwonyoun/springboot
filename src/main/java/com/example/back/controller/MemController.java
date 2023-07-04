package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.back.service.MemService;
import com.example.back.vo.MemVO;

@Controller
public class MemController {

    @Autowired
    MemService memService;

    @GetMapping("/signup")
    public String member() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute MemVO member) {
        Integer mem = memService.insertSignup(member);
        System.out.println(mem);
        return "login";
    }

    @GetMapping("/signup/userId/check")
    public Integer signupidcheck(@RequestParam("memId") String id) {

        System.out.println("idcheck   "+id);

        Integer cnt = memService.selectIdCheck(id);
        System.out.println("resultCount   "+cnt);

        return cnt;
    }
    
}
