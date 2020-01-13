<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
     if (session.getAttribute("memId") == null) {
         response.sendRedirect(request.getContextPath()+"/MVC/loginForm.jsp");
     }
     else {
   
         
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w3-contaioner">
<table class="23-table-all">
<tr>
	<td width="300" height="20">하하하</td>
	<td rowspan="3" align="center">
	<%=session.getAttribute("memId") %>님이 <br>방문하셨습니다. 
	
	<form method="post" action="logout.jsp">
	<input type="submit" value="로그아웃"> 
	<input type="button" value="회원정보변경 " onclick="javascript:window.location='<%=request.getContextPath() %>/MVC/modifyForm.jsp'">
	</form>
	</td>
	
</tr>
<tr>
	<td rowspan="2" width="300"> 메인입니다. </td>
</tr>

</table>
</div>
<%} %>
</body>
</html>