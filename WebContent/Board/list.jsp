<%@page import="java.text.SimpleDateFormat"%>
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
request.setCharacterEncoding("UTF-8");

int pageSize=3;

int currentPage=0;
try{
	//유효하지않으면 입셉션처리
	currentPage=Integer.parseInt(request.getParameter("pageNum"));
	session.setAttribute("pageNum",currentPage);
}catch(Exception e){
	if(session.getAttribute("pageNum")==null){
		session.setAttribute("pageNum",1);
	}
}	

currentPage=(int)session.getAttribute("pageNum");
BoardDao service=BoardDao.getInstance();
int count=service.getArticleCount(boardid);

int temp = count / pageSize + (count % pageSize == 0 ? 0 : 1);
if(currentPage > temp )
    currentPage = temp;

int startRow=(currentPage-1)*pageSize+1;
int endRow=startRow+pageSize-1;
List<BoardDataBean> li =service.getArticle(startRow,endRow, boardid);
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
int number=count-(currentPage-1)*pageSize;
%>




<p class="w3-left" style="padding-left:30px;">
</p>
<div class="w3-container">
<span class="w3-center w3-Large">
<h3> 게시판(전체글 :<%=count %>) : <%=session.getAttribute("pageNum") %></h3>
</span>
<p class="w3-right w3-padding-right-Large"> <a href="writeForm.jsp">글쓰기</a></p>
<%
	if(count == 0) {
%>
<table class="table-bordered" width="700">
<tr class="w3-grey">
	<td align="center"> 게시판에 저장된 글이 없습니다.</td>
</tr>
</table>
<%
	} else {
%>
<table class="w3-table-all" border="1">
<tr class="w3-orange">
	<td align="center"> 번호</td>
	<td align="center"> 제목</td>
	<td align="center"> 작성자</td>
	<td align="center"> 작성일</td>
	<td align="center"> 조회</td>
	<td align="center"> IP</td>
</tr>
<%
	for(int i = 0; i < li.size(); i++) 
	{
	    BoardDataBean article = (BoardDataBean)li.get(i);

%>
	<tr class="w3-yellow">
		<td align="center"> <%=number-- %></td>
		<td align="center">
		<%
			int wid = 0;
		if(article.getRe_level() > 0) {
		    wid = 10 * (article.getRe_level());
		
		%>
		<img src="<%=request.getContextPath()%>/img/level.gif" width="<%=wid %>" height="16">
		<img src="<%=request.getContextPath()%>/img/re.gif">
		<%} else { %>
		<img src="<%=request.getContextPath()%>/img/level.gif" width="<%=wid %>" height="16">
		<%} %>
		 <a href="<%=request.getContextPath()%>/Board/content.jsp?pageNum=<%=session.getAttribute("pageNum")%>&num=<%=article.getNum()%>"><%=article.getSubject() %></td>
		<td align="center"> <%=article.getWriter() %></td>
		<td align="center"> <%=sdf.format(article.getReg_date())%></td>
		<td align="center"> <%=article.getReadcount() %></td>
		<td align="center"> <%=article.getIp() %></td>
	</tr>
<%
	}
%>


</table>

<p align="center">
<%
int bottomLine = 3;
int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
int startPage = 1 + (currentPage - 1)  / bottomLine * bottomLine;
int endPage = startPage + bottomLine - 1;
if(endPage > pageCount ) 
    endPage = pageCount;

if(startPage > bottomLine)
{
    %>
     <a  href="list.jsp?pageNum=<%=startPage-bottomLine%>">[이전]</a>
    <%
}

for(int i = startPage; i <= endPage; i++)
{
    %>
    
    <a  href="list.jsp?pageNum=<%=i%>"><%=i %></a>
    
    
<%
	}if(endPage < pageCount)
	{
	    %>
	     <a  href="list.jsp?pageNum=<%=startPage+bottomLine%>">[다음]</a>
	    <%
	}
%>


</p>

<%
	}
%>

</div>


</body>
</html>
