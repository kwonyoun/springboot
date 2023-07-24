package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.back.service.MemService;

@Controller
public class CsNoticeController {

    @Autowired
    MemService memService;

    @GetMapping("/csNotice")
    public String cscentrFaq() {
        return "csNotice";
    }

    @GetMapping("/csNotice/wirte")
    public String csNoticeWrite() {
        return "csNoticeWrite";
    }




    
}
