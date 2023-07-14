<%@ page contentType="text/html; charset=UTF-8" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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

<section style="height: 700px">
    <div class="board_wrap">
        <div class="board_title">
            <h2>직접 문의하기</h2>
        </div>
        <div class="board_view_wrap">
        
        <form action="/cscenter/qna/edit">
            <div class="board_view">
                <input name="qnaNum" hidden="hidden" value=${vo.qnaNum} >
                <div class="title">
                    <input type="text" value=${vo.qnaTitle} name="qnaTitle" readonly="readonly" id="n_view_title" onselectstart="return false;" onmousedown="return false;" >
                </div>           
                
                <div class="info">

                    <dl>  

                        <dd><input type="text" value=${vo.qnaMemId} name="qnaMemId" readonly="readonly" onselectstart="return false;" onmousedown="return false;"></dd>
                    </dl>
                    
                    <dl>

                        <dd><input type="text" value=${vo.qnaDate} name="qnaDate" readonly="readonly" onselectstart="return false;" onmousedown="return false;"></dd>
                    </dl>

                    
                </div>
                
                <div class="cont">
                    <input type="text" value=${vo.qnaCon} name="qnaCon" readonly="readonly" onselectstart="return false;" onmousedown="return false;">
                </div>
            </div>

            <div class="qna_re" >
            
            <div class="board_title">
	            <h2>답변</h2>
	        </div>

            </div>
           
            <div class="bt_wrap">
                <a href="/cscenter/qnalist" class="on">목록</a>
                <a href="/cscenter/qna/edit?qnaNum=${vo.qnaNum}"><input type="button" value="수정" style="width: 100px;" height="42px;"></a>
            	<a href="/cscenter/qna/delete?qnaNum=${vo.qnaNum}"><input type="button" value="삭제" style="width: 100px;"></a>
            </div>
            
            </form>
            
        </div>
    </div>
    </section>

    	<jsp:include page="footer.jsp"/>

</body>
</html>