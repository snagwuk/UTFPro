<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
   request.setCharacterEncoding("utf-8");

   String memberID=request.getParameter("memberID");
   //http://localhost:9085/UTFPro/DB/viewMember.jsp?memberID=eral3
%>   


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   Class.forName("oracle.jdbc.driver.OracleDriver");

   Connection conn=null;
   Statement stmt=null;
   ResultSet rs=null;
   
   try{
      String jdbcDriver ="jdbc:oracle:thin:@localhost:1521:orcl";
      String dbUser="scott";
      String dbPass="1111";
      
      String query="select * from member where memberid='"+memberID+"'";
      
      
      conn=DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
      stmt=conn.createStatement();
      rs=stmt.executeQuery(query);
      
      if(rs.next()){%>
      <table border="1">
         <tr>
            <td>아이디</td>
            <td><%=memberID %></td>
         </tr>
         <tr>
            <td>암호</td>
            <td><%=rs.getString("PASSWORD")%></td>
         </tr>
         <tr>
            <td>이름</td>
            <td><%=rs.getString("NAME")%></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><%=rs.getString("EMAIL")%></td>
         </tr>
         
      </table>
      <%}else{ %><%=memberID %>에 해당하는 정보가 존재하지 않습니다.
      <%}}catch(SQLException ex){ %>
      에러발생:<%=ex.getMessage() %>
      <%
   }finally{
      if(rs!=null) try{rs.close();} catch(SQLException ex){}
      if(stmt!=null) try{stmt.close();} catch(SQLException ex){}
      if(conn!=null) try{conn.close();} catch(SQLException ex){}
   }
%>
</body>
</html>