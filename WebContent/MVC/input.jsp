<%@page import="member.LogonDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import ="member.LogonDataBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
    <%     request.setCharacterEncoding("utf-8");    %>
   
<jsp:useBean id="member" class="member.LogonDataBean">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<%
member.setReg_date(new Timestamp(System.currentTimeMillis()));
LogonDao manager = LogonDao.getInstance();
manager.insertMember(member);
response.sendRedirect("index.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=member%>
</body>
</html>