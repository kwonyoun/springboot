package com.example.back.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    //qna게시글 보기
    @GetMapping("/cscenter/qna/view")
    public String qnaView(Model model, @RequestParam("qnaNum") int qnanum) {

        CsQnaVO vo = svc.selectQnaView(qnanum);
        model.addAttribute("vo", vo);
        return "csQnaView";
    }

    //qna게시글 삭제
    @GetMapping("/cscenter/qna/delete")
    public String qnaDelete(@RequestParam("qnaNum") int qnanum) {
        svc.deleteQna(qnanum);


        return "redirect:/cscenter/qnalist";
    }

    //qna게시글 수정페이지 
    @GetMapping("/cscenter/qna/edit")
    public String qnaUpdateGet(Model model, @RequestParam("qnaNum") int qnanum) {
        CsQnaVO vo = svc.selectQnaView(qnanum);
        model.addAttribute("vo", vo);
        return "csQnaEdit";
    }

    //qna게시글 수정
    @PostMapping("/cscenter/qna/edit")
    public String qnaUpdatePost(@ModelAttribute CsQnaVO before) {
        svc.updateQna(before); //수정값 보내기
        return "redirect:/cscenter/qna/view?qnaNum="+before.getQnaNum(); //게시글 번호로 경로보내기

    }



    
}
