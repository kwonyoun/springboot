<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 제품 상세 페이지</title>
<link rel="stylesheet" type="text/css" href="css/shopping_prod.css">

</head> 

<body>

	<jsp:include page="header.jsp" />
	
<section>

	<button onclick="scrollToTop()" id="scroll-to-top-button">Top</button>

	<script>
		//상단으로 이동
		function scrollToTop() {
			window.scrollTo({
				top: 0,
				behavior: "smooth"
			});
		}
		
		function toggleScrollButton() {
			if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
				
				document.getElementById("scroll-to-top-button").style.display = "block";
			} else {
	  			document.getElementById("scroll-to-top-button").style.display = "none";
			}
		}
		
			window.onscroll = function() {
				toggleScrollButton();
			}
			toggleScrollButton();
	</script>	


<div id="s_order_wrap" >
	<div class="s_prod_wrap">
	
		<div class="img_wrap">
			<div id="s_prod_detail_img_wrap" >
			
				<div class="s_prod_detail_img" >
					<img style="width: 100px; height: 100px;" src="img/${vo.prodImg}">
				</div>
				

				
				<div class="s_prod_detail_img" >
					<img style="width: 100px; height: 100px;"src="img/${vo.prodImg}" >
				</div>

				
			</div>
			
			<div id="s_prod_big_img" >
				<img style="width: 500px; height: 500px;" src="img/${vo.prodImg}">
				<div id="square"></div>
			</div>
		</div>
		
		<div class="prod_info_wrap" >
		
			<div class="info_heading_wrap" >
			 
				<div class="info_heading_desc">
				
	 				<input class="input-border-none" name="prod_bigct" value="${vo.prodBigct}" readonly="readonly" > 
<!-- 				 >  -->
	 				<input class="input-border-none" name="prod_smallct" value="${vo.prodSmallct}" readonly="readonly" >
				</div> 
				 
				<h2><input class="input-border-none" id="prod_name" name="prod_name" value="${vo.prodName}" readonly="readonly" > </h2>
				
				<div class="info_heading_desc" style="font-style: inherit; font-size: smaller;" ></div>
		
			</div>
			
			
			
			<form action="/cart" id ="myForm" >  

				<% String memid = (String)session.getAttribute("id"); %>
			
				<input type="hidden" name = "prodMemId" value = "" >
				<input type="hidden" name = "prodNum" value = "${vo.prodNum}">
				<input type="hidden" name = "prodImg" value ="${vo.prodImg}" >
				<input type="hidden" name = "prodOpbct" value ="" >
				<input type="hidden" name = "prodOpsct" value ="" >
			
			<table>
				<tr>
					<th><%= "&#8361;" %></th>
					
					<td>
						<span>
							<input class="input-border-none" id="prod_price" name="prodPrice" value="${vo.prodPrice}" readonly="readonly" >
						</span>
					</td>
					
				</tr>
			</table>

			<div class="total_prod_wrap">
			
				<p id="prod_name2" ></p>
				
				<div id="quantity_wrap">
				
					<input type="text" id="quantity" class="qunt_up" name="prodQuantity" value="1" min="1">
					
						<div id="count_btn_wrap" >
							<a href="#" onclick="increaseQuantity(event)">
							  <img src="/img/btn_count_up.gif">
							</a>
							
							<a href="#" onclick="decreaseQuantity(event)">
							  <img src="/img/btn_count_down.gif">
							</a>

						</div>
				</div>
			</div>

			<div class="total_price_wrap">
				<div id="total_price">
				
					<input class="input-border-none" id="prod_total_price" name="prodTotalPrice" value="TOTAL" readonly="readonly" > 
				</div>
			</div>

			<script>
			
				function increaseQuantity(event) {
					  event.preventDefault(); // 기본 동작 취소
					  var quantityInput = document.getElementById("quantity");
					  var currentQuantity = parseInt(quantityInput.value);
					  if (currentQuantity < 10) {
						    quantityInput.value = currentQuantity + 1;
						    updateTotalPrice();
						  } else {
						    alert("최대 주문 수량은 10개입니다.");
						  }
				}

				function decreaseQuantity(event) {
				  event.preventDefault(); // 기본 동작 취소
				  var quantityInput = document.getElementById("quantity");
				  var currentQuantity = parseInt(quantityInput.value);
				  if (currentQuantity > 1) {
				    quantityInput.value = currentQuantity - 1;
				    updateTotalPrice();
				  } else {
				    alert("최소 주문 수량은 1개입니다.");
				  }
				}
				
