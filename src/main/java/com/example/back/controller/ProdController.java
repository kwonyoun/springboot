package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.back.service.ProdService;
import com.example.back.vo.ProdVO;

@Controller
public class ProdController {

    @Autowired
    ProdService svc;

    @GetMapping("/prod")
    public String showProd(Model model, @RequestParam("prodNum") int prodnum) {
        ProdVO vo = svc.selectProd(prodnum);
        model.addAttribute("vo", vo);
        return "prodView";
    }
    
}
