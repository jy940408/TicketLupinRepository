<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
	<head>
		<title>티켓루팡</title>
		<link rel="stylesheet" href="../css/Notice_write_admin.css">
		<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>	
		<script src="<%=request.getContextPath()%>/js/Nav_event.js"></script>
		<script src="<%=request.getContextPath() %>/js/Nav_all.js"></script>
		<script type="text/javascript">
			function regist(){
				
				$(document).ready(function(){
				
					if(document.frm.ntitle.value == ""){
						
						alert("제목을 입력해주세요");
						document.frm.ntitle.focus();
						return false;
						
					}else if(document.frm.ncontent.value == ""){
						
						alert("내용을 입력해주세요");
						document.frm.ncontent.focus();
						return false;
						
					}else{
						
						var conf = confirm("등록하시겠습니까?");
				
						if(conf == true){
							
							document.frm.action ="../Customer/NoticeWriteAction.do";
							document.frm.method = "get";
							document.frm.submit();
							return;
							
						}else if(conf == false){
							
							return false;
						}
					}
				});	
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
				<form name="frm">
					<table class="notice_table" style="border:1px solid; border-collapse:collapse;">
						<colgroup>
							<col width="50px"/>
							<col width="35px"/>
							<col width="1000px"/>
							<col width="85px"/>
							<col width="68px"/>
						</colgroup>
						<tr>
							<th style="border:1px solid;">제목</th>
							<td colspan="2" style="border:1px solid;">
								<input type="text" name="ntitle" class="title" maxlength="100" style="border:0px; font-size:16.1px; width:99%" autocomplete="off">
							</td>
							<th style="border:1px solid;">공지유형</th>
							<td style="border:1px solid;">
								<center>
									<select class="type" style="border:0px; font-size:15px;" name="ncategory">
										<option name="ncategory">서비스 소식</option>
										<option name="ncategory">서비스 오픈</option>
										<option name="ncategory">서비스 종료</option>
										<option name="ncategory">서비스 점검</option>
										<option name="ncategory">안내</option>
									</select>
								</center>
							</td>
						</tr>
						<tr>
							<td colspan="5">
								<center>
									<textarea name="ncontent" class="content" style="width:99%; height:500px; border:0px; font-size:15px; resize:none; overflow-x:hidden;" placeholder="내용을 입력해주세요."></textarea>
								</center>
							</td>
						</tr>
					</table>
					<div class="reg">
						<button type="button" class="reg_btn" onclick="regist(); return false;">등록</button>
					</div>
					</form>
					<div class="list">
						<button class="list_btn" onclick="location.href='../Customer/NoticeList.do'">
							목록으로
						</button>
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