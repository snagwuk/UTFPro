<%@page import="member.LogonDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

LogonDao manager = LogonDao.getInstance();
int check = manager.userCheck(id,passwd);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(check==1) {
    session.setAttribute("memId", id);
	//response.sendRedirect("main.jsp");
    response.sendRedirect(request.getContextPath()+"/MVC/main.jsp");
}
else if (check == 0) {
%>
<script type="text/javascript">
	alert("비밀번호가 맞지않습니다.");
	history.go(-1);
</script>
<%
} else {
%>

<script type="text/javascript">
	alert("아이디가 맞지않습니다.");
	history.go(-1);
</script>
<%
} 
%>
</body>
</html>