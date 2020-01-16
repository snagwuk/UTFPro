<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%     request.setCharacterEncoding("utf-8");    %>

<jsp:useBean id="article" class="board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>
<%
System.out.println(article);

	BoardDao service = BoardDao.getInstance();
	int check = service.updateArticle(article);

	if(check == 1) {	
%>
	<meta http-equiv="Refresh" content="0;url=list.jsp">

<% }else{ %>
	<script >
		alert("비밀번호가 맞지않습니다.");
		history.go(-1);
	</script>
<%} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>