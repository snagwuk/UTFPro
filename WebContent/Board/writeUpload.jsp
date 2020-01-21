<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="board.BoardDataBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.sql.Timestamp"%>
<%@ page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>
</head>
<body>

	<%    
	
	request.setCharacterEncoding("utf-8");   
	
	String realFolder = "";
	String saveFolder = "uploadFile";
	String encType="UTF-8";
	int maxSize = 10*1024*1024;
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	try{
	    
	    MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	    BoardDataBean article = new BoardDataBean();
	    Enumeration files = multi.getFileNames();
	    if(files.hasMoreElements())
	    {
	        String name = (String)files.nextElement();
	        File file = multi.getFile(name);
	        article.setFilename(file.getName());
	        article.setFilesize((int)file.length());
	        
	    }
	    else
	    {
	        article.setFilename("");
	        article.setFilesize(0);
	    }
	    
	    article.setNum(Integer.parseInt(multi.getParameter("num")));
	    article.setRef(Integer.parseInt(multi.getParameter("ref")));
	    article.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
	    article.setRe_level(Integer.parseInt(multi.getParameter("re_level")));
	    
	    article.setWriter(multi.getParameter("writer"));
	    article.setContent(multi.getParameter("content"));
	    article.setPasswd(multi.getParameter("passwd"));
	    article.setSubject(multi.getParameter("subject"));
	    article.setEmail(multi.getParameter("email"));
	    article.setBoardid((String)session.getAttribute("boardid"));
	    article.setIp(request.getRemoteAddr());
	    
	    BoardDao service = BoardDao.getInstance();
	    service.insertArticle(article);
	}catch(Exception e)
	{
	    e.printStackTrace();
	}
	response.sendRedirect(request.getContextPath() +"/Board/list.jsp");

%>
<!-- <meta http-equiv="Refresh" content="0;url=list.jsp"> -->
</body>
</html>