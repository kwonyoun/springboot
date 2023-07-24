
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/cscenter.css">
    
    <style type="text/css">
    
	    section .cscenter_menu_wrap .cscenter_menu:first-child {
	      background-color: rgba(126, 125, 203, 0.26);
	      border-radius: 10px;
	    }
	    
	    section .cscenter_menu_wrap .cscenter_menu:nth-child(2), .cscenter_menu:nth-child(3) {
	      background-color: #f6f6f6;
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
		
		section#pageList{
	display: flex;
	justify-content: center;
	height: 80px;
	line-height: 80px;
	margin: 0 auto;
	font-size: 1.4em;
}

section#pageList a:hover {
	color: blue;
	font-weight: bold;
}
		
    </style>
    
</head>

<body>

   <jsp:include page="header.jsp" />

<section>

	<div class="cscenter" >

			<div class="cscenter_menu_wrap" >
			
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p style="margin-left: 30px;" ><a href="/csNotice" >공지사항</a></p>
						</div>	
						
						<div class="triangle"></div>
					
					</div>
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="/cscenter">자주하는 질문</a></p>
						</div>
					
					</div>  
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="/cscenter/qnalist">직접 문의하기</a></p>

						</div>

					</div>
				
				</div>
							
		</div>


    <div class="board_wrap">
        <div class="board_title">
            <h1 style="font-size: 40px;" >NOTICE</h1>
			<h3 style="font-size: 20px;">공지사항</h3> 
        </div>
        
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                
               
                <div >
              
                    <div class="num"></div>
                    <div class="title"><a href=""></a></div>
                    <div class="writer"></div>
                    <div class="date"></div>
                    <div class="count"></div>
                    
                </div>
                
            </div>

            
       
            <div class="bt_wrap">
                <a href="/csNotice/wirte" class="on">등록</a>
                <!--<a href="#">수정</a>-->
            </div>
            
            
        </div>
    </div>
    </section>
    
    <footer>
   <jsp:include page="footer.jsp"/>
	</footer>
	
</body>
</html> 