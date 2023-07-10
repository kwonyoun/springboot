
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>

    <link rel="stylesheet" href="/css/header_footer.css">
    <link rel="stylesheet" href="/css/css.css">
    <link rel="stylesheet" href="/css/cscenter.css">
    <link rel="stylesheet" href="/css/cscenter_qna.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
   <script src="/js/slick-1.8.1/slick/slick.min.js"></script>
   <script src="/js/header_menu.js"></script>
   
    
</head>
<style type="text/css">
    
   section .cscenter_menu_wrap .cscenter_menu:first-child, .cscenter_menu:nth-child(2) {
        background-color: #f6f6f6;
        border-radius: 10px; 
      }
    
      section .cscenter_menu_wrap .cscenter_menu:nth-child(3) {
        background-color: rgba(126, 125, 203, 0.26);
        border-radius: 10px;
      }
      
      .cscenter_menu {
      
       position: relative;
     }
     
     .triangle {
     
       margin-left: 165px; /* 삼각형의 가로 길이의 절반 */
       width: 0;
       height: 0;
       border-top: 10px solid rgba(126, 125, 203, 0.26); /* 삼각형의 높이 */
       border-right: 10px solid transparent;
       border-left: 10px solid transparent;
     }
   
   </style>
<body>

   <jsp:include page="header.jsp" />
   
<section>


   <div class="cscenter" >

         <div class="cscenter_menu_wrap" >
         
               <div class="cscenter_menu" >
               
                  <div class="cscenter_menu_txt">         
                     <p style="margin-left: 30px;"><a href="cscenter_not_list.do" >공지사항</a></p>
                  </div>   
               
               </div>
               
               <div class="cscenter_menu" >
               
                  <div class="cscenter_menu_txt">         
                     <p><a href="cscenter_faq.jsp">자주하는 질문</a></p>
                  </div>
               
               </div>
               
               <div class="cscenter_menu" >
               
                  <div class="cscenter_menu_txt">         
                     <p><a href="cscenter_qna_list.do">직접 문의하기</a></p>

                  </div>
                  
                  <div class="triangle"></div>

               </div>
            
            </div>
                     
      </div>

<form action="cscenter_qna_list_date.jsp">
    <div class="board_wrap">
    
        <div class="qna_title">
        
           <div id="qna_title_wrap" >
               <h1 style="font-size: 40px;" >Q&A</h1>
            <h3 style="font-size: 20px;" >직접 문의하기</h3>
         </div>
         
         <div class="qna_date_wrap" >
                
              <input type="date"  name="start_date" >
            <input type="date" name="end_date" >
            <input type="submit" value="조회하기" >
        
           </div>
        </div>
        
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                 <!-- <div class="num">번호</div> -->   
                    <div class="num">카테고리</div>
                    <div class="title">제목</div>
                    <div class="writer">질문자</div>
                    <div class="count">답변상황</div>
                    <div class="date">문의일</div>
                </div>


<!-- foreach 문으로 컬렉션 반복 처리 -->
<c:forEach var="item" items="${qnalist}">
  ${item.qnaCon}
</c:forEach>
                
                

           
            
            
       
            <div class="bt_wrap">
                <a href="/cscenter/qna/write" class="on" >등록</a>
                <!--<a href="#">수정</a>-->
            </div>
            
            
          
            
        </div>
    </div>
    </form>
    
    </section>
    
    <footer>
   <jsp:include page="footer.jsp"/>
   </footer>
   
</body>
</html> 