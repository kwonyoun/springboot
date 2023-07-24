<%@ page contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <title>공지사항</title>
    <link rel="stylesheet" href="/css/css.css">
    <link rel="stylesheet" href="/css/cscenter.css">
    <link rel="stylesheet" href="/css/header_footer.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
   <script src="/js/slick-1.8.1/slick/slick.min.js"></script>
   <script src="/js/header_menu.js"></script>
</head>
<body>

 <jsp:include page="header.jsp" />


	<section style="height: 700px">
    <div class="board_wrap">
        <div class="board_title">
        
            <h2>공지사항 입력</h2>

        </div>

        
        <form action="/cscenter/notice/wirte" method="post">
        
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="not_title" required="required" ></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" value="관리자" name="not_writer" readonly="readonly" ></dd>
                    </dl>

                </div>
                
                <div class="cont">
                    <textarea placeholder="내용 입력" name="not_con" required="required"  ></textarea>
                </div>
            </div>
            
            <div class="bt_wrap">           
                <input class="on" type="submit" value="등록">      
                
            </div>
            
        </div>
        </form>
    </div>
   
    </section>
    
    <footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
    

    
</body>
</html>