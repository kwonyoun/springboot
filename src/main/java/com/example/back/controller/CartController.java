package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.back.service.CartService;
import com.example.back.vo.ProdVO;

@Controller
public class CartController {

    @Autowired
    CartService svc;

    @PostMapping("/cart")
    public String prodCart(Model model, @ModelAttribute ProdVO cart ) {
        svc.insertCart(cart);
        return "prodView";
    }
    
}
