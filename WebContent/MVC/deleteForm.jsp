<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	String id = (String)session.getAttribute("memId");
LogonDao manager = LogonDao.getInstance();
LogonDataBean c = manager.getMember(id); 
try{
%>
<body>
<form method = "post" action="delete.jsp" name= "userinput"  >
	<table width="800" border ="1" cellpadding="0" cellspacing="3" align="center" > 
		<tr> 
			<td colspan="2" height="39" align="center"> <font size="+1"/><b>회원 탈퇴</b></font></td>
		</tr>
		<tr> 
			<td width="300"> 사용자 ID</td>
			<td width="400"> <%= id %></td>
		</tr>
		<tr> 
			<td width="300"> 비밀번호</td>
			<td width="400"> <input type="password" name="passwd" size="15" maxlength="12"></td>
		</tr>
		<tr> 
			<td colspan="2" align="center">
			<input type="submit" name= "confirm" value="삭  제" >
			<input type="reset" value="취소" OnClick="javascript:window.location='main.jsp'" >
			
		</tr>

	</table>
</form>
</body>
<%}catch(Exception e){
    
} %>
</html>