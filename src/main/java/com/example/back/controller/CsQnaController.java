package com.example.back.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.back.service.CsQnaService;
import com.example.back.vo.CsQnaVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class CsQnaController {

    @Autowired
    CsQnaService svc;

    @GetMapping("/cscenter/qnalist")
    public String cscenterQna(Model model) {
        ArrayList<CsQnaVO> vo = svc.selectQnaList();
        System.out.println(vo.get(0).getQnaDate());
        model.addAttribute("qnalist", vo);
        return "csQnaList";
    }

    //qna등록 아이디 가져옴 
    //getmapping과 postmapping은 서로 다른거라서 경로를 같게 해도 된다.
    @GetMapping("/cscenter/qna/write")
    public String qnaWrite(HttpSession session) {
        String memid = (String)session.getAttribute("id");
        System.out.println("sessionId:       "+memid);
        return "csQnaWrite";
        
    }

    //qna등록 내용 insert하기 
    @PostMapping("/cscenter/qna/write")
    public String qnaWriteSuc(HttpSession session, @ModelAttribute CsQnaVO vo) {
        String memid = (String)session.getAttribute("id");
        vo.setQnaMemId(memid);
        svc.insertQna(vo);

        return "redirect:/cscenter/qnalist";

    }



    
}
