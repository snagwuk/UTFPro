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
    
    
    public int userCheck(String id, String passwd) throws Exception 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;
        String temp ="";
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement("select passwd from member where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                temp = rs.getString("passwd");
                if (temp.equals(passwd))
                    x= 1;
                else
                    x= 0;
            }
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
    
    public LogonDataBean getMember(String id) throws Exception 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        LogonDataBean member = null;
        int x = -1;
        
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from member where id = ?");
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next())
            {
               member = new LogonDataBean();
               member.setId(rs.getString("id"));
               member.setPasswd(rs.getString("passwd"));
               member.setName(rs.getString("name"));
               member.setJumin1(rs.getString("jumin1"));
               member.setJumin2(rs.getString("jumin2"));
               member.setEmail(rs.getString("email"));
               member.setBlog(rs.getString("blog"));
               member.setReg_date(rs.getTimestamp("REG_DATE"));
                
                
                
            }

        }catch(SQLException ex){
            ex.printStackTrace();
        }finally{
            if (rs !=null) try{rs.close();} catch(SQLException ex) {}
            if (pstmt !=null) try{pstmt.close();} catch(SQLException ex) {}
            if (conn !=null) try{conn.close();} catch(SQLException ex) {}
        }
        return member;
    }

    public void updateMember(LogonDataBean member) throws Exception 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try
        {
            conn = getConnection();
       
            pstmt = conn.prepareStatement("update MEMBER set name= ? , email=? , blog=? where id = ?");
            pstmt.setString(1, member.getName());
            pstmt.setString(2, member.getEmail());
            pstmt.setString(3, member.getBlog());
            pstmt.setString(4, member.getId());
            pstmt.executeUpdate();
            
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
    }
    
    public int deleteMember(String id, String passwd) throws Exception 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbpasswd="";
        int x = 0;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select passwd from member where id = ?");
            pstmt.setString(1, id);
       
            rs =  pstmt.executeQuery();
            
            if(rs.next())
            {
                  dbpasswd = rs.getString("passwd");
                  if(dbpasswd.equals(passwd))
                  {
                      pstmt = conn.prepareStatement("delete from MEMBER where id = ? ");
                      pstmt.setString(1, id);
                      x = pstmt.executeUpdate();
                  }
                  else
                      x = 0;
            }
            else
                x= -1;
            
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
        return x;
    }
   
}
