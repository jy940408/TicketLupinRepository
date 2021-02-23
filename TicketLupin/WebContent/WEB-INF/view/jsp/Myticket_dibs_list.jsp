<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>티켓 루팡</title>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/Nav_event.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Myticket_dibs.css">
	</head>
	<body>
		<header>
			<div id="h_title">
				<div id="h_title_inner">
					<span id="h_top_menu">
						<ul id="h_top_menu_ul">
							<li><a href="#">로그인&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
							<li><a href="#">회원가입&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
							<li><a href="#">고객센터&nbsp;&nbsp;|&nbsp;&nbsp;</a></li>
							<li><a href="#">이용안내&nbsp;&nbsp;&nbsp;&nbsp;</a></li><br>
						</ul>
						<img src="musicalads.png" id="h_ads">
					</span>
					<img src="lupinlogo.png" id="h_logo">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" id="h_search" placeholder="뮤지컬 〈캣츠〉 40주년 내한공연 앙코르－서울（Musical CATS Encore">
					<button type="submit" id="h_search_button"><img src="search.png" id="h_search_img"></button>
				</div>
			</div>
		</header>
		<hr id="nav_bar_top">
		<div id="n_nav_div">
			<nav id="main_nav">
				<a href="#" id="main_nav_home">홈</a>
				<a href="#" id="main_nav_concert">공연</a>
				<a href="#" id="main_nav_ranking">랭킹</a>
				<a href="#" id="main_nav_news">티켓오픈소식</a>
				<a href="#" id="main_nav_event">이벤트</a>
				<a href="#" id="main_nav_admin">마이티켓</a>
			</nav>
		</div>
		<hr id="nav_bar_bottom">
		
		
		<div class="wrap_nav" id="wrap_nav" style="display:none;">
			<div id="nav_menu_sub_div">
				<ul id="nav_menu_sub">
					<li><a href="#">마이홈</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a href="#">예매확인/취소</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a href="#">마이찜</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a href="#">할인쿠폰</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>
			</div>
			<hr id="nav_bar_sub"/>
		</div>
		
		<div class="wrap_nav"  id="wrap_nav2" style="display:none;">
			<div id="nav_menu_sub_div" class="main_nav_event">
				<ul id="nav_menu_sub2">
					<li><a href="#">전체 이벤트</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a href="#">당첨자 발표</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					<li><a href="#">참여이벤트</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>
			</div>
			<hr id="nav_bar_sub"/>
		</div>
		
		
		<section>
			<article>
				<div style="padding:30px;"></div>
				<div class="warp_tap">
					<div class="btns">
						<button class="btn_like" type="button">마이 찜</button>
					</div>
					<div class="box_list_date">
						<table border="1">
							<tr>
								<td width="57px"><a href="#">6개월</a></td>
								<td width="57px"><a href="#">12개월</a></td>
								<td width="57px"><a href="#">24개월</a></td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="cont">
					<div class="box_customer">
						
						<table class="table_list">
							<thead>
								<tr>
									<th width="10%"></th>
									<th width="48%">마이 찜 목록</th>
									<th width="17%">공연기간</th>
									<th width="15%"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>10</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>9</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>8</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>7</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>6</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>5</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>4</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>3</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>2</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
								<tr>
									<td>1</td>
									<td class="td_"><a href="#">[소리문화전당]명성황후</a></td>
									<td>2021.01.29 ~ 2021.03.01</td>
									<td>
										<button type="submit" value="cancel" class="td_button">삭제</button>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="paging">
							<a href="#"> << </a>&nbsp;&nbsp;<a href="#"> < </a>&nbsp;<span>&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;&nbsp; </span>&nbsp;<a href="#"> > </a>&nbsp;&nbsp;<a href="#"> >> </a>
						</div>
						<div class="cancel_notice">
							<h3>취소안내</h3>
							<ul>
								<li>예매상세에서 확인 및 취소를 진행하실 수 있습니다.</li>
								<li>배송이 시작된 경우 취소마감시간이전까지 티켓루팡 고객센터로 티켓을 반환해주셔야 환불이 가능하며, 도착일자 기준으로 취소 수수료가 부과됩니다.<br/>
									 &nbsp; (*단, 반환된 티켓의 배송료는 환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해 주시기 바랍니다.)	
								</li>
							</ul>
						</div>
					</div>
				</div>

			</article>
		</section>
		<footer>
				<hr class="f_bar" id="f_bar_bottom">
				<div id="f_last">
					<span class="f_bottom_ment"><img src="lupinlogo.png" id="f_logo"></span>
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