// 				//수량증가감소해야지 쉼표가 생겨서, 화면 들어오자마자 바로 쉼표 설정해주는 거 따로 추가했음.
// 				window.onload = function() {
// 					  var prodPrice = document.getElementById("prod_price").value;
// 					  var formattedProdPrice = numberWithCommas(parseFloat(prodPrice));
// 					  var totalPrice = "TOTAL" + "₩" + formattedProdPrice;
// 					  document.getElementById("prod_price").value = formattedProdPrice;
// 					  document.getElementById("prod_total_price").value = totalPrice;
// 					}
				
// 				//이게 쉼표넣을 자릿수 설정해주는 거. 위 window.onload랑 같이 있어야 작동하는 듯. 
// 				function numberWithCommas(x) { 
// 					  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 					}
				
				//total_price 쉼표 넣어주는 것.
 				function updateTotalPrice() {
// 				    var prodPrice = parseFloat(document.getElementById("prod_price").value.replace(",", ""));
					var prodPrice = document.getElementById("prod_price").value;
 				    var quantity = document.getElementById("quantity").value;
				    var totalPrice = prodPrice * quantity;
				    
 				    //document.getElementById("prod_total_price").value = "TOTAL₩" + totalPrice.toLocaleString();
 				    document.getElementById("prod_total_price").value = "TOTAL₩" + totalPrice;
 				  }
				
			</script>

			
			<div class="prod_button" >
			
			<!--	 <a href="shopping_cart.do?prod_num=" class="prod_cart" >장바구니</a>   --> 
				
			<!--  	<a href="shopping_cart.do" class="prod_cart" > 
					<input id="add-to-cart-btn" class="input-border-none" type="submit" value="여기 장바구니"  >
					
				</a>    --> 	
				
					<input type="submit" value="장바구니에 담기" onclick="showModal()" style="width: 48%; " >
					
					<div id="modal" style="display: none;">
					  <p>장바구니에 추가하였습니다.</p>
					  <button onclick="closeModal()">쇼핑 계속하기</button>
					  <button onclick="goToCart()">장바구니로 이동</button>
					</div>
					
	<!-- 				<input id="add-to-cart-btn" class="" type="submit" value="장바구니 추가" onclick="showPopup()" > -->
									
				<script>
				  function showModal() {
					  alert(아아아알럿);
				    var modal = document.getElementById('modal');
				    modal.style.display = 'block';
				    
				    return false;
				  }
				  
				  function yourFunction(){
					submitForm();  
					  return true;
				  }
				  
				  function submitForm(){
					  var form = document.getElementById("myForm")
					form.submit();
				  }
				
				  function closeModal() {
				    var modal = document.getElementById('modal');
				    modal.style.display = 'none';
				  }
				
				  function goToCart() {
				    window.location.href = 'shopping_cart.do';
				  }
				</script>
				
				<a href="#" onclick="buyProduct()"  class="prod_buy" >구매하기</a>

				
			</div>
			</form>
			
			<div class="ec-base-button" >
			
<!-- 				<div id="kakao_checkout_button" > -->
					
<!-- 					<div class="__checkout_buy_contents"> -->
      
<!-- 					  <span class="__checkout_img_comm __checkout_buy_title"> -->
<!-- 					    구매와 관리를<br>톡으로 간편하게 -->
<!-- 					  </span> -->
					
					      
<!-- 					  <button type="button" class="__checkout_btn_buy "  onclick="openPopup()" > -->
<!-- 					    <span class="__checkout_img_comm __checkout_img_buy"> -->
					    
