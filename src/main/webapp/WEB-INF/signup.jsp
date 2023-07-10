<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpringBoot SignUp</title>



</head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>




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

	//아이디 중복 체크 
	$(document).ready(function(){
		
		$("#idbtn").click(function(){
			var memId=$("#memId").val();
			alert("alert  ="+memId );
			// window.location.href = "/signup/userId/check?memId=" + encodeURIComponent(memId);
			if(memId.length >=2 && memId.length <=10) {
				$.ajax({
					type : "get",
					url : "/signup/userId/check",
					data : {"memId" : memId},
					success : function(result) {
						alert("here   "+result);
						if(result == 1){
							alert("이미 사용 중인 ID입니다.")
						} else {
							alert("사용 가능한 ID입니다.")
						}
					}
				});
				
			} else {
				alert("2~10자 내의 아이디를 입력하세요.");
			}
		});
	});
		
</script>

<body>

	<div id="wrap" style="text-align: center;">
	
		<!--회원가입폼-->
		<form style="margin-top: 100px;" method="post"
			action="/signup">
			<h2>회원가입</h2>
			<div class="line01" style="background-color: #7E7DCB;"></div>
			<div id="joinwrap">
				<table style="margin: auto auto;">
					<colgroup>
						<col width="150px" />
					</colgroup>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="formal" id="memId"
							name="memId" value="${mem_id}" size="35" placeholder="아이디를 입력하세요."
							onkeyup="only(this.value)"  ></td>
						<td><input type="button" id="idbtn" name="" value="중복확인"
							style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px;"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="formal" id="mem_pw01"
							name="memPw" value="${mem_pw}" size="35" maxlength="18"
							placeholder="8~15자 사이의 비밀번호를 입력하세요" class="basic"  ></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" class="formal" id="mem_pw02"
							name="" value="" size="35" placeholder="한 번 더 입력해주세요"
							maxlength="18"  ><br>
						<span id="mem_pwMsg" style="font-size: 0.9em; color: #7E7DCB;">
								비밀번호를 입력해주세요.</span></td>
						<td></td>
					</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" class="formal" name="mem_name"
							value="${mem_name}" size="35" class="basic"  ></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" class="formal" name="mem_nick"
							id="mem_nick" value="" size="35" class="basic"  ></td>
						<td><input type="button" id="mem_nickbtn" name=""
							value="중복확인"
							style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px;"></td>
					</tr>

					<tr>
						<td>E-mail</td>
						<td><input type="text" name="mem_email1" value="${mem_email1}" size="18"
							class="mem_email" style="margin-right: 7px;"> <span
							style="opacity: 70%;">@</span> <select name="mem_email2">
								<option>선택</option>
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.net">hanmail.net</option>
								<option value="@google.com">google.com</option>
								<option>직접입력</option>
						</select>
					</tr>
					<tr>
					
						<td>주소</td>
						<td><input type="text" name="mem_addr1"
							id="sample6_postcode" placeholder="우편번호" readonly><br>
							<input type="text" name="mem_addr2" id="sample6_address"
							placeholder="주소" name="address" size="35" style="margin-top: 3px"
							readonly><br> <input type="text" 
							name="mem_addr3" id="sample6_detailAddress" placeholder="상세주소"
							style="margin-top: 3px" size="16"> <input type="text"
							 name="mem_addr4" id="sample6_extraAddress"
							placeholder="참고항목" size="15" style="margin-top: 3px"></td>
						<td><input type="button" onclick="sample6_execDaumPostcode()"
							name="" value="우편번호 검색"
							style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px;"></td>
					</tr>
				
					<tr>
						<td>휴대폰</td>
						
						<td>
						<select name="mem_mobile0" class="formal"  >
								<option>통신사</option>
								<option value="kt">kt</option>
								<option value="skt">skt</option>
								<option value="lg u+">lg u+</option>
								<option value="알뜰폰">알뜰폰</option>
						</select> 
						
						<input type="text" class="formal" name="mem_mobile1" id = "phone1" value="${mem_mobile1}" size="3" maxlength="3"  > - 
						<input type="text" class="formal" name="mem_mobile2" id = "phone2" value="${mem_mobile2}" size="4" maxlength="4"  > - 
						<input type="text" class="formal" name="mem_mobile3" id = "phone3" value="${mem_mobile3}" size="4" maxlength="4"  >
						</td>
							
						<!-- 인증번호 구간은 기능에 맞춰 수정했습니다 -->
						<td> <button type = "button" id ="numiden" class="dupcheck" onclick="identify()" style="width : 115px; background-color: #7E7DCB; color: white; border-radius: 5px;"><font color ="white">인증번호 받기</font></button>
						</td>
					</tr>
							
							
					<tr class="idenwrap" style ="width: 500px">
							
									<td><input type="text" id="numbox" size="10" class="idenbox"></input></td>
									<td id="timer">05:00</td>
									<td>
									<button type="button" id="idnumconfirm" name="dupcheck"
										onclick="idenconfirm()">인증번호 확인</button></td>
									<td><button type="button" id="numagain"
										style="background-color: #bab9eb;" name="dupcheck"
										class="idennumber" onclick="idenagain()">재전송</button>
									</td>
					</tr>
					<td>성별</td>
					<td class="mem_sex"><input type="radio" name="mem_sex"
						id="men" value="M" style="width: 30px; height: 13px;"> <label
						for="M">남성</label> <input type="radio" name="mem_sex" id="women"
						value="F" style="width: 30px; height: 13px;"> <label
						for="F">여성</label></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><select name="mem_birth1">
								<%
								for (int i = 1960; i <= 2023; i++) {
								%><option  <%String years = i + "";%>><%=years%>년
								</option>
								<%
								}
								%>
						</select> <select name="mem_birth2">
								<%
								for (int i = 1; i <= 12; i++) {
								%><option  <%String months = i + "";%>><%=months%>월
								</option>
								<%
								}
								%>
						</select> <select name="mem_birth3">
								<%
								for (int i = 1; i <= 31; i++) {
								%><option  <%String days = i + "";%>><%=days%>일
								</option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>소식받기</td>
						<td><input type="checkbox" name="mem_news" value="sms"
							class="mem_news" style="width: 20px; height: 13px;" checked>
							<label>SMS</label> <input type="checkbox" name="mem_news"
							value="e-mail" class="mem_news"
							style="width: 20px; height: 13px;" checked> <label>E-mail</label>
							<input type="checkbox" name="mem_news" value="N" class="mem_news"
							style="width: 20px; height: 13px;" checked> <label>동의하지
								않음</label>
					</tr>

				</table>
				<div class="line01" style="background-color: #7E7DCB;"></div>

				<input class="but" type="submit" onclick="btn()" value="회원가입 완료"
					onclick=location.href="tour002.jsp">
			</div>
		</form>

	</div>


</body>
</html>