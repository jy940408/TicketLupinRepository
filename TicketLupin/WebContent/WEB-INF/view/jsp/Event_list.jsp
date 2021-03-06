<%@ page import="com.TicketLupin.web.service.*"%>
<%@ page import="domain.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	ArrayList<EventVo> alist = (ArrayList<EventVo>) request.getAttribute("alist"); 
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	
	List<EventVo> list = (List<EventVo>) request.getAttribute("list");
	List<EventVo> list2 = (List<EventVo>) request.getAttribute("list2");
	EventVo eventvo = new EventVo();
%>

<!DOCTYPE html>
<html>
	<head>
		<title>티켓 루팡</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/Event_list.css">
		<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/Event_list.js"></script>
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
		
<!------------------------------------------------------------------------------------------------------------------------------------->		
		
		<script>
			function search(){
				frm.action="<%=request.getContextPath()%>/Event/EventMain.do";
				frm.method="get";
				frm.submit();
			}
		</script>
		<section>
			<article>
				<div id="main_eventlist_all">
					
					<c:if test="${sessionScope.mgrade eq 'M'}">
						<div id="manage_write_div">
							<a href="<%=request.getContextPath()%>/Event/EventWrite.do" id="manage_write">작성하기</a>
						</div>
					</c:if>
					<c:if test="${sessionScope.mgrade eq 'G'}">
						<div id="manage_write_div">
						</div>
					</c:if>
					<c:if test="${empty sessionScope.mgrade}">
						<div id="manage_write_div">
						</div>
					</c:if>
				
					<div id="main_banner_set">
				
				<% 
					if (eventvo.getEcategory() == null) {
						for(EventVo evo : list){ 
				%>
						<div class="main_event_banner" id="main_event_banner_main">
							<a href="<%=request.getContextPath()%>/Event/EventView.do?eidx=<%=evo.getEidx()%>" class="main_evenet_list_a">
								<img id="main_event_banner_main_img" src="<%=request.getContextPath()%>/image/<%=evo.getEthumbnail() %>">
								<div id="main_event_banner_main_ment"><%=evo.getEtitle() %></div>
							</a>
						</div>
				<% 		}
					}else { %>	
						<div class="main_event_banner" id="main_event_banner_main">
							<a href="#" class="main_evenet_list_a">아니라면..........</a>
						</div>
					
				<% } %>
				
				<% 
					if (eventvo.getEcategory() == null) {
						for(EventVo evo2 : list2){ 
				%>
						<div class="main_event_banner" id="main_event_banner_sub">
							<a href="<%=request.getContextPath()%>/Event/EventView.do?eidx=<%=evo2.getEidx()%>" class="main_evenet_list_a">
								<img id="main_event_banner_sub_img" src="<%=request.getContextPath()%>/image/<%=evo2.getEthumbnail() %>">
								<div id="main_event_banner_sub_ment"><%=evo2.getEtitle() %></div>
							</a>
						</div>
					
					
				<% 		}
					}else {
				%>	
						<div class="main_event_banner" id="main_event_banner_sub">
							<a href="#" class="main_evenet_list_a"></a>
							<div id="main_event_banner_sub_ment"></div>
						</div>
					
				<% } %>
					
					</div>
					
					
					<div id="main_search_set">
						<form id="main_search_form" name="frm">
							<input type="text" name="keyword" id="main_search_text" placeholder="&nbsp;&nbsp;이벤트 검색">
							<button id="main_search_button" onclick="search();">검색</button>
						</form>
					</div>
					
				
				
					<div id="main_event_list_set">
						<ul id="main_evenet_list">
						<% for(EventVo ev : alist) { %>
							<li class="main_evenet_list_li">
								<div class="main_evenet_list_div" id="main_evenet_list_1">
									<a href="<%=request.getContextPath()%>/Event/EventView.do?eidx=<%=ev.getEidx()%>" class="main_evenet_list_a">
										<img class="main_evenet_list_img" src="<%=request.getContextPath()%>/image/<%=ev.getEthumbnail() %>">
										<div style="font-size:18px;"><%=ev.getEtitle() %></div>
									</a>
									<div class="main_event_list_detail">
										<span>이벤트 기간: <%=ev.getEstart() %> ~ <%=ev.getEend() %></span><br>
										<span>당첨혜택: </span><br>
										<span>당첨자 발표일: </span>
									</div>
									<input type="hidden" name="edelyn" value="<%=ev.getEdelyn() %>">
								</div>
							</li>
						<% } %>	
						</ul>
					</div>
			
		  
					<div id="main_event_page">
						<div id="main_event_page_set">
							<%if (pm.isPrev() == true) { %>
							
								<a href="<%=request.getContextPath()%>/Event/EventMain.do?page=<%=pm.getStartPage()-1%>
								&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">
									&lt;
								</a>
							<% } %>
							
							<div class="main_event_page_bn">
								<div class="main_event_page_button_page">
									<% for (int i=pm.getStartPage(); i<=pm.getEndPage(); i++){ %>
										<a href="<%=request.getContextPath()%>/Event/EventMain.do?page=<%=i%>&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">
											<%=i%>
										</a>	
									<% } %>
								</div>
							</div>
						
							<%if (pm.isNext() && pm.getEndPage() > 0) { %>
							
								<a href="<%=request.getContextPath()%>/Event/EventMain.do?page=<%=pm.getEndPage()+1%>
								&keyword=<%=pm.encoding(pm.getScri().getKeyword())%>">
									&gt;
								</a>
							
							<% } %>
						</div>
					</div>
				</div>
			</article>
		</section>
		
<!------------------------------------------------------------------------------------------------------------------------------------->

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
