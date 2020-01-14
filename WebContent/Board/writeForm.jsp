<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>writeForm</title>
</head>
<p class="w3-left" style="padding-left:30px;">
<div class="w3-container">
<b>글쓰기</b><br>
<form method = "post" action="write.jsp" name= "writeForm" >
	<table class="w3-table-all" style="width:70%;" > 
		<tr> 
			<td colspan="2"  align="right"> <a href="list.jsp">글목록</a></td>
		</tr>
		<tr> 
			<td  align="center" width="70"> 이름</td>
			<td width="330"> <input type="text" size="10" maxlength="10" name="writer">		</td>
		</tr>
		<tr> 
			<td  align="center" width="70"> 제목</td>
			<td width="330"> <input type="text" size="40" maxlength="50" name="subject">		</td>
		</tr>
		<tr> 
			<td  align="center" width="70"> Email</td>
			<td width="330"> <input type="text" size="40" maxlength="30" name="email">		</td>
		</tr>
		<tr> 
			<td  align="center" width="70"> 내용</td>
			<td width="330"> <textarea name="content" rows="13" cols="40"></textarea></td>
		</tr>
		<tr> 
			<td  align="center" width="70"> 비밀번호</td>
			<td width="330"> <input type="password" size="8" maxlength="12" name="passwd">		</td>
		</tr>
		<tr> 
			<td colspan="2" align="center">
			<input type="submit" name= "confirm" value="글 쓰 기" >
			<input type="reset" name= "reset" value="다시작성" >
			<input type="button" value="목록보기" OnClick="window.location='list.jsp'" >
			</td>
		</tr>

	</table>
</form>


</div>
<body>

</body>
</html>