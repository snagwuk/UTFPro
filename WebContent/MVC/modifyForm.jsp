<%@page import="member.LogonDataBean"%>
<%@page import="member.LogonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	String id = (String)session.getAttribute("memId");
LogonDao manager = LogonDao.getInstance();
LogonDataBean c = manager.getMember(id);
try{
%>
<body>
<form method = "post" action="modify.jsp" name= "userinput" onSubmit="return checkIt()" >
	<table width="800" border ="1" cellpadding="0" cellspacing="3" align="center" > 
		<tr> 
			<td colspan="2" height="39" align="center"> <font size="+1"/><b>회원 정보 수정</b></font></td>
		</tr>
		<tr> 
			<td colspan="2" width="300"> <b>계정정보 입력</b></td>
		</tr>
		<tr> 
			<td width="300"> 사용자 ID</td>
			<td width="400"> <%= c.getId() %></td>
		</tr>
		<tr> 
			<td width="300"> 비밀번호</td>
			<td width="400"> <input type="password" name="passwd" size="15" maxlength="12"></td>
		</tr>
		<tr> 
			<td colspan="2" width="300" > <b>개인정보 입력</b></td>
			
		</tr>
		<tr> 
			<td width="300"> 사용자 이름</td>
			<td width="400"> <input type="text" name= "name" size="15" maxlength="10" value="<%=c.getName()%>"></td>
		</tr>
		<tr> 
			<td width="300"> 주민등록 번호</td>
			<td width="400"> <input type="text" name= "jumin1" size="7" maxlength="6" value="<%=c.getJumin1()%>">
			<input type="text" name= "jumin2" size="7" maxlength="6" value="<%=c.getJumin2()%>"></td>
		</tr>
		<tr> 
			<td width="300"> E-Mail</td>
			<td width="400"> <input type="text" name= "email" size="40" maxlength="30" value="<%=c.getEmail()%>"></td>
		</tr>
		<tr> 
			<td width="300"> Blog</td>
			<td width="400"> <input type="text" name= "blog" size="60" maxlength="50" value="<%=c.getBlog()%>"></td>
		</tr>
		<tr> 
			<td colspan="2" align="center">
			<input type="submit" name= "confirm" value="수   정" >
			<input type="reset" value="취소" OnClick="javascript:window.location='main.jsp'" >
			
		</tr>

	</table>
</form>
</body>
<%}catch(Exception e){
    
} %>
</html>