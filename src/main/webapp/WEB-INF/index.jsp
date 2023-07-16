<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpringBoot Index</title>
<link rel="stylesheet" type="text/css" href="css/index.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
   <script src="js/slick-1.8.1/slick/slick.min.js"></script>
  <script src="js/header_menu.js"></script>
<script src="js/shopping_bn.js"></script>

</head>
<body>

    <jsp:include page="header.jsp" />

    <div id="section_wrap">
		<% String memid = (String)session.getAttribute("id"); %>
	<section>
	
		<div id="shopping_quickmenu_wrap" >
				<div class="s_quickmenu" >
<!-- 					<a href="shopping_cart_direct.do" ><img alt="cartimg" src="img/cart.png" style="width: 50px; height: 50px;" >장바구니</a> -->
					<a href="/cart/list?ID=<%=memid %>" onclick="gotologin()" ><img alt="cartimg" src="img/cart.png" style="width: 50px; height: 50px;" >장바구니</a>
				</div>
			
<!-- 				<div class="s_quickmenu"> -->
<!-- 					<a href="" ><img alt="hartimg" src="img/jim.png" style="width: 50px; height: 50px;" >찜 목록</a> -->
<!-- 				</div> -->
				
				<div class="s_quickmenu">
					<a href="shopping_prod_all.do" ><img alt="plusimg" src="img/plus.png" style="width: 50px; height: 50px;" >더보기</a>
				</div>
		</div>
		
		<script> //퀵메뉴 고정시키는 js.
		var shoppingQuickmenu = document.getElementById("shopping_quickmenu_wrap");
		var originalPosition = shoppingQuickmenu.offsetTop;

		window.addEventListener("scroll", function() {
		  var scrollPosition = window.scrollY;
		  
		  if (scrollPosition >= originalPosition) {
			  shoppingQuickmenu.classList.add("sticky");
			  shoppingQuickmenu.style.top = "180px";

		  } else {
		    shoppingQuickmenu.classList.remove("sticky");
		    shoppingQuickmenu.style.top = originalPosition + "px";
		  }
		});
		
		</script>
	
		 <div class="slideshow-container"> <!--광고배너 이미지 3개 -->

		     <div class="mySlideDiv fade active">
		        <a href="#"><img src="./img/shopping-banner1.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		         <a href="#"><img src="./img/shopping-banner2.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		        <a href="#"><img src="./img/shopping-banner3.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>

		     <a class="prev" onclick="prevSlide()">&#10094;</a>
		     <a class="next" onclick="nextSlide()">&#10095;</a>
            
		</div> <!--광고배너 이미지 3개 -->
		
		<!--  

			<div class="shopping_topmenu_wrap">
				<div id="shopping_topmenu" >
					<ul>
						<li>캐리어</li>
						<li>가방</li>
						<li>여행용품</li>
						<li>아울렛</li>
					</ul>
				</div>
			</div>
			
		--> 
			
			<div id="shopping_topmenu_wrap"  >
				<div id="shopping_topmenu" >
					<ul>
						<li>캐리어</li>
						<li>가방</li>
						<li>여행용품</li>
						<li>아울렛</li>
					</ul>				
				</div>
			</div>
			
			<script> //탑메뉴 색상 변경 js.
// 			const menu = document.querySelector('#shopping_topmenu_wrap');
// 			const menuHeight = menu.getBoundingClientRect().height;
	
