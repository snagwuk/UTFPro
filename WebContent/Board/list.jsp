<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDataBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String boardid = "1"; 
BoardDao service = BoardDao.getInstance();
int count = service.getArticleCount(boardid);
List<BoardDataBean> li = service.getArticle(boardid);

Iterator x = li.iterator();
while(x.hasNext())
{
    %>
    	<%=x.next() %> <br>
    <%
}
%>

</body>
</html>