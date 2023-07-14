
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A 수정하기</title>
    <link rel="stylesheet" href="/css/header_footer.css">
    <link rel="stylesheet" href="/css/css.css">
    <link rel="stylesheet" href="/css/cscenter.css">
    <link rel="stylesheet" href="/css/cscenter_qna.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
   <script src="/js/slick-1.8.1/slick/slick.min.js"></script>
   <script src="/js/header_menu.js"></script>
</head>

<body>

 <jsp:include page="header.jsp" />

<section style="height: 700px;">
<form action="/cscenter/qna/edit" method="post" >
    <div class="board_wrap">
        <div class="board_title">
            <strong>문의 수정하기</strong>

        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <input type="text" value=${vo.qnaNum} name="qnaNum" hidden="hidden">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input name="qnaTitle" type="text" value=${vo.qnaTitle} class="title"></dd>
                    </dl>
                </div>
                
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input name="qnaMemId" id="qnaMemId" type="text" value=${vo.qnaMemId} class="writer" readonly="readonly" onselectstart="return false;" onmousedown="return false;"></dd>
                    </dl>
                    
                </div>
                
                <div class="cont">
                    <textarea  name="qnaCon">${vo.qnaCon}</textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="수정">
                <a href="cscenter_qna_view.jsp">취소</a>
            </div>
        </div>
    </div>
   </form>
   
   </section>

    	<jsp:include page="footer.jsp"/>
   
</body>
</html>