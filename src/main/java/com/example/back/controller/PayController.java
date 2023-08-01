package com.example.back.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.back.service.PayService;
import com.siot.IamportRestClient.IamportClient;

@Controller
public class PayController {

    @Autowired
    PayService svc;

    private IamportClient api;
	
	public PayController(){		
		//토큰 발급
		this.api = new IamportClient("6510774276607636","hzGO6aM6m3xfCHWeXIUmOHf0gPbIjUtLF1lU9Otr48iYpF9DeZWSyLXiqZYYxb5ZpsTtQa1RWMLGgOnn");
	}

    @GetMapping("/pay")
    public String pay() {
        return "pay";
    }

    // @PostMapping("/paySuccess")
    // public String requestpay(@RequestParam("ID") String buyer_email, @RequestParam("amount") String paid_amount) {
    //     System.out.println("aaaaaaaaa");
    //     System.out.println(buyer_email);
    //     System.out.println(paid_amount);
    //     return "pay";
    // }

    
}
