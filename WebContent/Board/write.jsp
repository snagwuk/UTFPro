<%@page import="java.sql.Timestamp"%>
<%@ page import ="board.BoardDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>
</head>
<body>

<%     request.setCharacterEncoding("utf-8");    %>
   
<jsp:useBean id="article" class="board.BoardDataBean">
<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	article.setBoardid("1");
	article.setIp(request.getRemoteAddr());
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	BoardDao service = BoardDao.getInstance();
	service.insertArticle(article);
%>

</body>
</html>