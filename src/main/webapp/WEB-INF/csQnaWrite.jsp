<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link rel="stylesheet" href="/css/header_footer.css">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/cscenter.css">	
<link rel="stylesheet" href="css/cscenter_qna.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
<script src="/js/slick-1.8.1/slick/slick.min.js"></script>
<script src="/js/header_menu.js"></script>
</head>
<body>
	<!-- 게시판 등록 -->

 <jsp:include page="header.jsp" />

 
<%
		request.setCharacterEncoding("utf-8"); 
        
        String memid = (String)session.getAttribute("id"); //session으로 가져오면 무조건 String으로 받으로 형변환해야 한다.
        													//리턴값을 오브젝트로 받기 때문이다. 오브젝트는 int와 String를 받을 수 있기 때문에 정확히 변수의 타입을 확실히 정해주어야한다.             													
        if(memid==null) {
        	%>
        	<script>
			    alert("로그인을 해주세요.");
			    location.href = "/login";
			</script>
        	<% 
        } else{
        }
        %>

	<section>
	
	<div id="cs_qna_wrap" >
		<h2>직접 문의하기</h2>
		<form action="/cscenter/qna/write" method="post" name="boardform">
			
			<table>
			
				<tr>
					<td class="td_left">카테고리 설정</td>
					
					<td class="td_right">
					
						<select name="qnaFil" id="qna_fil" required="required">
							<option>select</option>
							<option>문의내용 선택</option>
							<option>항공예약</option>
							<option>투어예약</option>
							<option>쇼핑</option>
							<option>교환/환불</option>
							<option>기타</option>							
						</select>
					</td>
				</tr>

				<tr>
					<td class="td_left"><label for="BOARD_SUBJECT">제 목</label></td>
					<td class="td_right">
						<input name="qnaTitle" type="text"	id="qna_title" required="required" />
					</td>
				</tr>
				
				<tr>
					<td class="td_left"><label for="BOARD_CONTENT">내 용</label></td>
					
					<td><textarea name="qnaCon" id="qna_con" cols="40" rows="15" required="required"></textarea></td>
				</tr>
				
				<tr>
					<td class="td_left"><label for="BOARD_FILE"> 파일 첨부 </label></td>
					
					<td class="td_right">
						<input name="qnaImg" type="file" id="qna_img" />
					</td>
				</tr>
				
				<tr>
					<td class="td_left"><label for="BOARD_FILE"> 공개여부 </label></td>
					
					<td class="td_right">
						<input name="qnaOpen" type="radio"	id="qna_public" value="public" style="width: 30px;" /><label style="margin-right: 50px;" >public</label>
						<input name="qnaOpen" type="radio"	id="qna_private" value="private" style="width: 30px;" /><label>private</label>
					</td>
				</tr>
				
			</table>
			
			<section id="commandCell">
			
				<input type="submit" value="등록">
				
			</section>
			
		</form>
		
		</div>
	</section>
	<!-- 게시판 등록 -->
	
 <jsp:include page="footer.jsp" />

</body>
</html>