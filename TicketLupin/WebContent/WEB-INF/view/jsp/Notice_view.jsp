<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>고객센터 공지 상세</title>
		<link rel="stylesheet" href="../css/Notice_view.css">
		<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/Nav_event.js"></script>
		<script src="<%=request.getContextPath() %>/js/Nav_all.js"></script>
		<script>
			function deleteNotice(){
				
				var conf = confirm("삭제하시겠습니까?")
				
				if(conf == true){
					
					location.href = "../Customer/NoticeDeleteAction.do?nidx=${nv.nidx}";
					
				}else{
					
				}
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
		              		<li>${sessionScope.mid }님 환영합니다!&nbsp;&nbsp;&nbsp;&nbsp;</li>
		              		<li><a href="${pageContext.request.contextPath}/Member/Memberlogout.do">로그아웃&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
		                </c:if>
		                <c:if test="${empty sessionScope.mid}">
		                	<li class="login"><a href="${pageContext.request.contextPath}/Member/MemberLogin.do">로그인&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
		               		<li><a href="${pageContext.request.contextPath}/Member/MemberJoin.do">회원가입&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
		                </c:if>
		                	<li><a href="${pageContext.request.contextPath}/Customer/NoticeList.do">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
		                	<li><a href="#">이용안내&nbsp;&nbsp;&nbsp;&nbsp;</a></li><br/>         
						</ul>
						<img src="../ads/musicalads.png" id="h_ads" style="float:right;">
					</span>
					<img src="../icon/lupinlogo.png" id="h_logo">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="h_search" placeholder="뮤지컬 〈캣츠〉 40주년 내한공연 앙코르－서울（Musical CATS Encore">
					<button type="submit" id="h_search_button"><img src="../icon/search.png" id="h_search_img"></button>
				</div>
			</div>
		</header>
		<hr id="nav_bar_top">
		<div id="n_nav_div">
			<nav id="main_nav">
				<a href="${pageContext.request.contextPath}/Main/MainPage.do" id="main_nav_home">홈</a>
				<a href="${pageContext.request.contextPath}/Show/ShowList.do" id="main_nav_concert">공연</a>
				<a href="#" id="main_nav_ranking">랭킹</a>
				<a href="${pageContext.request.contextPath}/News/NewsList.do" id="main_nav_news">티켓오픈소식</a>
				<a href="#" id="main_nav_event">이벤트</a>
				<c:choose>
					<c:when test="${sessionScope.mgrade eq 'M' }">
						<a href="#" id="main_nav_myticket">관리자</a>
					</c:when>
					<c:otherwise>
						<a href="#" id="main_nav_myticket">마이티켓</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</div>
		<hr id="nav_bar_bottom">	
		<div id="nav_menu_sub_event_div" class="main_nav_all">
			<ul id="nav_menu_sub_event" style="margin:0px;">
				<li><a href="${pageContext.request.contextPath}/Event/EventList.do">전체 이벤트</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath}/Winner/WinnerList.do">당첨자 발표</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><a href="#">참여 이벤트</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		<hr id="nav_bar_sub">
		</div>
		<div id="nav_menu_sub_myticket_div" class="main_nav_all">
			<ul id="nav_menu_sub_myticket" style="margin:0px;">
				<c:choose>
					<c:when test="${sessionScope.mgrade eq 'M' }">
						<li><a href="${pageContext.request.contextPath}/Admin/AdminMain.do">관리자홈</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/Admin/AdminMember.do">회원관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="#">공연관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="#">댓글관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="../Customer/AnswerMain.do">문의관리</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</c:when>
					<c:otherwise>
						<li><a href="#">마이티켓 홈</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="#">예매확인/취소</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/Dibs/MyDibs.do">마이 찜</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li><a href="#">할인쿠폰</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					</c:otherwise>
				</c:choose>
			</ul>
		<hr id="nav_bar_sub">
		</div>
		<section>
			<article>
				<div class="notice">
					<p class="tit">
						<span class="label">고객센터</span>
					</p>
					<div class="cont_tbl">
						<table class="table1" border="1">
							<tr>
								<td width="140px"><a href="../Customer/NoticeList.do">공지사항</a></td>
								<td width="140px"><a href="../Customer/Buyguide.do">이용안내</a></td>
								<td width="140px"><a href="../Customer/FaqList.do">FAQ</a></td>
								<td width="140px">
									<c:choose>
										<c:when test="${not empty sessionScope.mid && sessionScope.mgrade eq 'G'}">
											<a href="../Customer/QuestionList.do">나의 문의 내역</a>
										</c:when>
										<c:when test="${not empty sessionScope.mid && sessionScope.mgrade eq 'M'}">
											<a href="../Customer/AnswerMain.do">문의 관리</a>
										</c:when>
										<c:otherwise>
											<a href="../Member/MemberLogin.do">나의 문의 내역</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</div>
					<div class="notice_info">
						<table class="notice_table1">
							<colgroup>
								<col style="width:60px">
								<col style="width:120px">
								<col style="width:800px">
								<col style="width:140px">							
							</colgroup>
							<c:set var="nv" value="${nv}"/>	
							<c:set var="pnv" value="${pnv}"/>
							<c:set var="nnv" value="${nnv}"/>
							<c:set var="count" value="${count}"/>
							<tr class="notice_table1_tr">
								<td style="text-align:center">${nv.num}</td>
								<td style="text-align:center">${nv.ncategory}</td>
								<td>${nv.ntitle}</td>
								<td style="text-align:center">${nv.nregdate}</td>
							</tr>
							<tr class="notice_table1_view" >
								<td colspan="4" style="border-bottom:1px solid #ebebeb">
									<p><pre style="font-size:14px; margin-left:15px; margin-right:10px; overflow: auto; white-space: pre-wrap;">${nv.ncontent}</pre></p>
								</td>
							</tr>
						</table>
						<table class="notice_table2">
							<colgroup>
								<col style="width:80px">
								<col style="width:120px">
								<col style="width:620px">
								<col style="width:70px">
								<col style="width:140px">												
							</colgroup>
							<c:if test="${nv.num < count}">
							<tr>
								<td style="text-align:center">이전글</td>
								<td style="text-align:center">${pnv.ncategory}</td>
								<td>
									<a href="../Customer/NoticeView.do?num=${pnv.num}&keyword=${keyword}&searchType=${searchType}" style="text-decoration:none; color:black;">
										&nbsp; ${pnv.ntitle}
									</a>
								</td>
								<td></td>
								<td style="text-align:center">${pnv.nregdate}</td>
							</tr>
							</c:if>
							<c:if test="${nv.num > 1}">
							<tr>
								<td style="text-align:center">다음글</td>
								<td style="text-align:center">${nnv.ncategory}</td>
								<td>
									<a href="../Customer/NoticeView.do?num=${nnv.num}&keyword=${keyword}&searchType=${searchType}" style="text-decoration:none; color:black;">
										&nbsp; ${nnv.ntitle}
									</a>
								</td>
								<td></td>
								<td style="text-align:center">${nnv.nregdate}</td>
							</tr>
							</c:if>
						</table>
					</div>
					<c:if test="${sessionScope.mgrade eq 'M'}">
						<div class="modify">
							<button class="modify_btn" onclick="location='../Customer/NoticeModify.do?num=${nv.num}&nidx=${nv.nidx}&keyword=${keyword}&searchType=${searchType}'">수정하기</button>
							<button class="remove_btn" onclick="deleteNotice();">삭제하기</button>
						</div>
					</c:if>
					<div class="list">
						<button class="list_btn" onclick="location='../Customer/NoticeList.do'">목록으로</button>
					</div>
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