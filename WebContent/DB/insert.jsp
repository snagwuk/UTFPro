<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf-8");
    String memberID = request.getParameter("MEMBERID");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    
    int insertCount = 0;
    
    //jdbc 드라이버 로딩
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try
    {
        String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
        String dbUser = "scott";
        String dbPass = "1111";
        //String query = "insert into member values('" + memberID + "' ,'"+password+"','" + name+"','" + email + "')";        
        // 2. db 커넥션 생성
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        // 3.Statement 생성
        pstmt = conn.prepareStatement("insert into member values(?,?,?,?)");
        // 4. 쿼리 실행
        pstmt.setString(1, memberID);
        pstmt.setString(2, password);
        pstmt.setString(3, name);
        pstmt.setString(4, email);
        pstmt.executeUpdate();
        
    }
    catch (SQLException ex)
    {
        out.println(ex.getMessage());
        ex.printStackTrace();
    }
    finally
    {
        if (pstmt != null) try
        {
            pstmt.close();
        }
        catch (SQLException ex)
        {
        }
        if (conn != null) try
        {
            conn.close();
        }
        catch (SQLException ex)
        {
        }
    }
%>

<html>
<body>
	
	<%=memberID%> / <%=password%> / <%=name%> / <%=email%> 삽입완료
	
</body>
</html>