<!-- 					      <img alt="kakaopay" src="shopimg/kakaopay_img.jpg" style="width: 60px; height: 40px;" > -->
<!-- 					    </span> -->
<!-- 					  </button> -->
					  
<!-- 					  <script> -->
<!-- // // 						function openPopup() { -->
<!-- // // 							var url = "http://wepplication.github.io/tools/barcodeGen/"; -->
<!-- // // 							var width = 500; -->
<!-- // // 							var height = 500; -->
<!-- // // 							var left = 0; -->
<!-- // // 							var top = 0; -->
<!-- // // 							window.open(url, '_blank', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=' + width + ', height=' + height + ', top=' + top + ', left=' + left); -->
<!-- // // 						} -->
<!-- 						</script> -->
						
						
						
						
					
					      
<!-- 					  <button type="button" class="__checkout_btn_wish "> -->
<!-- 					    <span class="__checkout_img_comm __checkout_img_wish">찜</span> -->
<!-- 					  </button> -->
					
<!-- 					</div> -->
					
<!-- 				</div>		 -->
				
<!-- 				<div id="naver_checkout_button"	> -->
				
<!-- 				</div> -->
				</div>
					
				</div>		
		
		</div>
		
	</div>
	
	

<!-- -------------------- prod_additional 시작---------------------------- -->

	
	
	<div id="prod_additional">
	
		<div class="prod_detail_tab" id="myList1">
			<ul class="myList"  >
				<a href="#myList1"><li style="border-top: 2px solid #000;" >상품이미지</li></a>
				<a href="#myList2"><li>Q&A(리스트)</li></a>
				<a href="#myList3"><li>REVIEW</li></a>
			</ul>
		
		<div class="prod_detail_content" id="prod_img">
		
			<div class="info_img_wrap" >
				<img src="shopimg/prod_detail_img1.jpg" style="margin: 0 auto;" >
			</div> 
			
		</div>
		</div>
			
		<div class="prod_detail_tab" id="myList2">
			<ul class="myList" >
				<a href="#myList1"><li>상품이미지</li></a>
				<a href="#myList2"><li style="border-top: 2px solid #000;">Q&A()</li></a>
				<a href="#myList3"><li>REVIEW</li></a>
			</ul>
		
			<div class="prod_detail_content" id="prod_qna">
			
				<div id="prod_qna_wrap" >
	 	        	<div class="board_list_wrap">
	 	        	
			            <div class="board_list">
			            
				            <div class="bt_wrap">
			                	<a href="prod_qna_write.do" class="on" style="margin-top: 50px;" >등록</a>
			                <!--<a href="#">수정</a>-->
			            	</div>
			            	
			                <div class="top">
			                
			                 <!-- <div class="num">번호</div> -->   
			                 	<div class="num">카테고리</div>
			                    <div class="title">제목</div>
			                    <div class="writer">질문자</div>
			                    <div class="count">답변상황</div>
			                    <div class="date">문의일</div>
			                </div>
			               
			                <div >
			                
			                </div>
			                
			            </div>
	            
	        		</div>
				 	
				 </div>		
				 
			</div>
		</div>
		
			
		<div class="prod_detail_tab" id="myList3"		>
			<ul class="myList" >
				<a href="#myList1"><li>상품이미지</li></a>
				<a href="#myList2"><li>Q&A()</li></a>
				<a href="#myList3"><li style="border-top: 2px solid #000;">REVIEW</li></a>
			</ul>
		
		<div class="prod_detail_content" id="prod_review">
			<div id="prod_review_wrap">
				여기에 리뷰 리스트 나와야함
				
				
			</div>
		</div>
		</div>
	  
</div>


<!-- -------------------- prod_additional 끝 ---------------------------- -->

</div>



</section>

<footer>
<jsp:include page="footer.jsp" />
</footer>

</body>

					
				
</html>