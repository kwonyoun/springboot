package com.example.back.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.back.service.CartService;
import com.example.back.vo.CartinfoVO;

@Controller
public class CartController {

    @Autowired
    CartService svc;

    @PostMapping("/cart")
    public String insertCart(@ModelAttribute CartinfoVO cart ) {
        String ID = cart.getCartMemId();
        svc.insertCart(cart);
        return "redirect:/cart/list?ID="+ID;
    }

    @GetMapping("/cart/list")
    public String selectCartList(Model model, @RequestParam("ID") String ID ) {
        ArrayList<CartinfoVO> vo = svc.selectCartList(ID);
        model.addAttribute("cartlist", vo);
        return "cart";
    }

    @GetMapping("/cart/delete")
    public String deleteCart(@RequestParam("cartnum") int num, @RequestParam("ID") String ID ) {
        svc.deleteCart(num);
        return "redirect:/cart/list?ID="+ID;
    }

    
    
}
