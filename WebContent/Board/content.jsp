<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));

BoardDao dbPro = BoardDao.getInstance();
BoardDataBean article = dbPro.getArticle(num);



%><%=article %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container w3-display-topmiddle">
<br><br> <p align="center">글내용 보기 <%=session.getAttribute("pageNum") %></p>
<table class = "w3-table-all">
<tr>
	<td align="center">글번호</td>
	<td align="center"><%=article.getNum()%></td>
</tr>
<tr>
	<td align="center">조회수</td>
	<td align="center"><%=article.getReadcount()%></td>
</tr>
<tr height="30">
	<td align="center">작성자</td>
	<td align="center"><%=article.getWriter()%></td>
</tr>
<tr>
	<td align="center">작성일</td>
	<td align="center"><%=article.getReg_date()%></td>
</tr>

<tr height="30">
	<td align="center">글제목</td>
	<td align="center" colspan="3"><%=article.getSubject()%></td>
</tr>
<tr  height="30">
	<td align="center">글내용</td>
	<td align="left" colspan="3"><pre><%=article.getContent()%></pre></td>
</tr>
<tr  height="30">
	<td align="center">첨부파일</td>
	<td align="left" colspan="3"><img alt="" src="<%=request.getContextPath()%>/uploadFile/<%=article.getFilename()%>"></td>
</tr>
<tr height="30">
	<td colspan="4" class="w3-center">
	<input type="button" value="글수정" onClick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>'">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="글삭제" onClick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>'">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="답글쓰기" onClick="document.location.href='writeForm.jsp?num=<%=article.getNum()%>&ref=<%=article.getRef()%>&re_level=<%=article.getRe_level()%>&re_step=<%=article.getRe_step()%>'">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="글목록" onClick="document.location.href='list.jsp'">
	 </td>
</tr>
</table>

</div>
</body>
</html>