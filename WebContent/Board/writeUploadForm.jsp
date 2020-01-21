<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>writeForm</title>
</head>
<body>
	<p class="w3-left" style="padding-left: 30px;">
	<div class="w3-container">
		<b>글쓰기</b><br>

		<%
		    int num = 0, ref = 1, re_step = 0, re_level = 0;
		    if (request.getParameter("num") != null)
		    {
		        num = Integer.parseInt(request.getParameter("num"));
		        ref = Integer.parseInt(request.getParameter("ref"));
		        re_step = Integer.parseInt(request.getParameter("re_step"));
		        re_level = Integer.parseInt(request.getParameter("re_level"));
		    }
		%>
		<form method="post"
			action="<%=request.getContextPath()%>/Board/writeUpload.jsp"
			name="writeForm"
			enctype="multipart/form-data"> <!-- 업로드에 필수 !!-->
			<input type="hidden" name="num" value="<%=num%>"> <input
				type="hidden" name="ref" value="<%=ref%>"> <input
				type="hidden" name="re_step" value="<%=re_step%>"> <input
				type="hidden" name="re_level" value="<%=re_level%>">
			<table class="w3-table-all" style="width: 70%;">
				<tr>
					<td colspan="2" align="right"><a
						href="<%=request.getContextPath()%>/Board/list.jsp">글목록</a></td>
				</tr>
				<tr>
					<td align="center" width="70">이름</td>
					<td width="330"><input type="text" size="10" maxlength="10"
						name="writer"></td>
				</tr>
				<tr>
					<td align="center" width="70">제목</td>
					<td width="330">
						<%
						    if (request.getParameter("num") == null)
						    {
						%> <input type="text" size="40" maxlength="50" name="subject">
						<%
							     }
							     else
							     {
 %> 
 				<input type="text" size="40" maxlength="50" name="subject" value="답글 "> <%
						    }
						%>
					</td>
				</tr>
				<tr>
					<td align="center" width="70">Email</td>
					<td width="330"><input type="text" size="40" maxlength="30"
						name="email"></td>
				</tr>
				<tr>
					<td align="center" width="70">내용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea></td>
				</tr>
				
				<tr>
					<td align="center" width="70">file</td>
					<td width="330"><input type="file" size="40" maxlength="30"
						name="uploadfile"></td>
				</tr>
				
				<tr>
					<td align="center" width="70">비밀번호</td>
					<td width="330"><input type="password" size="8" maxlength="12"
						name="passwd"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" name="confirm" value="글 쓰 기"> <input
						type="reset" name="reset" value="다시작성"> <input
						type="button" value="목록보기"
						OnClick="window.location='<%=request.getContextPath()%>/Board/list.jsp'">
					</td>
				</tr>

			</table>
		</form>


	</div>
</body>
</html>