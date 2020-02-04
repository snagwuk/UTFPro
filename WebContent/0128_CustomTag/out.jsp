<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Date"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<tf:out>
<jsp:body> <u>현재 시간</u>  은  <b>${dateEL}</b> 입니다.   </jsp:body>
</tf:out>
<br>
<tf:out>
<%= new Date() %><u>현재 시간</u>  은  <b>${dateEL}</b> 입니다.  
</tf:out>
</body>
</html>