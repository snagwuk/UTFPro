<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function checkIt()
{
	var userinput = eval("document.userinput");
	if(!userinput.id.value)
		{
		alert("아이디를 입력하세요"); userinput.id.focus();
		return false;
		}
	if(!userinput.passwd.value)
	{
	alert("패스워드를 입력하세요"); userinput.passwd.focus();
	return false;
	}
	if(userinput.passwd.value != userinput.passwd2.value)
	{
	alert("패스워드를 동일하게입력하세요");
	return false;
	}
	if(!userinput.name.value)
	{
	alert("이름를 입력하세요"); userinput.name.focus();
	return false;
	}
	if(!userinput.jumin1.value)
	{
	alert("주민번호 앞자리를 입력하세요"); userinput.jumin1.focus();
	return false;
	}
	if(!userinput.jumin2.value)
	{
	alert("주민번호 뒷자리를 입력하세요"); userinput.jumin2.focus();
	return false;
	}
	if(!userinput.email.value) 
	{
	alert("이메일을 입력하세요"); userinput.email.focus();
	return false;
	}
	
	}
	
	
	function openConfirmid(userinput)
	{
		if (userinput.id.value == "")
			{
				alert("아이디를 입력하세요");
				return;
			}
		
		url = "confirmId.jsp?id=" + userinput.id.value ;
		
		open(url, "confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}

</script>
</head>
<body>
<form method = "post" action="input.jsp" name= "userinput" onSubmit="return checkIt()" >
	<table width="600" border ="1" cellpadding="0" cellspacing="3" align="center" > 
		<tr> 
			<td colspan="2" height="39" align="center"> <font size="+1"/><b>회원가입</b></font></td>
		</tr>
		<tr> 
			<td width="200"> <b>계정정보 입력</b></td>
			<td width="400"> &nbsp;</td>
		</tr>
		<tr> 
			<td width="200"> 사용자 ID</td>
			<td width="400"> <input type="text" name= "id" size="10" maxlength="12">
			<input type="button" value="ID중복확인" name="confirm_id" OnClick="openConfirmid(this.form)"></td>
		</tr>
		<tr> 
			<td width="200"> 비밀번호</td>
			<td width="400"> <input type="password" name="passwd" size="15" maxlength="12"></td>
		</tr>
		<tr> 
			<td width="200"> 비밀번호 확인</td>
			<td width="400"> <input type="password" name= "passwd2" size="15" maxlength="12"></td>
		</tr>
		<tr> 
			<td width="200"> <b>개인정보 입력</b></td>
			<td width="400"> &nbsp;</td>
		</tr>
		<tr> 
			<td width="200"> 사용자 이름</td>
			<td width="400"> <input type="text" name= "name" size="15" maxlength="10"></td>
		</tr>
		<tr> 
			<td width="200"> 주민등록 번호</td>
			<td width="400"> <input type="text" name= "jumin1" size="7" maxlength="6">
			-<input type="text" name= "jumin2" size="7" maxlength="6"></td>
		</tr>
		<tr> 
			<td width="200"> E-Mail</td>
			<td width="400"> <input type="text" name= "email" size="40" maxlength="30"></td>
		</tr>
		<tr> 
			<td width="200"> Blog</td>
			<td width="400"> <input type="text" name= "blog" size="60" maxlength="50"></td>
		</tr>
		<tr> 
			<td colspan="2" align="center">
			<input type="submit" name= "confirm" value="등     록" >
			<input type="reset" name= "reset" value="다시입력" >
			<input type="button" value="가입안함" OnClick="javascript:window.location='main.jsp'" >
			
		</tr>
		
		
		
		
		
	</table>
</form>
</body>
</html>