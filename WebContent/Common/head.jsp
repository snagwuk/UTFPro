<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script >
window.onload = function()
{
	var atag = document.getElementsByTagName("a");
	var url = document.location.href.split("/");
	//alert(url[url.length-1]);
	if(url[url.length-1] == "main.jsp")
		atag[0].className += " w3-red";
	else if (url[url.length-1] == "index.jsp")
		atag[1].className += " w3-red";
	else if (url[url.length-1] == "inputForm.jsp")
		atag[4].className += " w3-red";
	else if (url[url.length-1] == "loginForm.jsp")
		atag[7].className += " w3-red";
	
}
</script>
</head>
<body>
<div class="w3-bar w3-green w3-Large">
<a href="<%=request.getContextPath() %>/MVC/main.jsp" class="w3-bar-item w3-button"> HOME </a>
<a href="<%=request.getContextPath() %>/MVC/index.jsp" class="w3-bar-item w3-button"> 공지사항 </a>
<a href="<%=request.getContextPath() %>/2#" class="w3-bar-item w3-button"> 자유게시판 </a>
<a href="<%=request.getContextPath() %>/3#" class="w3-bar-item w3-button"> Q&A </a>
<a href="<%=request.getContextPath() %>/MVC/inputForm.jsp" class="w3-bar-item w3-button"> 회원가입 </a>
<a href="<%=request.getContextPath() %>/#" class="w3-bar-item w3-button"> BarGraph </a>
<a href="<%=request.getContextPath() %>/#" class="w3-bar-item w3-button"> WordCloud </a>
<a href="<%=request.getContextPath() %>/MVC/loginForm.jsp" class="w3-bar-item w3-button"> 로그인 </a>
<% if (session.getAttribute("memId") != null) {%>
<a href="<%=request.getContextPath() %>/MVC/logout.jsp"class="w3-bar-item w3-button"> <%= session.getAttribute("memId") %> 님  로그아웃 </a>
<% } %>
</div>
</body>
</html>