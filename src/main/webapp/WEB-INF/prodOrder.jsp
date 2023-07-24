
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%@ page import = "java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>

<link rel="stylesheet" href="/css/shopping_order.css">
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>

	   <jsp:include page="header.jsp" />

<section>

	<form action="shopping_complete.do" >
		
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
							
							<script>
							//결제방식 선택
							  //신용카드 클릭 시 
								    // Get the payment method and credit card company select elements
								    const paywayRadios = document.querySelectorAll('input[name="payway"]');
								    const creditCardWrap = document.getElementById('credit_card_wrap');
								
								    // Add a change event listener to the payment method radio buttons
								    for (let i = 0; i < paywayRadios.length; i++) {
								        paywayRadios[i].addEventListener('change', () => {
								            if (paywayRadios[i].value === '신용카드') {
								                creditCardWrap.style.display = 'block';
								            } else {
								                creditCardWrap.style.display = 'none';
								            }
								        });
								    }

								    //무통장입금 클릭 시 
									$(document).ready(function() {
									  $('input[name="payway"]').change(function() {
									    if ($(this).val() == '무통장입금') {
									      $('#paymethod2_wrap').show();
									    } else {
									      $('#paymethod2_wrap').hide();
									    }
									  });
									});
								    
									//카카오페이 클릭 시 
									$(document).ready(function() {
									  $('input[name="payway"]').change(function() {
									    if ($(this).val() == '카카오페이') {
									      $('#kakaopay_wrap').show();
									    } else {
									      $('#kakaopay_wrap').hide();
									    }
									  });
									});
							</script>
							
							<script>
							//'radio' 클릭 시 실행되는 js. (구현 안됨..ㅎ 일단 보류)
//// 						$(document).ready(function()
//// 						{
//// 						    $("input:radio[id=existing_addr]").click(function()
//// 						    {
//// 						    	toggleInput();
//// 						    })
//						    
//// 						    $("input:radio[id=new_addr]").click(function()
//// 						    {
//// 						    	toggleInput();
//// 						    })
//// 						});
							</script>
							
						</div>
					</div>
	
					<div id="order_ask_wrap">

						<div id="order_ask_title">
							<h2>배송 요청사항</h2>
						</div>

						<div id="order_ask_con">

							<table class="shopping_addr_info">

								<tr>
									<th>배송 메시지</th>

									<td>
										<!-- <input type="checkbox" value="" >  --> <select
										name="ord_ask" onchange="showAskDetail()" style="height: 35px; width: 50%;" >
											<option>배송메시지를 선택해주세요.</option>
											<option>부재시 경비실에 맡겨주세요.</option>
											<option>부재시 문앞에 놓아주세요.</option>
											<option>파손의 위험이 있는 상품이오니, 배송시 주의해주세요.</option>
											<option>배송 전에 연락주세요.</option>
											<option>택배함에 넣어주세요.</option>
											<option>직접 입력하기</option>

									</select>

									</td>
								</tr>

								<tr id="askDetailRow" style="display: none">
									<th>기타상세내용</th>
									<td><input type="text" id="ord_ask_detail"
										name="ord_ask_detail" value=""></td>
								</tr>

							</table>

							<script>
							  function showAskDetail() {
							    var askSelect = document.getElementsByName("ord_ask")[0];
							    var askDetailRow = document.getElementById("askDetailRow");
							    if (askSelect.value === "직접 입력하기") {
							      askDetailRow.style.display = "table-row";
							    } else {
							      askDetailRow.style.display = "none";
							    }
							  }
							</script>

						</div>

					</div>
	
					<div id="order_payway">

						<div id="order_payway_title">
							<h2>결제수단 선택</h2>
						</div>

						<div id="order_payway_wrap">

							<div id="order_radio_wrap">
								<div class="payway_class">
									<input type="radio" name="payway" value="신용카드">신용카드
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="무통장입금">무통장입금
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="카카오페이">카카오페이
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="네이버페이">네이버페이
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="휴대폰결제">휴대폰결제
								</div>
								<div class="payway_class">
									<input type="radio" name="payway" value="문화상품권">문화상품권
								</div>
							</div>
							
							<script>
  
							</script>
							
							
							<div class="wrap_all" id="wrap_all" >
							<table id="credit_card_wrap" >
								<tr>
									<th>신용카드</th>

									<td><select id="card_company_select" name="card_select">
											<option>-</option>
											<option value="국민카드">국민카드</option>
											<option value="신한카드">신한카드</option>
											<option value="삼성카드">삼성카드</option>
											<option value="하나카드">하나카드</option>
											<option value="롯데카드">롯데카드</option>
									</select></td>
								</tr>

								<tr>
									<th>할부종류</th>
									<td><select name="card_installment" style="width: 20%; height: 35px;" >
											<option value="-">-</option>
											<option value="일시불">일시불</option>
											<option value="2개월">2개월</option>
											<option value="3개월">3개월</option>
											<option value="4개월">4개월</option>
											<option value="5개월">5개월</option>
											<option value="6개월">6개월</option>
									</select></td>
								</tr>
							</table>

