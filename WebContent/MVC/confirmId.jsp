<%@page import="member.LogonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    
    LogonDao manager = LogonDao.getInstance();
    int check = manager.confirmId(id);
    
  %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<% if(check == 1) { %>

<table width="270" border="0" cellpadding="0" cellspacing="5">
	<tr>
		<td height="39"> <%=id%>는 이미 사용중인 아이디입니다.</td>
	</tr>
</table>

<form name="checkForm" method="post" action="confirmId.jsp">
<table width="270" border="0" cellpadding="0" cellspacing="5">
	<tr>
		<td align="center"> 
		다른아이디를 입력하세요 <p>
		<input type="text" size="10" maxlength="12" name="id">
		<input type="submit" value="ID중복확인">
		
		</td>
	</tr>
</table>
</form>

<%} else {%>
<table width="270" border="0" cellpadding="0" cellspacing="5">
	<tr>
		<td align="center"> 
		<p>입력하신 <%=id%> 는 사용가능한 아이디입니다.</p>
		<input type="button" value="닫기" onclick="setid()">
		</td>
	</tr>
</table>
<%} %>

</body>

<script >
function setid()
{
	opener.document.userinput.id.value="<%=id%>";
	self.close();
	}
</script>
</html>