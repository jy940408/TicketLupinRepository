<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<title>티켓 루팡</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Main.css">
		<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/Main.js"></script>
		<script src="${pageContext.request.contextPath}/js/loginAlert.js"></script>
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
				<div id="main_poster_all">
					<div id="main_poster_div">
						<div class="main_poster_content">
							<ul>
								<c:forEach var="sl" items="${showList}">
									<li><a href="<%=request.getContextPath()%>/ConcertView/ConcertView.do?sidx=${sl.sidx}"><img src="<%=request.getContextPath()%>/poster/${sl.stitleimage}" id="main_poster_slider_poster1"></a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<br>
				
				<div id="main_comingsoon_div">
					<span id="main_comingsoon_ment">잠시 후, 오픈 예정!</span>
					<a href="<%=request.getContextPath()%>/Show/ShowList.do" id="main_comingsoon_more">더보기 ></a><br>
					<div id="main_comingsoon">
						<c:forEach var="sl" items="${showList}" begin="0" end="3">
						<a href="<%=request.getContextPath()%>/ConcertView/ConcertView.do?sidx=${sl.sidx}">
							<img src="<%=request.getContextPath()%>/poster/${sl.stitleimage}" id="main_open_poster1">
						</a>
						</c:forEach>
						<div id="main_comingsoon_time" style="font-size:25px;"></div>
					</div>
				</div>
				<br>
				
				<div id="main_ads">
					<img src="../ads/musicalads2.png" id="main_musicalads2">
				</div>
				<br>
				<div id="main_notice_set">
					<div id="main_opennews" class="main_open_ranking">
						<span id="main_opennews_ment">티켓 오픈 소식</span>
						<a href="<%=request.getContextPath()%>/News/NewsList.do" id="main_opennews_more">더보기></a>
						<div class="main_notice_class" id="main_opennews_set">
							<c:forEach var="nl" items="${newsList}" begin="0" end="4" varStatus="status">
							<c:if test="${!status.last}">
							<a href="<%=request.getContextPath()%>/News/NewsDetail.do?widx=${nl.widx}" id="main_notice_atag">
								<div id="main_opennews1">
									<span class="main_notice_title">${nl.wtitle}</span><br>
									<span class="main_notice_date">[오픈]&nbsp;<fmt:formatDate value="${nl.wopendate}" type="both" pattern="YY.MM.dd(E) HH:ss"/></span>
								</div>
							</a>
							<hr class="main_opennews_bar">
							</c:if>
							<c:if test="${status.last}">
							<a href="<%=request.getContextPath()%>/News/NewsDetail.do?widx=${nl.widx}" id="main_notice_atag">
								<div id="main_opennews1">
									<span class="main_notice_title">${nl.wtitle}</span><br>
									<span class="main_notice_date">[오픈]&nbsp;<fmt:formatDate value="${nl.wopendate}" type="both" pattern="YY.MM.dd(E) HH:ss"/></span>
								</div>
							</a>
							</c:if>
							</c:forEach>
						</div>
					</div>
					<div id="main_ranking" class="main_open_ranking">
						<span id="main_ranking_ment">랭킹</span>
						<a href="${pageContext.request.contextPath}/Show/RankingList.do" id="main_ranking_more">더보기></a>
						<div class="main_notice_class" id="main_ranking_set">
							<c:forEach var="rl" items="${rankingList}" begin="0" end="2" step="1" varStatus="status">
							<c:if test="${!status.last}">
							<a href="${pageContext.request.contextPath}/ConcertView/ConcertView.do?sidx=${rl.sidx}" style="text-decoration:none; color:black;">
								<div class="main_ranking_class" id="main_ranking1">
									<span class="main_ranking_number" style="font-weight:bold;">${status.count}</span>
									<img src="${pageContext.request.contextPath}/poster/${rl.stitleimage }" id="main_ranking_poster1">
									<div class="main_ranking_text">
										<div class="main_ranking_name">${rl.stitle }</div><br>
										<div class="main_ranking_date">${rl.sopendate } ~ ${rl.senddate }</div><br>
										<div class="main_ranking_place">${rl.sdetailaddress }</div>
									</div>
								</div>
							</a>
							<hr class="main_ranking_bar">
							</c:if>
							<c:if test="${status.last }">
							<a href="${pageContext.request.contextPath}/ConcertView/ConcertView.do?sidx=${rl.sidx}" style="text-decoration:none; color:black;">
								<div class="main_ranking_class" id="main_ranking1">
									<span class="main_ranking_number" style="font-weight:bold;">${status.count}</span>
									<img src="${pageContext.request.contextPath}/poster/${rl.stitleimage}" id="main_ranking_poster1">
									<div class="main_ranking_text">
										<div class="main_ranking_name">${rl.stitle }</div><br>
										<div class="main_ranking_date">${rl.sopendate } ~ ${rl.senddate }</div><br>
										<div class="main_ranking_place">${rl.sdetailaddress }</div>
									</div>
								</div>
							</a>
							</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<br>
				<div id="main_pick">
					<div id="main_pick_ment">최근 등록된 공연</div>
					<c:forEach var="l" items="${showRecentList}" begin="0" end="3" varStatus="status">
						<c:if test="${status.index ne 3}">
							<div class="main_pick_class" id="main_pick1">
								<img src="${pageContext.request.contextPath}/poster/${l.stitleimage}" id="main_pick_poster1">
								<div class="main_pick_name">${l.stitle}</div><br>
								<div class="main_pick_place">${l.sdetailaddress}</div>
								<div class="main_pick_date">${l.sopendate } ~ ${l.senddate }</div>
							</div>
						</c:if>
						<c:if test="${status.index eq 3}">
						<div class="main_pick_class" id="main_pick4">
							<img src="${pageContext.request.contextPath}/poster/${l.stitleimage}" id="main_pick_poster4">
							<div class="main_pick_name">${l.stitle}</div><br>
							<div class="main_pick_place">${l.sdetailaddress}</div>
							<div class="main_pick_date">${l.sopendate } ~ ${l.senddate }</div>
						</div>
						</c:if>
					</c:forEach>
				</div>
				<hr class="main_bar" id="main_bar_bottom" style="margin-top:50px;">
				<div id="main_last">
					<span class="main_bottom_ment"><img src="../icon/lupinlogo.png" id="main_logo"></span>
					<span class="main_bottom_ment">
						<span class="main_bottom_tagset">예매문의(1234-1234)</span>
						<a href="#" class="main_bottom_tagset">티켓판매제휴&nbsp;&nbsp;&nbsp;&nbsp;</a>
						<a href="#" class="main_bottom_tagset">예매가이드&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</span>
				</div>
				<hr class="main_bar" id="main_bar_bottom">
			</article>
		</section>
		<footer>
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
		<script>
			function showClock(){
				var currentDate = new Date();
				var main_comingsoon_time = document.getElementById("main_comingsoon_time");
				var apm = currentDate.getHours();
				if(apm < 12){
					apm="오전 ";
				}
				else{
					apm="오후 ";
				}
				
				var msg = "현재시각 <br>";
				msg += new Date().getFullYear() + "년 "; 
				msg += new Date().getMonth() + "월 ";
				msg += new Date().getDate() + "일<br>";
				msg += apm + (currentDate.getHours()) + "시 ";
				msg += currentDate.getMinutes() + "분 ";
				msg += currentDate.getSeconds() + "초";
				
				main_comingsoon_time.innerHTML = msg;
				
			}
			showClock();
			setInterval(showClock,1000);
		</script>
	</body>
</html>