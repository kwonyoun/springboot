
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>

<link rel="stylesheet" href="/css/shopping_order.css">
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	

	//결제 요청하기
	function requestPay() {
		//객체 초기화하기
		IMP.init("iamport"); // 예: imp00000000a
		IMP.request_pay({
			pg: "inicis", //inicis로 하기,,
			pay_method: "card",
			merchant_uid: 'merchant_'+new Date().getTime(),   // 주문번호
			name: "test",
			amount: 1,                         // 숫자 타입
			buyer_email: "gildong@gmail.com",
			buyer_name: "홍길동",
			buyer_tel: "010-4242-4242",
			buyer_addr: "서울특별시 강남구 신사동",
			buyer_postcode: "01181"
		}, function (rsp) { // callback
			if ( rsp.success ) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		//rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		},
		

		
		);

		IMP.request_pay({ /** 요청 객체를 추가해주세요 */ },
		rsp => {
			if (rsp.success) {   
			// axios로 HTTP 요청
			axios({
				url: "/requestpay",
				method: "post",
				headers: { "Content-Type": "application/json" },
				data: {
				imp_uid: rsp.imp_uid,
				merchant_uid: rsp.merchant_uid
				}
			}).then((data) => {
				// 서버 결제 API 성공시 로직
			})
			} else {
			alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
			}
		});


	}
</script>

</head>

<body>

	   <jsp:include page="header.jsp" />

<section>


		<div id="shopping_buy_wrap" >
			<div id="s_order" >
				<ul>
					<li>01장바구니</li>>
					<li>02주문서작성/결제</li>>
					<li>03주문완료</li>
				</ul>
			</div>
	        
	        <div id="shopping_pay_wrap">
				<div id="order_list_wrap" >
				
					<div id="order_list_title" >
						<h2>배송 상품</h2>
					</div>
					
					<div id="order_list_con" >
						<table class="order_list_table" >
							<colgroup>
								<col width="80px" >
								<col width="100px" >
								<col width="120px" >
								<col width="120px" >
								<col width="120px" >
							</colgroup>
							
							<thead>
								<tr>
									<th scope="col" colspan="2" >상품정보</th>
									<th scope="col" >판매가</th>
									<th scope="col" >수량</th>
									<th scope="col" >구매가</th>
								</tr>
							</thead>
							<tbody>					
											
								<tr>
									<td><img style="width: 95px; height: 85px; text-align: left; " alt="prod_img" src="img/${ProdVO.prodImg}"></td>
									<td></td>
									<td>${ProdVO.prodPrice}</td>
									<td>${ordQuan}</td>
									<td></td>
								</tr>

							</tbody>
						</table>				

						
					</div>
				</div>
						
				<div id="order_addr_wrap">
					<div id="order_addr_title">
						<h2>배송지 정보</h2>
					</div>
					<div id="order_addr_con">
						<table class="shopping_addr_info">
							<tr>
								<th>배송지선택</th>	
								<td>
									<label>
										<input type="radio" id="existing_addr" name="mem_addr" onchange="selectAddr()">기존 배송지</label>
											
				<select id="newAddrSelect" >
				
					        <option id="optionValue" class="shop_new_addr_remark" 
					        value="">
					        </option>

				</select>
				
				<script>
	            $(function(){
	                      $('#newAddrSelect').on("change",function(){
	                         var option = $(this).val(); //<select>태그 내에서 선택된 옵션의 값을 가져옴
	                         var id = document.getElementById("mem_id").value; //로그인된 아이디 가져옴

	                         $.ajax({
	                               url: "shoppingSelectOption.do" ,//아래 data 지우고 url?id=id&remark=option 이런식으로 써도 됨
	                               type: 'POST',
	                               async: false,
	                               data: { id: id, remark: option },
	                               success: function(response) {
	                                  re = response.trim();
	                               },
	                               error: function(error) {
	                                  alert(error);
	                               }
	                               });
	                         //re의 값이 
	                         // mem_name/mem_mobile1/mem_mobile2/mem_mobile3/sample6_postcode/....이하생략
	                         //이런식으로 받아왔을 경우

	                         var remark = re.split("/");
	                          document.getElementById("mem_name_input").value = remark[2];
	                          document.getElementById("mem_mobile1_input").value = remark[7];
	                          document.getElementById("mem_mobile2_input").value = remark[8];
	                          document.getElementById("mem_mobile3_input").value = remark[9];
	                          document.getElementById("sample6_postcode").value = remark[3];
	                          document.getElementById("sample6_address").value = remark[4];
	                          document.getElementById("sample6_detailAddress").value = remark[5];
	                          document.getElementById("sample6_extraAddress").value = remark[6];
	                          
// 	                          alert(remark[0]);
// 	                          alert(remark[1]);
// 	                          alert(remark[2]);
// 	                          alert(remark[3]);
// 	                          alert(remark[4]);
// 	                          alert(remark[5]);
// 	                          alert(remark[6]);
// 	                          alert(remark[7]);
// 	                          alert(remark[8]);
// 	                          alert(remark[9]);
// 	                          alert(remark[10]);

	                         });
	            })

				</script>
				
								
								<label><input type="radio" id="new_addr" name="mem_addr">신규 배송지 설정</label>
							</td>
						</tr>

						<tr>
							<th>받는 분</th>
							<td><input type="text" name="mem_name" id="mem_name_input"
								value="${memVO.memName}"> <input type="checkbox" 
								id="same_as_orderer" onchange="toggleInput()">주문자와 동일 
							</td>
						</tr>

						<tr>
							<th>연락처</th>
							<td><input type="text" name="mem_mobile1" id="mem_mobile1_input"
								class="ord_mobile_size" value="${memVO.memMobile1}"> -
								<input type="text" name="mem_mobile2" class="ord_mobile_size" id="mem_mobile2_input"
								value="${memVO.memMobile2}"> - <input type="text"
								name="mem_mobile3" class="ord_mobile_size" id="mem_mobile3_input"
								value="${memVO.memMobile3}"></td>
						</tr>

						<tr>
							<th>주소</th>
							<td><input type="text" name="mem_addr1"
								id="sample6_postcode" placeholder="우편번호" size="35" readonly
								value="${memVO.memAddr1}"> <input type="button"
								onclick="sample6_execDaumPostcode()" name="" value="우편번호 검색"
								style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px; height: 30px;
 										border-style: none;"><br>

								<input type="text" name="mem_addr2" id="sample6_address"
								placeholder="주소" name="address" size="35"
								style="margin-top: 3px" value="${memVO.memAddr2}" readonly><br>
								<input type="text" name="mem_addr3" id="sample6_detailAddress"
								placeholder="상세주소" style="margin-top: 3px" size="16"
								value="${memVO.memAddr3}"> <input type="text"
								name="mem_addr4" id="sample6_extraAddress" placeholder="참고항목"
								size="15" style="margin-top: 3px" value="${memVO.memAddr4}">
								
								<input type="button" id="save_button" onclick="newAddrInput()" value="신규 배송지 저장" >
								<input type="text" id="addrName" value="" placeholder="배송지명 키워드를 입력해주세요." >
							</td>

							<td></td>
						</tr>
						</table>
								

								
<script>
function newAddrInput() {
	
    $(function() {
        var memId = $("#mem_id").val();
        var newName = $("#mem_name_input").val();
        var newMobile1 = $("#mem_mobile1_input").val();	
        var newMobile2 = $("#mem_mobile2_input").val();
        var newMobile3 = $("#mem_mobile3_input").val();
        var newAddr1 = $("#sample6_postcode").val();
        var newAddr2 = $("#sample6_address").val();
        var newAddr3 = $("#sample6_detailAddress").val();
        var newAddr4 = $("#sample6_extraAddress").val();
        var addrName = $("#addrName").val();

        var newAddr = {
            memid: memId,
            name: newName,
            mobile1: newMobile1,
            mobile2: newMobile2,
            mobile3: newMobile3,
            addr1: newAddr1,
            addr2: newAddr2,
            addr3: newAddr3,
            addr4: newAddr4,
            addrName: addrName
        };
        inputNewAddr(newAddr);
    });
}

				function inputNewAddr(newAddr) {
					
					
				    $.ajax({
				        url: "shopping_new_addr.do", 											// 수량을 업데이트하는 JSP 페이지 경로
				        method: "POST",
				        data: newAddr, 															// newAddr 객체를 데이터로 전달
				        success: function(response) {
				        },
				        error: function(xhr, status, error) {
				            console.log("error=====" + error);
				            
				            
				        }
    });
    location.reload();
    alert("새로운 배송지가 저장되었습니다.");
}
</script>

<script>
// function inputNewAddr(newAddr) {
//     $.ajax({
//         url: "shopping_new_addr.do", // 수량을 업데이트하는 JSP 페이지 경로
//         method: "POST",
//         data: newAddr, // newAddr 객체를 데이터로 전달
//         success: function(response) {
//             // 업데이트 성공 시 수행할 작업
// //             alert("success.");
//         },
//         error: function(xhr, status, error) {
//             // 업데이트 실패 시 수행할 작업
//             console.log("error=====" + error);
//         }
//     });
//     location.reload();
//     alert("새로운 배송지가 저장되었습니다.");
// }
</script>

							
							<script>
							//'주문자와 동일' 체크박스 선택 시 실행되는 js.
							  function toggleInput() {
							    const memNameInput = document.getElementById("mem_name_input");
							    const memMobileInput1 = document.getElementById("mem_mobile1_input");
							    const memMobileInput2 = document.getElementById("mem_mobile2_input");
							    const memMobileInput3 = document.getElementById("mem_mobile3_input");
							    const memAddr1 = document.getElementById("sample6_postcode");
							    const memAddr2 = document.getElementById("sample6_address");
							    const memAddr3 = document.getElementById("sample6_detailAddress");
							    const memAddr4 = document.getElementById("sample6_extraAddress");
							    const sameAsOrdererCheckbox = document.getElementById("same_as_orderer");
							    
							    if (sameAsOrdererCheckbox.checked) {
							      memNameInput.value = "";
							      memMobileInput1.value = "";
							      memMobileInput2.value = "";
							      memMobileInput3.value = "";
							      memAddr1.value = "";
							      memAddr2.value = "";
							      memAddr3.value = "";
							      memAddr4.value = "";
							      
							    } else {
							      memNameInput.value = "";
							      memMobileInput1.value = "";
							      memMobileInput2.value = "";
							      memMobileInput3.value = "";
							      memAddr1.value = "";
							      memAddr2.value = "";
							      memAddr3.value = "";
							      memAddr4.value = "";
							    }
							  }
							
							</script>
							
							<script>
							//radio 신규배송지 선택시 실행되는 js.
							var newAddrRadio = document.getElementById("new_addr");
							var memNameInput = document.getElementById("mem_name_input");
							var memMobile1Input = document.getElementById("mem_mobile1_input");
							var memMobile2Input = document.getElementById("mem_mobile2_input");
							var memMobile3Input = document.getElementById("mem_mobile3_input");
							var memAddr1Input = document.getElementById("sample6_postcode");
							var memAddr2Input = document.getElementById("sample6_address");
							var memAddr3Input = document.getElementById("sample6_detailAddress");
							var memAddr4Input = document.getElementById("sample6_extraAddress");

							newAddrRadio.addEventListener("change", function() {
							  if (newAddrRadio.checked) {
							    memNameInput.value = "";
							    memMobile1Input.value = "";
							    memMobile2Input.value = "";
							    memMobile3Input.value = "";
							    memAddr1Input.value = "";
							    memAddr2Input.value = "";
							    memAddr3Input.value = "";
							    memAddr4Input.value = "";
							  }
							});
							
							var existingAddrRadio = document.getElementById("existing_addr");
							var newAddrRadio = document.getElementById("new_addr");
							var saveButton = document.getElementById("save_button");
							var optionValue = document.getElementById("optionValue");
							
							$(document).ready(function() {
								  $("#save_button").hide(); // 페이지 로드 시 save_button 요소 숨기기
								  $("#addrName").hide();
								  $("#newAddrSelect").hide();
								  $("#optionValue").hide();
								  
								  $("#existing_addr").on("change", function() {
								    if ($(this).is(":checked")) {
								      $("#save_button").hide();
								      $("#addrName").hide();
								      $("#newAddrSelect").show();
								      $("#optionValue").show();
								    }
								  });
								  
								  $("#new_addr").on("change", function() {
								    if ($(this).is(":checked")) {
								      $("#save_button").show();
								      $("#addrName").show();
								      $("#newAddrSelect").hide();
								      $("#optionValue").hide();
								    }
								  });
								});

							</script>
							
							<script>
							//우편번호 검색 기능
						    function sample6_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수

						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }

						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample6_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample6_extraAddress").value = '';
						                }

						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample6_postcode').value = data.zonecode;
						                document.getElementById("sample6_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample6_detailAddress").focus();
						            }
						        }).open();
						    }
							
							</script>

						</div>
						
						</div>
					</div>
	
	
					<div id="pay_wrap">
						<!-- <input type="submit" value="결제하기"> -->
						
						<!-- 결제하기 버튼 생성 -->
						<button onclick="requestPay()">결제하기</button>
    
					</div>

					

				</div>
		</div>
	
</section>



<footer>
	   <jsp:include page="footer.jsp" />
</footer> 

</body>
</html>