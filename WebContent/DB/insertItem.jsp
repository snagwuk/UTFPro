<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
   
    
    String idValue = request.getParameter("id");
   
    //jdbc 드라이버 로딩
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = null;
    PreparedStatement pstmtITem = null;
    PreparedStatement pstmtDetail = null;
    
    String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
    String dbUser = "scott";
    String dbPass = "1111";
    
    Throwable occuredException = null;
    
    try
    {
        int id = Integer.parseInt(idValue);
        
        conn= DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
        conn.setAutoCommit(false);
        
        pstmtITem = conn.prepareStatement("insert into ITEM values(?,?)");
        pstmtITem.setInt(1,id);
        pstmtITem.setString(2,"상세 설명 " +id);
        pstmtITem.executeUpdate();
        
        if(request.getParameter("error") != null)
        {
            throw new Exception("의도적 익셉션 발생");
        }
        
        pstmtDetail = conn.prepareStatement("insert into ITEM_DETAIL values(?,?)");
        
        pstmtDetail.setInt(1,id);
        pstmtDetail.setString(2,"상세 설명 " +id);
        pstmtDetail.executeUpdate();
        
        conn.commit();
        
    }
    catch (Throwable e)
    {
       if(conn != null)
       {
           try{
               conn.rollback();
           } catch(SQLException ex) {}
       }
       occuredException = e;
    }
    finally
    {
        if (pstmtITem != null) try
        {
            pstmtITem.close();
        }
        catch (SQLException ex)
        {        }
        
        if (pstmtDetail != null) try
        {
            pstmtDetail.close();
        }
        catch (SQLException ex)
        {        }
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
<% if(occuredException != null) { %>
에러가 발생하였슴 : <%= occuredException.getMessage() %>
<% } else { %>
데이터가 성공적으로 들어감
<%} %>
</body>
</html>