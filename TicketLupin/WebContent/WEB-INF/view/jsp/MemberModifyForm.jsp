<%@page import="com.TicketLupin.web.service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String mid = (String) session.getAttribute("mid");
	String mpwd = (String)session.getAttribute("mpwd");
	MemberDao md = new MemberDao();
	MemberVo mv = md.getMember(mid, mpwd);
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>티켓루팡</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/MemberModifyForm.css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript">
        	
			function check(){
				
				
				if(document.frm.mname.value == ""){
					alert("이름을 입력해주세요.")
					document.frm.mname.focus();
					return;
				}else if (document.frm.mpwd.value == ""){
				  	alert("비밀번호를 입력해주세요.");
				  	document.frm.mpwd.focus();
				  	return;
				}else if(document.frm.mbirthmonth.value == ""){
					alert("생년월일을 입력해주세요.");
					document.frm.mbirthmonth.focus();
					return;
				}else if(document.frm.mgender.value == ""){
					alert("성별을 선택해주세요.");
					document.frm.mgender.focus();
					return;
				}
			  
				alert("수정합니다!");
			  	document.frm.action ="<%=request.getContextPath()%>/Member/MemberModifyAction.do?mid=<%=mv.getMid()%>";
			  	document.frm.method = "POST";
			  	document.frm.submit(); 
			  	return;
			} 
			
			
			
		</script>
    </head>
    <body>
        <!-- header -->
        <div id="header">
            <a href="<%=request.getContextPath()%>/Main/MainPage.do" title="티켓루팡 페이지 보러가기"><img src="../icon/lupinlogo.png" id="logo"></a>
        </div>

		<form name="frm" >
	        <!-- wrapper -->
	        <div id="wrapper">
				<input type="hidden" value="<%=mv.getMidx()%>" name="midx"> 
	            <!-- content-->
	            <div id="content">
	
	                <!-- ID -->
	                <div>
	                    <h3 class="join_title">
	                        <label for="id">아이디</label>
	                    </h3>
	                    <span style="padding:20px;">
	                        <strong style="font-size:20px;"><%=mv.getMid()%></strong>
	                    </span>
	                    <span class="error_next_box"></span>
	                    <div id="checkMsg"></div>
	                </div>
	                
	                <!-- PW1 -->
	                <div>
	                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
	                    <span class="box int_pass">
	                    	<input type="hidden" value="<%=mv.getMpwd()%>" name="mPwd2">
	                        <input type="password" id="pswd1" class="int" maxlength="20"  name="mpwd">
	                        <span id="alertTxt">사용불가</span>
	                        <img src="../icon/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
	                    </span>
	                    <span class="error_next_box"></span>
	                </div>
	
	                <!-- NAME -->
	                <div>
	                    <h3 class="join_title"><label for="name">이름</label></h3>
	                    <span class="box int_name">
	                        <input type="text" id="name" class="int" maxlength="20"  name="mname" value="<%=mv.getMname()%>">
	                    </span>
	                    <span class="error_next_box"></span>
	                </div>
	
	                <!-- BIRTH -->
	                <div>
	                    <h3 class="join_title"><label for="yy">생년월일</label></h3>
	
	                    <div id="bir_wrap">
	                        <!-- BIRTH_YY -->
	                        <div id="bir_yy">
	                            <span class="box">
	                                <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)" name="mssn" value="<%=mv.getMssn()%>">
	                            </span>
	                        </div>
	
	                        <!-- BIRTH_MM -->
	                        <div id="bir_mm">
	                            <span class="box">
	                                <select id="mm" class="sel" name="mbirthmonth" >
	                                    <option value="">월</option>
	                                    <option value="01">1</option>
	                                    <option value="02">2</option>
	                                    <option value="03">3</option>
	                                    <option value="04">4</option>
	                                    <option value="05">5</option>
	                                    <option value="06">6</option>
	                                    <option value="07">7</option>
	                                    <option value="08">8</option>
	                                    <option value="09">9</option>                                    
	                                    <option value="10">10</option>
	                                    <option value="11">11</option>
	                                    <option value="12">12</option>
	                                </select>
	                            </span>
	                        </div>
	
	                        <!-- BIRTH_DD -->
	                        <div id="bir_dd">
	                            <span class="box">
	                                <input type="text" name="mbirthday" id="dd" class="int" maxlength="2" placeholder="일" value="<%=mv.getMbirthday()%>">
	                            </span>
	                        </div>
	
	                    </div>
	                   
	                </div>
	
	                <!-- GENDER -->
	                <div>
	                    <h3 class="join_title"><label for="gender">성별</label></h3>
	                    <span class="box gender_code">
	                        <select id="gender" class="sel" name="mgender">
	                            <option value="">성별</option>
	                            <option value="M">남자</option>
	                            <option value="F">여자</option>
	                        </select>                            
	                    </span>
	                    <span class="error_next_box">필수 정보입니다.</span>
	                </div>
					
					
					<!--address-->
					<h3 class="join_title">
						<label for="address">주소</label >
					</h3>
					
					<input type="text" id="sample6_postcode" placeholder="우편번호" style="height:25px" name="mpostcode" value="<%=mv.getMpostcode() %>">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="height:25px"><br>
					<input type="text" id="sample6_address" placeholder="주소" style="width:100%; height:25px" name="maddress" value="<%=mv.getMaddress()%>"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="width:45%; height:25px" name="mdetailaddress" value="<%=mv.getMdetailaddress() %>">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:45%; height:25px" name="mextraaddress" value="<%=mv.getMextraaddress()%>">
					
					
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
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
					                document.getElementById("sample6_postcode").value = data.zonecode;
					                document.getElementById("sample6_address").value = addr;
					                // 커서를 상세주소 필드로 이동한다.
					                document.getElementById("sample6_detailAddress").focus();
					            }
					        }).open();
					    }
					</script>
					
	                <!-- EMAIL -->
	                <div>
	                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>
	                    <span class="box int_email">
	                        <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력" name="memail" value="<%=mv.getMemail()%>">
	                    </span>
	                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
	                </div>
	
	                <!-- MOBILE -->
	                <div>
	                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
	                    <span class="box int_mobile">
	                        <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력"  name="mphone" value="<%=mv.getMphone()%>">
	                    </span>
	                    <span class="error_next_box"></span>    
	                </div>
	
	
	                <!-- JOIN BTN-->
	                <div class="btn_area">
	                    <button type="button" id="btnJoin" onclick="check()">
	                        <span>수정하기</span>
	                    </button>
	                    <button type="button" id="btnJoin2" onclick="location.href='<%=request.getContextPath()%>/Member/UserDelete.do?mid=<%=mv.getMid()%>'">
	                        <span>탈퇴하기</span>
	                    </button>
	                </div>
	
	                
	
	            </div> 
	            <!-- content-->
	
	        </div> 
	        <!-- wrapper -->
        </form>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/Join_step2.js"></script>
    </body>
</html>