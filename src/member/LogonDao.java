package member;

import java.sql.*;


public class LogonDao
{
    private static LogonDao instance = new LogonDao();
    public static LogonDao getInstance()
    {
        return instance;
    }
    private LogonDao() {}
    
    private Connection getConnection() throws Exception
    {
        Connection conn = null;
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
        String dbId="scott";
        String dbpass="1111";  
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl,dbId,dbpass);
        return conn;
    }
    public void insertMember(LogonDataBean member) throws Exception 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try
        {
            conn = getConnection();
        /*   db table 생성 쿼리 
          create table member(
                    id varchar(12) primary key,
                    passwd varchar(12) not null,
                    name varchar(10) not null,
                    jumin1 varchar(6) not null,
                    jumin2 varchar(7) not null,
                    email varchar(30) not null,
                    blog varchar(50) not null,
                    reg_date date not null
                    );
                    */
            pstmt = conn.prepareStatement("insert into MEMBER values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getJumin1());
            pstmt.setString(5, member.getJumin2());
            pstmt.setString(6, member.getEmail());
            pstmt.setString(7, member.getBlog());
            pstmt.setTimestamp(8, member.getReg_date());
            pstmt.executeUpdate();
            
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
    }
    
    public int confirmId(String id) throws Exception 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement("select id from member where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next())
                x= 1;
            else
                x= -1;
           
        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            if (rs !=null) try{rs.close();} catch(SQLException ex) {}
            if (pstmt !=null) try{pstmt.close();} catch(SQLException ex) {}
            if (conn !=null) try{conn.close();} catch(SQLException ex) {}
        }
        return x;
    }
}
