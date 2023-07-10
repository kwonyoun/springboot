<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    <%@page import="dto.CsFaqDTO" %>
    <%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/header_footer.css">

    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/cscenter.css">
    <link rel="stylesheet" type="text/css" href="css/cscenter_faq.css">
    
    <!-- faq js -->
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style type="text/css">
	 
	    section .cscenter_menu_wrap .cscenter_menu:nth-child(2) {
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
    
</head>

<jsp:useBean id="user" class="dao.N_controller"/> 


<body>

<header>
   <jsp:include page="header.jsp" />
</header> 

<section>


	<div class="cscenter" >

			<div class="cscenter_menu_wrap" >
			
					<div class="cscenter_menu" >		
						<div class="cscenter_menu_txt">			
							<p><a href="cscenter_not_list.jsp" >공지사항</a></p>
						</div>						
					</div>
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="cscenter_faq.jsp">자주하는 질문</a></p>
						</div>
						<div class="triangle"></div>
					
					</div>
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="cscenter_qna_list.jsp">직접 문의하기</a></p>

						</div>

					</div>
					
				</div>
							
	</div>
		

		
		<div class="cscenter_faq" >
		
			
			
			<div class="faq_search_wrap" >
			
				<div class="faq_search" >
				
					<form action="cscenter_faq_search.jsp">
			
						<input type="text" name="faq_search_input" value=<%=faq_search %>>
  						<input type="submit" value="검색">
  					
  					</form>
  				
  				</div>
  				
  				<div class="faq_search_keyword">
  				<h1>인기키워드</h1>
  					<ul>
  						<li>#여행계약서</li>
  						<li>#비회원예약</li>
  						<li>#예약취소및환불</li>
  						<li>#예약변경</li>
  						<li>#예약확인</li>
  						<li>#인원추가</li>
  						<li>#환불규정</li>
  					</ul>
  				
  					
  				</div>
			
			</div>
			
			<script type="text/javascript">
			
				const keyword = document.querySelectorAll('.faq_search_keyword li');
	
				const searchInput = document.querySelector('input[name="faq_search_input"]');
				const form = document.querySelector('form');
	
				for (const li of keyword) {
				  li.addEventListener('click', () => {
				    const liText = li.textContent.replace('#', '');
				    searchInput.value = liText;
				    form.submit();
				  });
				}
				
			</script>

			<div class="board_wrap">
        
        <div class="board_list_wrap">
            <div class="board_list">
            
            <!-- 키워드 검색결과 몇 개  -->
           <p class="faq_result"><span style="color: #7E7DCB;"><%=faq_search %></span> 검색결과 총 <span style="color: #7E7DCB;"><%=faq_count %></span>개</p>

                <div class="top">
                 <!-- <div class="num">번호</div>
                 	<div class="num">번호</div>
                    <div class="title">제목</div> -->   
                </div>
			
			
		<div class="faq_list" >	
			
		<%
				

			
			%>
			
				<div class="faq_item">
					<div class="num"  ><%=faqArr.get(i).getFaq_num()%></div>
	                <div class="title"><%=faqArr.get(i).getFaq_title()%></div>
	            </div>
	                  
	            <div class="con_wrap" style="display: none;" >
	             	<div class="con" ><%=faqArr.get(i).getFaq_con()%></div>
	            </div>
			
			
			
			<% 
			
		%>
		
		</div>
	
				<script>
				$(document).ready(function() {
		            $('.faq_item .title').on('click', function() {
		                var $faqItem = $(this).parent();
		                var $conWrap = $faqItem.next('.con_wrap');

		                // 현재 클릭한 faq_item에 active 클래스 추가
		                $faqItem.addClass('active');

		                // 현재 열려있는 con_wrap 찾아서 닫기
		                $('.faq_item.active').not($faqItem).removeClass('active').next('.con_wrap').slideUp();

		                // 클릭한 title의 con_wrap 열기
		                $conWrap.slideToggle();
		            });
		        });
				  </script>
				  
				  </div>
                   
        </div>
        </div>
</div>
</section>


   <jsp:include page="footer.jsp"/>


</body>
</html>