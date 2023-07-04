package com.example.back.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class TestController {

    @GetMapping
    public String test(Model model , HttpSession session) {
        model.addAttribute("test", "gettest");
        return "index";
    }


    
}
