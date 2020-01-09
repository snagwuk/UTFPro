<%@page import="java.io.IOException"%>
<%@page import="java.io.Reader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%
   request.setCharacterEncoding("utf-8");



   String memberID=request.getParameter("memberID");
   //http://localhost:9085/UTFPro/DB/viewMemberHistory.jsp?memberID=madvirus
           /* 
           
           create table MEMBER_HISTORY (
			MEMBERID VARCHAR(10) NOT NULL PRIMARY KEY,
			HISTORY long VARCHAR
			);
			   
		insert into MEMBER_HISTORY  values('madvirus',
		'2015 스프링4 프로그래밍입문<br>'||
		'2013 spring 4.0 프로그래밍<br>'||
		'2012 객체 지향과 디자인 패턴<br>'||
		'2012 jsp 2.2 웹프로그밍 \n'
);
           
            */
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
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
      
      String query="select * from MEMBER_HISTORY where memberid ='"+memberID+"'";
      
      
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
			<td>히스토리</td>
			<td>
				<%
            	String history = null;
          		Reader reader = null;
          		 try{
          		     
          		     reader = rs.getCharacterStream("HISTORY");
          		     
          		     if(reader != null)
          		     {
          		         StringBuilder buff = new StringBuilder();
          		         char[] ch = new char[512];
          		         int len = -1;
          		         while((len = reader.read(ch)) != -1)
          		         {
          		             buff.append(ch,0,len);
          		         }
          		         history = buff.toString();
          		              
          		     }
          		 }catch(IOException ex)
          		 {
          		     out.println("익셉션 발생 : " + ex.getMessage());
          		 }finally{
          		     if(reader != null) try{reader.close();}catch(IOException ex){}
          		 }
            %> <%= history %>
			</td>
		</tr>

	</table>
	<%}else{ %><%=memberID %>회원의 히스토리가 없습니다.
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