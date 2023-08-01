package com.example.back.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties.Reactive.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.back.service.UserService;
import com.siot.IamportRestClient.Iamport;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import jakarta.servlet.http.HttpSession;

@Controller
public class PayMentController {

    @Autowired
	UserService userService;

	// private IamportClient api;
	
	// public PayMentController(){		
	// 	//토큰 발급
	// 	this.api = new IamportClient("6510774276607636","hzGO6aM6m3xfCHWeXIUmOHf0gPbIjUtLF1lU9Otr48iYpF9DeZWSyLXiqZYYxb5ZpsTtQa1RWMLGgOnn");
	// 	System.out.println("aa"+api.hashCode());

		
	// }
		
	// @ResponseBody
	// @RequestMapping(value="/verifyiamport/{imp_uid}", method=RequestMethod.POST)
	// public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
	// 		, @PathVariable(value= "imp_uid") String imp_uid, @RequestParam("amount") String paid_amount) throws IamportResponseException, IOException{	
		
	// 			System.out.println("verifyController");
	// 			System.out.println(imp_uid);
	// 			System.out.println(paid_amount);
	// 			System.out.println("response"+api.hashCode());



	// 		return api.paymentByImpUid(imp_uid);
	// }

	
	//결제 완료 시 DB에 결제 완료 처리 - 02.15
	//관리자 페이지 코드 추가 - 02.19

	@ResponseBody
	@RequestMapping(value="/paySuccess", method=RequestMethod.POST)
	public void paySuccess(@RequestParam("paid_amount")String paid_amount,@RequestParam("imp_uid")String uid) {

		System.out.println("controller/총합계:"+paid_amount+"/고유id:"+uid);

		Map<String, Object> map = new HashMap<>();

        int amount = Integer.parseInt(paid_amount);

		map.put("imp_uid", uid);
		map.put("amount", amount);

        userService.paySuccess(map);

        // return "tests";

		// if(userService.paidCheck(uid) == "Y") {
		// 	userService.rePaid(map);
		// }
		// else {
		// 	userService.paid(map); //첫 결제시 : map에 ID, 개월 수 넣고 DB갱신
		// }
			
	}	

	
}
