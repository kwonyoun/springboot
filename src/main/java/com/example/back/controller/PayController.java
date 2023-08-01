package com.example.back.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.back.service.PayService;
import com.example.back.vo.PayinfoVO;

@Controller
public class PayController {

    @Autowired
    PayService svc;

    @GetMapping("/pay")
    public String pay() {
        return "pay";
    }

    @ResponseBody
	@RequestMapping(value="/paySuccess", method=RequestMethod.POST)
	public String paySuccess(@RequestParam("paid_amount")String paid_amount,@RequestParam("imp_uid")String uid) {

		System.out.println("controller/총합계:"+paid_amount+"/고유id:"+uid);

		Map<String, Object> map = new HashMap<>();

        int amount = Integer.parseInt(paid_amount);

		map.put("imp_uid", uid);
		map.put("amount", amount);

        svc.paySuccess(map);

        return uid;
			
	}

    @GetMapping("/payInfo/{res}")
    public String payInfo(@PathVariable("res") String uid, Model model){
        System.out.println("payInfo");

        PayinfoVO vo = svc.payInfoSelect(uid);
        model.addAttribute("vo", vo);

        return "paySuccess";

    }

    
}