// 			document.addEventListener('scroll', () => {
// 			  if (window.scrollY > menuHeight) {
// 			    menu.classList.add('active');
// 			    menu.style.top = "0px";
// 			  } else {
// 			    menu.classList.remove('active');
// 			    menu.style.top = menuHeight + "px";
// 			  }
// 			});
			</script>
			
			<script> //탑메뉴 고정시키는 js.
			var shoppingTopmenu = document.getElementById("shopping_topmenu_wrap");
			var originalPositionTop = shoppingTopmenu.offsetTop;
	
			window.addEventListener("scroll", function() {
			  var scrollPosition = window.scrollY;
			  
			  if (scrollPosition >= originalPositionTop) {
				  shoppingTopmenu.classList.add("sticky");
				  shoppingTopmenu.style.top = "0px";
	
			  } else {
				  shoppingTopmenu.classList.remove("sticky");
				  shoppingTopmenu.style.top = originalPositionTop + "px";
			  }
			});
			</script>
			
			<div id="allmenu"> <!-- 상품 전체 시작 -->

			<div id="hot_item"> <!-- hot item 시작 -->

				<p id="hot_txt">가장 먼저 살펴보세요</p>

				<div class="menu1">   <!--한줄-->
					<c:set var="start" value="1" />
					<c:set var="end" value="8" />

					<c:forEach var="vo" items="${vo}">
					<div id="prod_wrap" >
						<ul class="img_ul">
							<li><a href="/prod?prodNum=${vo.prodNum}">
							<img style="width: 240px; height: 240px;" 
							src="/img/${vo.prodImg}"></a></li>
						</ul>
						<ul class="info_ul">
							<li>${vo.prodName}
						</li></ul></div>
				</c:forEach>
				</div>
			</div>

				

			<div id="mid_bn_wrap">  <!-- 중간 배너 -->

				<div id="mid_bn1">
					<a href="#"><img src="./img/shopping-bn1.jpg" style="width: 690px; height: 270px;"></a>
				</div>

				<div id="mid_bn2">
					<a href="#"><img src="./img/shopping-bn2.jpg" style="width: 690px; height: 270px;"></a>
				</div>
			</div>
			
			<!-- //////////////뉴아이템 이 사이에 넣으면됨 //////////////////////////////////////////////////// -->

			<div id="new_item">  <!-- new item 시작-->

	            <p id="new_txt">이번 주에 새로 들어왔어요</p>
	         
	            
         </div>   <!-- new item 끝-->
			

			<!-- ////////////////////////////////////////////////////////////////// -->

			<div id="only_item">
				<p id="only_txt">오직 It Travel에서만 만나볼 수 있어요</p>
				<div id="menu1_only">
					<ul class="img_ul" >
						<li id="only_img_1">
							<a href="#"><img style="width: 600px; height: 690px;" src="./img/shopping-only-prod1.jpg"></a>
							<!-- <a href="#"><img style="width: 600px; height: 350px; float: right;" src=".\10d6489541c62552c1e9dc8734adb08a.jpg"></a> -->
						</li>
						<div id="only_img_4"> 
							<li class="only_img_4" >
								<a href="#"><img id="only_img_4_img1" src="./img/shopping-only-prod2.jpg"></a>
							</li>
							<li class="only_img_4">
								<a href="#"><img id="only_img_4_img2" src="./img/shopping-only-prod3.jpg"></a>
							</li>
							<li>
								<a href="#"><img style="width: 660px; height: 330px; float: right;" src="./img/shopping-only-prod4.jpg"></a>
							</li>
						</div>
					</ul>
				</div>
			</div>

				<!-- /////////////////////////////2번째 광고 배너 -->
				
			<div id="banner2">

				  <ul class="slider">
					    <li>
					    	<a href="#"><img style="width: auto; height: 200px;" src="./img/midbn5.jpg"></a>
					    </li>
					    <li>
					    	<a href="#"><img style="width: auto; height: 200px;" src="./img/midbn6.jpg"></a>
					    </li>
					    <li>
					    	<a href="#"><img style="width: auto; height: 200px;" src="./img/midbn7.jpg"></a>
					    </li>
				   <!--  <li>
				      <a href="#"><img style="width: 1920px; height: 200px;" src=".\midbn4.jpg"></a>
				    </li> -->
				  </ul>
				
				<!--   <div class="btn">
				
				    <button type="button" id="prev"><</button>
				    <button type="button" id="next">></button>
				  </div> -->


		</div>	<!-- /////////////////////////////2번째 광고 배너 -->

	</div>	<!-- 상품 전체 끝 -->
			<div id="curation_item">

				<p id="curation_txt">고객님을 위한 It Travel 추천상품</p>
			
				<div class="menu3">
				
				
					<!-- curaionitem끝 -->
			<!-- ////////////////////////////////////// -->
			
				</div>
			</div>
		 <!-- allmenu 끝-->
	</section>
	
	</div>
    
    <%
        
    %>
    <a href="/signup">회원가입</a>
    <a href="/login">로그인</a>
    ${test}

    <jsp:include page="footer.jsp" />
</body>
</html>