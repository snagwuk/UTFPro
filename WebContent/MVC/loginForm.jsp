
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 폼</title>
<script type="text/javascript">
function checkIt()
{
	var myform = eval("document.myform");
	if(!myform.id.value)
		{
		alert("아이디를 입력하세요"); myform.id.focus();
		return false;
		}
	if(!myform.passwd.value)
	{
	alert("패스워드를 입력하세요"); myform.passwd.focus();
	return false;
	}
}

function begin()
{
	document.myform.id.focus();
	
	}
</script>

</head>
<!-- <body onload="begin()"> -->
<body >
<div > 
<form method = "post" action="login.jsp" name= "myform" onSubmit="return checkIt()" >
	<table width="600" border ="1" cellpadding="0" cellspacing="3" align="center" > 
		<tr> 
			<td colspan="2" height="39" align="center"> <font size="+1"/><b>로그인</b></font></td>
		</tr>
		<tr> 
			<td width="200"> 아이디</td>
			<td width="400"> <input type="text" name= "id" size="10" maxlength="12">
		</tr>
		<tr> 
			<td width="200"> 비밀번호</td>
			<td width="400"> <input type="password" name="passwd" size="15" maxlength="12"></td>
		</tr>
		<tr> 
			<td colspan="2" align="center">
			<input type="submit" name= "confirm" value="로그인" >
			<input type="reset" name= "reset" value="다시입력" >
			<input type="button" value="회원가입" OnClick="javascript:window.location='inputForm.jsp'" >
			
		</tr>

	</table>
</form>
</div>
</body>
</html>