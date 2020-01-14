<%@page import="member.LogonDao"%>
<%@ page import ="member.LogonDataBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%     request.setCharacterEncoding("utf-8");    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String id = ((String)session.getAttribute("memId"));
	String passwd = request.getParameter("passwd");
	
	LogonDao manager = LogonDao.getInstance();
	int result = manager.deleteMember(id,passwd);
	if(id==null)
	{
	   %> 
	   <script type="text/javascript">
		alert("권한이 없습니다.");
		history.go(-1);
		</script>
		<%
	}
	else if(result == 1)
	{
   	 session.invalidate();

%> 
<form method="post" action="main.jsp">
<table class="w3-table-all w3-display-middle">
	<tr>
		<td height="39" align="center"> 성공적으로 탈퇴처리 되었습니다.</td>
		
	</tr>
	<tr>
	<td> 안녕히가세요
			<meta http-equiv="Refresh" content="5;url=main.jsp">
		</td>
	</tr>
	<tr>
		<td height="39" align="center">
		 <input type="submit" value="닫기"/>
		 </td>
	</tr>
</table>
</form>

		<% 
		} else { %>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
		</script>
		<%} %>
		



</body>
</html>