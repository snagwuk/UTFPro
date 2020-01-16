<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    String passwd = request.getParameter("passwd");
    
   
    
    BoardDao service = BoardDao.getInstance();
	int check = service.deleteArticle(num,passwd);

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