<!-- 							<div id="paymethod2_wrap"> -->
<!-- 								<div> -->
<!-- 									<label for="without_bankbook">은행명</label> <select -->
<!-- 										id="without_bankbook" name="paymethod2"> -->
<!-- 										<option>-</option> -->
<!-- 										<option>기업</option> -->
<!-- 										<option>국민</option> -->
<!-- 										<option>농협</option> -->
<!-- 										<option>수협</option> -->
<!-- 										<option>우리</option> -->
<!-- 										<option>하나</option> -->
<!-- 										<option>신한</option> -->
<!-- 									</select> -->
<!-- 								</div> -->

<!-- 								<div> -->
<!-- 									<label>입금기한</label> -->
<!-- 									<div> -->
<!-- 										<input type="text" id="deposit_deadline"> -->
<!-- 									</div> -->
<!-- 								</div> -->

<!-- 								<script> -->
<!-- // 								  // 현재 시간에서 24시간을 더한 시간 계산 -->
<!-- // 								  const now = new Date(); -->
<!-- // 								  const expiryTime = new Date(now.getTime() + 24 * 60 * 60 * 1000); -->
								
<!-- // 								  // input의 value 속성에 시간 할당 -->
<!-- // 								  const input = document.getElementById('deposit_deadline'); -->
<!-- // 								  input.value = expiryTime.toLocaleString();  // 날짜 포맷을 설정할 수 있습니다. -->
<!-- 								</script> -->

<!-- 								<div> -->
<!-- 									입금자명 -->

<!-- 								</div> -->

<!-- 							</div> -->

<!-- 							<div id="kakaopay_wrap"> -->
<!-- 								<div id="kakaopay_note"> -->
<!-- 									<span> 무이자할부는 카카오페이 모바일 결제창에서 선택하실 수 있습니다. 휴대폰과 카드명의자가 -->
<!-- 										동일해야 결제 가능합니다. 카카오페이 결제 시, 제휴카드 할인/적립(CJ카드, CJ iD카드, 임직원할인 -->
<!-- 										포함)이 적용되지 않습니다. 카드 영수증 및 현금영수증 확인은 카카오페이 홈페이지에서 확인 -->
<!-- 										가능합니다.(카카오페이 홈 > 설정 > 결제내역) 카카오페이 고객센터 : 1644-7405 </span> -->
<!-- 								</div> -->
<!-- 							</div> -->

						</div>
						
						</div>
					</div>
	
	
					<div id="pay_wrap">
						<input type="submit" value="결제하기">
					</div>

				</div>
		</div>
	</form>
	
</section>



<footer>
	   <jsp:include page="footer.jsp" />
</footer> 

</body>
</html>