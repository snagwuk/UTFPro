<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EMP목록</title>
</head>
<body>
EMP 테이블의 내용
<table width="100%" border ="1">
<tr>
	<td>empno</td> <td>ename</td> <td>job</td>
</tr>
<% 
	//jdbc 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
	    String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
	    String dbUser = "scott";
	    String dbPass = "1111";
	    String query = "select empno,ename,job from emp";
	    // 2. db 커넥션 생성
	    conn = DriverManager.getConnection(jdbcDriver, dbUser,dbPass);
	    // 3.Statement 생성
	    stmt = conn.createStatement();
	    // 4. 쿼리 실행
	    rs = stmt.executeQuery(query);
	    
	    while(rs.next())
	    {
	        %>
	      	<tr>
				<td><%=rs.getInt("empno") %></td> 
				<td><%=rs.getString("ename") %></td>
				<td><%=rs.getString("job") %></td>
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