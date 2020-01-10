<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MEMBER목록</title>
</head>
<body>
MEMBER 테이블의 내용
<table width="100%" border ="1">
<tr>
	<td>이름</td> <td>아이디</td> <td>이메일</td>
</tr>
<% 
	//jdbc 드라이버 로딩
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
	    String jdbcDriver = "jdbc:apache:commons:dbcp:dbpool";
	    String query = "select * from MEMBER order by MEMBERID";
	    // 2. db 커넥션 생성
	    conn = DriverManager.getConnection(jdbcDriver);
	    // 3.Statement 생성
	    stmt = conn.createStatement();
	    // 4. 쿼리 실행
	    rs = stmt.executeQuery(query);
	    
	    while(rs.next())
	    {
	        %>
	      	<tr>
				<td><%=rs.getString("NAME") %></td> 
				<td><%=rs.getString("MEMBERID") %></td>
				<td><%=rs.getString("EMAIL") %></td>
			</tr>
	        <% 
	    }
	}catch(SQLException ex){
	    out.println(ex.getMessage());
	    ex.printStackTrace();
	}finally{
	    if (rs !=null) try{rs.close();} catch(SQLException ex) {}
	    if (stmt !=null) try{stmt.close();} catch(SQLException ex) {}
	    if (conn !=null) try{conn.close();} catch(SQLException ex) {}
	}
	
%>

</table>
</body>
</html>