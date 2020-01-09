<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String memberID = request.getParameter("MEMBERID");
    String name =request.getParameter("name");
    int updateCount = 0;
   
	//jdbc 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = null;
	Statement stmt = null;
	
	try{
	    String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
	    String dbUser = "scott";
	    String dbPass = "1111";
	    String query = "update member set name ='" + name + "' where MEMBERID = '" + memberID +"'";
	    // 2. db 커넥션 생성
	    conn = DriverManager.getConnection(jdbcDriver, dbUser,dbPass);
	    // 3.Statement 생성
	    stmt = conn.createStatement();
	    // 4. 쿼리 실행
	   updateCount = stmt.executeUpdate(query);
	    
	}catch(SQLException ex){
	    out.println(ex.getMessage());
	    ex.printStackTrace();
	}finally{
	    if (stmt !=null) try{stmt.close();} catch(SQLException ex) {}
	    if (conn !=null) try{conn.close();} catch(SQLException ex) {}
	}
	
%>

<html>
<body>
<% if(updateCount > 0){ %>
<%= memberID %>의 이름을 <%=name %> 으로 변경
<% }else{ %>
<%=memberID %> 아이디가 존재하지 않음.
<%} %>
</body>
</html>