<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<script> 
			document.location.replace("<%=request.getContextPath()%>/Main/MainPage.do");
		</script>
	</body>
</html>
