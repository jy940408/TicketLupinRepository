﻿/*--------------------------------------------------------------------------------------------------------------------------------------*/

$(document).ready(function(){
$(".main_nav_all").hide();
	$("#main_nav_event").mouseover(function(){
		$(".main_nav_all").hide();
		$("#nav_menu_sub_event_div").slideDown(500)
	});
	$("#nav_menu_sub_event_div").click(function(){
		$("#nav_menu_sub_event_div").slideUp(500)
	});
	$("#main_nav_myticket").mouseover(function(){
		$(".main_nav_all").hide();
		$("#nav_menu_sub_myticket_div").slideDown(500)
	});
	$("#nav_menu_sub_myticket_div").click(function(){
		$("#nav_menu_sub_myticket_div").slideUp(500)
	});
	$("#main_nav_home").mouseover(function(){
		$(".main_nav_all").slideUp(500)
	});
	$("#main_nav_concert").mouseover(function(){
		$(".main_nav_all").slideUp(500)
	});
	$("#main_nav_ranking").mouseover(function(){
		$(".main_nav_all").slideUp(500)
	});
	$("#main_nav_news").mouseover(function(){
		$(".main_nav_all").slideUp(500)
	});
});

/*--------------------------------------------------------------------------------------------------------------------------------------*/

document.getElementById('ul_list').style.display = 'none';
			
function nowranking(){
	if(document.getElementById('ul_list').style.display == 'none'){
		document.getElementById('ul_list').style.display = 'block';
	}else{
		document.getElementById('ul_list').style.display = 'none';
	}
}

/*--------------------------------------------------------------------------------------------------------------------------------------*/



/*--------------------------------------------------------------------------------------------------------------------------------------*/



/*--------------------------------------------------------------------------------------------------------------------------------------*/



/*--------------------------------------------------------------------------------------------------------------------------------------*/