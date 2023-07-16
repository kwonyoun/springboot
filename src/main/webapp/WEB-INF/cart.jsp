<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>장바구니</title>
 
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	 
	<link rel="stylesheet" type="text/css" href="/css/header_footer.css">
	<link rel="stylesheet" type="text/css" href="/css/shopping_cart.css">
	 
	 <!-- 헤더 js -->
	<script src="/js/slick-1.8.1/slick/slick.min.js"></script>
    <script src="/js/header_menu.js"></script>

</head>

<body>

<!--헤더부분-->
	   <jsp:include page="header.jsp" />
	
	<section>

		<div id="s_order" >
			<ul>
				<li>01장바구니</li>>
				<li>02주문서작성/결제</li>>
				<li>03주문완료</li>
			</ul>		
		</div>
		<!-- 		결제순서 끝	  -->
		
		<form action="shopping_buy.do">
		
		<table>
		
			<tr id="s_basket" >
					<th><input type="hidden" >  </th>
					<th><input type="checkbox" class="cart_checkbox_all" id="cart_checkbox_all" ></th>
					<th>상품</th>
					<th>옵션</th>
					<th>상품금액</th>
					<th>수량</th>
					<th>할인/적립</th>
					<th>합계금액</th>
					<th>전체삭제</th>
			</tr>            

				<input type="hidden" class="shopBasNumInput" name="shop_bas_num" value="" style="width: 50px;" >
		 		<input type="hidden" name="shop_bas_prod_num" value="" style="width: 50px;" >
                <input type="hidden" name="prod_name" value="" style="width: 70px;" >
                <input type="hidden" name="prod_quantity" value="" style="width: 50px;"  > 
                <input type="hidden" name="prod_price" value="" style="width: 50px;"  >
                <input type="hidden" name="prod_mem_id" value="" style="width: 50px;" >
                <input type="hidden" name="mem_name" value="" style="width: 50px;" >

			<c:forEach var="list" items="${cartlist}" >

            <tr class="s_basket_prod">
            
                <td></td>
                <td><input type="checkbox" class="cart_checkbox" id="cart_checkbox" value="${list.cartProdPri}"></td>
                <td>${list.prodName}</td>
                <td>옵션</td>
                <td>${list.cartProdPri}</td>
                <td><div class="prod_qnt" >
                <input type="hidden" class="shopBasNumInput" name="shop_bas_num" value=${list.cartNum}>
					<select class="quantitySelect" onchange="handleQuantityChange(this)">
					    
					</select>

                <input type="hidden"value=""> <!-- for문의 i 번호 넘김--> 
               	<input type="hidden" value="">
            <script>
            function handleQuantityChange(selectElement) {
                
                $(function(){
                var shopBasNum = $(selectElement).prev().val(); //input name="shop_bas_num"의 value
                var selectedValue = selectElement.value; //select의 value
                var for_num = $(selectElement).next().val(); // 장바구니의 일련번호인데, 몇번째 순서의 장바구니냐 의 순서 i이다.
                var prod_price = $(selectElement).next().next().val(); //value prod_price
                //for문의 i번호를 받아둠
            //     alert(selectedValue);
            //     alert(shopBasNum);
                updateQuantity(shopBasNum, selectedValue, for_num, prod_price);
                })
            	location.reload();
            }
            
            function updateQuantity(shopBasNum, selectedValue, for_num, prod_price) {
            	
                $.ajax({
                    url: "shopping_cart_quantity.do?shop_bas_num="
                   		+shopBasNum+"&shop_bas_prod_quantity="
                   		+selectedValue+"&shop_bas_price="
                   		+prod_price,
                   method: "POST",
                   success: function(response) {},
                   error: function(xhr, status, error) {
                       console.log("error"+error);
                   }
               });
                
                document.getElementById("total_modify"+for_num).innerHTML = selectedValue*prod_price;
                alert("수량이 변경되었습니다.");
                
            }
            </script>
            <input type="hidden" 	id="quantityInput" name="prod_quantity" value="" />
                </div> 
                </td>
                
                <td>할인/적립</td>
                <td><div id="total_modify">${list.cartProdPri}*${list.cartProdQaun}</div></td>
                
                <td>
                    <a href="/cart/delete?cartnum=${list.cartNum}&ID=${list.cartMemId}" 
                    onclick="return confirm('해당 제품을 삭제하시겠습니까?')">삭제</a>
                </td>
            
        </tr>
    </c:forEach>
	</table>
    
    <div id="shopping_total_price_info_wrap" >
    
        <div class="shopping_total_price_info" >
            <div class="total_price_info" >총 판매가:   <span id = "total_pr1">0</span>원</div>
            
            <div class="total_price_info" >총 할인금액</div>
            
            <div class="total_price_info" ><span>배송비</span>
            		<span id="shippingfee" >3000</span>
           </div>
        </div>
            
        <div class="sum_price" >
            <span style="font-size: 20px;" >배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span>
            
            <span id="total_price" style="font-size: 18px;" >총 결제예상금액 : <span id = "total_pr">0</span>원

            
             </span> 
        </div>
            
		<div id="order_btn_wrap" >
			<button type="submit" >선택주문(<span id="checked_count">0</span>)</button>
			<button>전체주문</button>
		</div>
		
	</div>
	
</form>
	
</section>
	
	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
	
</body>

</html>