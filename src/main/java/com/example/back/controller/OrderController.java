package com.example.back.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.back.service.OrderService;
import com.example.back.vo.MemVO;
import com.example.back.vo.ProdVO;

@Controller
public class OrderController {

    @Autowired
    OrderService svc;

    @GetMapping("/order")
    public String selectOrdMem(Model model,@RequestParam("memId") String id, @RequestParam("prodNum") int prodnum, @RequestParam("ordQuan") int quan) {

        MemVO memVO = svc.selectMeminfo(id);
        String mm =memVO.getMemMobile();
        String[] mobile = mm.split("/");
        memVO.setMemMobile1(mobile[0]);
        memVO.setMemMobile2(mobile[1]);
        memVO.setMemMobile3(mobile[2]);

        String aa = memVO.getMemAddr();
        String [] addr = aa.split("/");
        memVO.setMemAddr1(addr[0]);
        memVO.setMemAddr2(addr[1]);
        memVO.setMemAddr3(addr[2]);
        memVO.setMemAddr4(addr[3]);

        ProdVO ProdVO = svc.selectOrdProd(prodnum);

        model.addAttribute("memVO", memVO);
        model.addAttribute("ProdVO", ProdVO);
        model.addAttribute("ordQuan", quan);
        return "prodOrder";
    }    
    
}
