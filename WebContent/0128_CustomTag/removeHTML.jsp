<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="dateEL" value="<%=new Date() %>"/>
<tf:removeHTML trim="true">
	<font size="10">       현재 <style>시간</style>은${dateEL}입니다.         </font>
	</tf:removeHTML>
	<br>
	<tf:removeHTML length="15" trail="..." trim="true">
	<u>현재 시간</u>  은  <b>${dateEL}</b> 입니다.  
	</tf:removeHTML>
	<br>
	<tf:removeHTML length="15">
	<jsp:body><u>현재 시간</u>  은  <b>${dateEL}</b> 입니다.  </jsp:body>
	</tf:removeHTML>
	
	
</body>
</html>