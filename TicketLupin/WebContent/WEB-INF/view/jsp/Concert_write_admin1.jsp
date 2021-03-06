<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>공연 작성</title>
		<!-- jQuery -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.timepicker.js"></script>

		<!-- JS -->
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/timePicker.js"></script>
		<script src="${pageContext.request.contextPath}/js/Nav_all.js"></script>
		<script src="<%=request.getContextPath() %>/js/Main.js"></script>
		<script src="${pageContext.request.contextPath}/js/loginAlert.js"></script>
		<!-- core CSS -->
		<link rel="stylesheet" href="../css/jquery.timepicker.css">
		<link rel="stylesheet" href="../css/Concert_write_admin.css">
		
		<script type="text/javascript">
			
		
			function submitShow(){
				
				var title = document.frm.title;
				var startdate = document.frm.startdate;
				var enddate = document.frm.enddate;
				var ticketingdate = document.frm.ticketingdate;
				var postcode = document.frm.postcode;
				var roadAddress = document.frm.roadAddress;
				var detailAddress = document.frm.detailAddress;
				var extraAddress = document.frm.extraAddress;
				var vipPrice = document.frm.vipPrice;
				var rPrice = document.frm.rPrice;
				var aPrice = document.frm.aPrice;
				var sPrice = document.frm.sPrice;
				
				if(title.value == ""){
					alert("제목을 입력해주세요!");
					document.frm.title.focus();
					return;
				}else if(startdate.value == ""){
					alert("공연시작일을 입력해주세요!");
					document.frm.startdate.focus();
					return;
				}else if(enddate.value == ""){
					alert("공연종료일을 입력해주세요!");
					enddate.focus();
					return;
				}else if(ticketingdate.value == ""){
					alert("예매오픈일을 입력해주세요!");
					ticketingdate.focus();
					return;
				}else if(postcode.value == ""){
					alert("우편번호를 입력해주세요!");
					postcode.focus();
					return;
				}else if(roadAddress.value == ""){
					alert("도로명주소를 입력해주세요!");
					roadAddress.focus();
					return;
				}else if(detailAddress.value == ""){
					alert("상세주소를 입력해주세요!");
					detailAddress.focus();
					return;
				}else if(extraAddress.value == ""){
					alert("주소참고항목을 입력해주세요!");
					extraAddress.focus();
					return;
				}else if(vipPrice.value == ""){
					alert("VIP석 가격을 입력해주세요!");
					vipPrice.focus();
					return;
				}else if(rPrice.value == ""){
					alert("R석 가격을 입력해주세요!");
					rPrice.focus();
					return;
				}else if(sPrice.value == ""){
					alert("S석 가격을 입력해주세요!");
					sPrice.focus();
					return;
				}else if(aPrice.value == ""){
					alert("A석 가격을 입력해주세요!");
					aPrice.focus();
					return;
				}
				
				alert("공연을 등록합니다!");
				
				document.frm.action = "<%=request.getContextPath()%>/Show/ShowWriteStep1Action.do";
			 	document.frm.method = "post";
			 	document.frm.submit(); 
				return;
				
			}
		</script>
	</head>
	<body>
		<header>
			<div id="h_title">
				<div id="h_title_inner">
					<span id="h_top_menu">
						<ul id="h_top_menu_ul">
						<c:if test="${not empty sessionScope.mid}">
							<li><a href="${pageContext.request.contextPath}/Member/Member_Modify_PwdCheck.do?mid=${sessionScope.mid}">${sessionScope.mid }님 환영합니다!</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
							<li><a href="${pageContext.request.contextPath}/Member/Memberlogout.do">로그아웃&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
						</c:if>
						<c:if test="${empty sessionScope.mid}">
							<li class="login"><a href="${pageContext.request.contextPath}/Member/MemberLogin.do">로그인&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
							<li><a href="${pageContext.request.contextPath}/Member/MemberJoin.do">회원가입&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
						</c:if>
							<li><a href="${pageContext.request.contextPath}/Customer/NoticeList.do">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
							<li><a href="#">이용안내&nbsp;&nbsp;&nbsp;&nbsp;</a></li><br/>
						</ul>
						<img src="../ads/musicalads.png" id="h_ads">
					</span>
					<a href=""${pageContext.request.contextPath}/Main/MainPage.do"><img src="../icon/lupinlogo.png" id="h_logo"></a>&nbsp;&nbsp;&nbsp;&nbsp;
					<form action="${pageContext.request.contextPath}/Show/ShowList.do" method="get" style="display:inline-block;">
						<input type="text" id="h_search" name="q" placeholder="뮤지컬 〈캣츠〉 40주년 내한공연 앙코르－서울（Musical CATS Encore">
						<button type="submit" id="h_search_button"><img src="../icon/search.png" id="h_search_img"></button>
					</form>
				</div>
			</div>
		</header>
		<hr id="nav_bar_top">
		<div id="n_nav_div">
			<nav id="main_nav">
				<a href="${pageContext.request.contextPath}/Main/MainPage.do" id="main_nav_home">홈</a>
				<a href="${pageContext.request.contextPath}/Show/ShowList.do" id="main_nav_concert">공연</a>
				<a href="${pageContext.request.contextPath}/Show/RankingList.do" id="main_nav_ranking">랭킹</a>
				<a href="${pageContext.request.contextPath}/News/NewsList.do" id="main_nav_news">티켓오픈소식</a>
				<a href="${pageContext.request.contextPath}/Event/EventMain.do" id="main_nav_event">이벤트</a>
				<c:choose>
					<c:when test="${sessionScope.mgrade eq 'M' }">
						<a href="${pageContext.request.contextPath}/Manager/Main.do" id="main_nav_myticket">관리자</a>
					</c:when>
					<c:otherwise>
						<c:if test="${not empty sessionScope.mid}">
							<a href="${pageContext.request.contextPath}/Myticket/MyticketMain.do" id="main_nav_myticket">마이 티켓</a>
						</c:if>
						<c:if test="${empty sessionScope.mid}">
							<a onclick="loginAlert()" id="main_nav_myticket">마이 티켓</a>
						</c:if>
					</c:otherwise>
				</c:choose>
			</nav>
		</div>
		<hr id="nav_bar_bottom">
		<div id="nav_menu_sub_event_div" class="main_nav_all">
			<ul id="nav_menu_sub_event" style="margin:0px;">
				<li><a href="${pageContext.request.contextPath}/Event/EventMain.do">전체 이벤트</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath}/Winner/WinnerList.do">당첨자 발표</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
			<hr id="nav_bar_sub">
		</div>
		<div id="nav_menu_sub_myticket_div" class="main_nav_all">
			<ul id="nav_menu_sub_myticket" style="margin:0px;">
				<c:choose>
					<c:when test="${sessionScope.mgrade eq 'M' }">
						<li><a href="${pageContext.request.contextPath}/Manager/MemberList.do">회원관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/Manager/ConcertList.do">공연관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/Manager/comment.do">댓글관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/Customer/AnswerMain.do">문의관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${not empty sessionScope.mid}">
								<li><a href="${pageContext.request.contextPath}/Myticket/MyticketMain.do">마이티켓 홈</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li><a href="${pageContext.request.contextPath}/Myticket/MyticketReservation.do">예매확인/취소</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li><a href="${pageContext.request.contextPath}/Dibs/MyDibs.do">마이 찜</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
							</c:when>
							<c:otherwise>
								<li><a onclick="loginAlert()">마이티켓 홈</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li><a onclick="loginAlert()">예매확인/취소</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li><a onclick="loginAlert()">마이 찜</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>
			<hr id="nav_bar_sub">
		</div>
		
		<section>
			<article>
				<div class="open_notice">
					<h2>
						공연 작성
					</h2>
					<form name="frm">
						<table class="open_notice_table" style="border:1px solid; border-collapse:collapse;">
							<colgroup>
								<col width="50px">
								<col width="35px">
								<col width="20px">
								<col width="395px">
								<col width="85px">
								<col width="10px">
								<col width="50px">
								<col width="5px">
								<col width="85px">
								<col width="60px">
								<col width="40px">
								<col width="45px">
								<col width="70px">
								<col width="50px">
								
							</colgroup>
							<tr>
								<th style="border:1px solid;">
									제목
								</th>
								<td colspan="8" style="border:1px solid;">
									<input type="text" class="title" name="title" id="title" maxlength="100" style="width:99%; border:0px; font-size:16px;">
								</td>
								<th style="border:1px solid;">
									장르
								</th>
								<td colspan="1" style="border:1px solid;">
									<center>
										<select class="genre" name="genre" style="border:0px; font-size:15px; text-align-last:center;">
											<option>
												오리지널/내한공연
											</option>
											<option>
												라이선스
											</option>
											<option>
												창작뮤지컬
											</option>
											<option>
												넌버벌 퍼포먼스
											</option>
											<option>
												패키지공연
											</option>
										</select>
									</center>
								</td>
								<th colspan="2" style="border:1px solid;">
									관람등급
								</th>
								<td colspan="1" style="border:1px solid;">
									<center>
									<select class="rating" name="rating" style="border:0px; font-size:15px; text-align-last:center;">
										<option>
											전체관람가
										</option>
										<option>
											12세 관람가
										</option>
										<option>
											15세 관람가
										</option>
										<option>
											청소년 관람불가
										</option>
									</select>
									</center>
								</td>
							</tr>
							<tr>
								<th colspan="2" style="border:1px solid;">
									공연 기간
								</th>
								<td colspan="10" style="border:1px solid;">
									<center>
										<input type="date" class="date" name="startdate">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="date" class="date" name="enddate">
									</center>
								</td>
								<th colspan="1" style="border:1px solid;">
									예매 오픈
								</th>
								<td colspan="1" style="border:1px solid;">
									<center>
										<input type="datetime-local" class="date" name="ticketingdate">
									</center>
								</td>
							</tr>
							<tr>
								<th colspan="2" style="border:1px solid;">
									공연장 위치
								</th>
								<td colspan="12" style="border:1px solid;">
									<div class="map">
										<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호" style="width:70px;">
										<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
										<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" >
										<input type="text" id="sample4_jibunAddress" name="jibunAddress" placeholder="지번주소">
										<span id="guide" style="color:#999;display:none"></span>
										<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소">
										<input type="text" id="sample4_extraAddress" name="extraAddress" placeholder="참고항목">
										
										<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
										<script>
										    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
										    function sample4_execDaumPostcode() {
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var roadAddr = data.roadAddress; // 도로명 주소 변수
										                var extraRoadAddr = ''; // 참고 항목 변수
										
										                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
										                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
										                    extraRoadAddr += data.bname;
										                }
										                // 건물명이 있고, 공동주택일 경우 추가한다.
										                if(data.buildingName !== '' && data.apartment === 'Y'){
										                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										                }
										                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										                if(extraRoadAddr !== ''){
										                    extraRoadAddr = ' (' + extraRoadAddr + ')';
										                }
										
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                document.getElementById('sample4_postcode').value = data.zonecode;
										                document.getElementById("sample4_roadAddress").value = roadAddr;
										                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
										                
										                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
										                if(roadAddr !== ''){
										                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
										                } else {
										                    document.getElementById("sample4_extraAddress").value = '';
										                }
										
										                var guideTextBox = document.getElementById("guide");
										                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
										                if(data.autoRoadAddress) {
										                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
										                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
										                    guideTextBox.style.display = 'block';
										
										                } else if(data.autoJibunAddress) {
										                    var expJibunAddr = data.autoJibunAddress;
										                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
										                    guideTextBox.style.display = 'block';
										                } else {
										                    guideTextBox.innerHTML = '';
										                    guideTextBox.style.display = 'none';
										                }
										            }
										        }).open();
										    }
										</script>
									</div>
								</td>
							</tr>
							<tr><td colspan="14" style="border:1px solid;"><center>입장권 가격 설정<center><td></tr>
							<tr>
								<td colspan="2" style="border:1px solid;">VIP</td>
								<td colspan="2" style="border:1px solid;"><input type="nunber" name="vipPrice" id="vipPrice"></td>
								<td colspan="2" style="border:1px solid;">R</td>
								<td colspan="2" style="border:1px solid;"><input type="nunber" name="rPrice" id="rPrice"></td>
								<td colspan="2" style="border:1px solid;">S</td>
								<td colspan="2" style="border:1px solid;"><input type="nunber" name="sPrice" id="sPrice"></td>
								<td colspan="1" style="border:1px solid;">A</td>
								<td colspan="1" style="border:1px solid;"><input type="nunber" name="aPrice" id="aPrice"></td>
							</tr>
						</table>
						<div class="reg">
							<button class="reg_btn" type="button" onclick="submitShow()">
								다음
							</button>
						</div>
						
						<div class="list">
							<button class="list_btn">
								목록으로
							</button>
						</div>
					</form>
				</div>
			</article>
		</section>
		<footer>
				<hr class="f_bar" id="f_bar_bottom">
				<div id="f_last">
					<span class="f_bottom_ment"><img src="../icon/lupinlogo.png" id="f_logo"></span>
					<span class="f_bottom_ment">
						<span class="f_bottom_tagset">예매문의(1234-1234)</span>
						<a href="#" class="f_bottom_tagset">티켓판매제휴&nbsp;&nbsp;&nbsp;&nbsp;</a>
						<a href="#" class="f_bottom_tagset">예매가이드&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</span>
				</div>
				<hr class="f_bar" id="f_bar_bottom">
			<div class="f_title_inner">
				<span id="f_menu_contract_span">
					<ul id="f_menu_contract">
						<li><a href="#">회사소개</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">이용약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">전자금융거래약관</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">위치기반서비스 이용약관&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
						<li><a href="#" style="font-weight:bold;">개인정보처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">청소년보호정책</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">파트너센터</a>&nbsp;&nbsp;&nbsp;&nbsp;</li><br>
					</ul>
				</span>
			</div>
			<div class="f_title_inner">
				<span id="f_menu_produce">
					<ul id="f_menu_produce">
						<li><a href="#" style="font-weight:bold;">(주)티켓루팡</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">전북 전주시 덕진구 백제대로 572 4층</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">대표이사:최민우</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">사업자등록번호: 111-11-11111&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
						<li><a href="#">통신판매업 신고번호: 제1111-이젠이젠-1111호 <a href="#" style="font-weight:bold;">&nbsp;&nbsp;사업자정보확인>&nbsp;&nbsp;</a></a>&nbsp;&nbsp;&nbsp;&nbsp;</li><br>
						<li><a href="#">고객센터(평일/주말 09:00~18:00): 1234-1234(유료)</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">호스팅제공자: (주)티켓루팡</a>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
						<li><a href="#">&copy;TicketLupin Corp. All rights reserved.</a>&nbsp;&nbsp;&nbsp;&nbsp;</li><br>
					</ul>
				</span>
			</div>
		</footer>
	</body>
</html>