<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>티켓루팡 : 회원가입 인증</title>
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/Login_FI_FP_Join__.css">
    </head>
    <script>
	    function findId(){
	    	var name = document.getElementById("name");
	    	var email = document.getElementById("email");
	    	
	    	var namePattern = /^[a-zA-Z가-힣]/;
	    	var emailPattern = /^[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/;
	    	
			if (document.frm.mname.value == ""){
				alert("이름을 입력해주세요");
			  	document.frm.mname.focus();
			  	return;
		  	}else if (namePattern.test(name.value) == false){
			  	alert("이름을 다시 입력해주세요.");
			  	document.frm.mname.focus();
			  	return;
		  	}else if (document.frm.memail.value ==""){
			  	alert("이메일을 입력해주세요");
			  	document.frm.memail.focus();
			  	return;
		  	}else if (emailPattern.test(email.value) == false){
			  	alert("이메일 형식에 맞지 않습니다. 다시 입력해주세요.");
			  	document.frm.memail.focus();
			  	return;
		  	}
			 
		  	document.frm.action ="<%=request.getContextPath()%>/Member/findIdAction.do";
		  	document.frm.method = "POST";
		  	document.frm.submit(); 
		  	return;
		}
	</script>
    <body>
        <!-- header -->
        <div id="header">
            <a href="<%=request.getContextPath()%>/Main/MainPage.do" >
            	<img src="../icon/lupinlogo.png" id="logo">
            </a>
        </div>
		
		<!-- guide -->
		<br/>
		<h2 align="center">아이디 찾기</h2>
		<h3 align="center">회원님 성함과 가입하신 이메일 주소를 입력해주세요.</h3>
		<br/>		
		<br/>

        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">
             	<form name="frm">
                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20" placeholder="이름 입력" name="mname">
                    </span>
                    <span class="error_next_box"></span>
                </div>
                
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional"></span></label></h3>
           
					<span class="box int_email" id= "emailbox1" >
                        <input type="text" id="email" class="int" maxlength="100" placeholder="이메일 입력" name="memail">
                    </span>
                  
                    <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span> 
                   
                </div>
				

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin" onclick="findId()">
                        <span>아이디 찾기</span>
                    </button>
                </div>

                </form>

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
		<script src="../js/Find_ID_step1.js"></script>
    </body>
</html>