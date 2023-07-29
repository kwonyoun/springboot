package com.example.back.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.back.service.UserService;
import com.siot.IamportRestClient.IamportClient;

@Controller
public class PayMentController {

    @Autowired
	UserService userService;

	private IamportClient api;
	
	public PayMentController(){		
		//토큰 발급
		this.api = new IamportClient("6510774276607636","hzGO6aM6m3xfCHWeXIUmOHf0gPbIjUtLF1lU9Otr48iYpF9DeZWSyLXiqZYYxb5ZpsTtQa1RWMLGgOnn");
	}
		
	// @ResponseBody
	// @RequestMapping(value="/verifyiamport/{imp_uid}", method=RequestMethod.POST)
	// public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session
	// 		, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
		
	// 		return api.paymentByImpUid(imp_uid);
	// }
	
	//결제 완료 시 DB에 결제 완료 처리 - 02.15
	//관리자 페이지 코드 추가 - 02.19

	@ResponseBody
	@RequestMapping(value="/paySuccess", method=RequestMethod.POST)
	public void paySuccess(@RequestParam("amount")String amount,@RequestParam("ID")String ID) {

		System.out.println("controller/"+amount+"/"+ID);

		int tmp = Integer.parseInt(amount);
		int months = tmp/15000; //개월 수로 치환 -> 기간 갱신을 위함
		Map<String, Object> map = new HashMap<>();

		map.put("ID", ID);
		map.put("months", months);

		if(userService.paidCheck(ID) == "Y") {
			userService.rePaid(map);
		}
		else {
			userService.paid(map); //첫 결제시 : map에 ID, 개월 수 넣고 DB갱신
		}
			
	}	
}
