package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BoardDao
{
    private static BoardDao instance = new BoardDao();
    public static BoardDao getInstance()
    {
        return instance;
    }
    private BoardDao() {}
    
    @SuppressWarnings("unused")
    private Connection getConnection() throws Exception
    {
        Connection conn = null;
        try{
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
            String dbId="scott";
            String dbpass="1111";  
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(jdbcUrl,dbId,dbpass);
        }catch (Exception e) {
            e.printStackTrace();
        }
     
        return conn;
    }
    
    public void insertArticle(BoardDataBean article)
    {  
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try
        {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("insert into board values (BoardSer.nextval,?,?,?,?,?,sysdate,0,BoardSer.currval,0,0,?,?,'',0)");
            pstmt.setString(1, article.getBoardid());
            pstmt.setString(2, article.getWriter());
            pstmt.setString(3, article.getEmail());
            pstmt.setString(4, article.getSubject());
            pstmt.setString(5, article.getPasswd());
            pstmt.setString(6, article.getContent());
            pstmt.setString(7, article.getIp());
          
            pstmt.executeUpdate();
            
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
        
    }
    
    public int getArticleCount(String boardid)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        ResultSet rs = null;
        int count = 0 ;
        try
        {
            conn = getConnection();
            pstmt = conn.prepareStatement("select nvl(count(*),0) from board where boardid = ?");
            pstmt.setString(1, boardid);
            rs = pstmt.executeQuery();
            if(rs.next())
            {
                count = rs.getInt(1);
            }
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(rs != null) try{ rs.close();} catch(SQLException ex) {}
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
        return count;
        
    }
    public List<BoardDataBean> getArticle(int startRow,int endRow,String boardid)
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDataBean> articleList = null;
        try
        {
            conn = getConnection();
            
            //pstmt = conn.prepareStatement("select * from board where boardid = ?");
            String sql = " select * from( "
                    + " select rownum rnum, a.* from( "
                    + " select * from board where boardid=? order by num desc) a) "
                    + " where rnum between ? and ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardid);
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                articleList = new ArrayList<BoardDataBean>();
             do{
                 BoardDataBean temp = new BoardDataBean();
                 temp.setNum(rs.getInt("num"));
                 temp.setBoardid(rs.getString("boardid"));
                 temp.setWriter(rs.getString("writer"));
                 temp.setEmail(rs.getString("email"));
                 temp.setSubject(rs.getString("subject"));
                 temp.setPasswd(rs.getString("passwd"));
                 temp.setReg_date(rs.getTimestamp("reg_date"));
                 temp.setReadcount(rs.getInt("readcount"));
                 temp.setRef(rs.getInt("ref"));
                 temp.setRe_step(rs.getInt("re_step"));
                 temp.setRe_level(rs.getInt("re_level"));
                 temp.setContent(rs.getString("content"));
                 temp.setIp(rs.getString("ip"));
                 temp.setFilename(rs.getString("filename"));
                 temp.setFilesize(rs.getInt("filesize"));
                 articleList.add(temp);
                 
             }while(rs.next());   
            }
            
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(rs != null) try{ rs.close();} catch(SQLException ex) {}
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
        
        return articleList;
    }
    
    public BoardDataBean getArticle(int num)
    {
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean temp = null;
        try
        {
            conn = getConnection();
            
            //조회수 카운트 증가
            pstmt = conn.prepareStatement("update board set readcount = readcount + 1 where num = ?");
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            
            pstmt = conn.prepareStatement("select * from board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                    temp = new BoardDataBean();
                 temp.setNum(rs.getInt("num"));
                 temp.setBoardid(rs.getString("boardid"));
                 temp.setWriter(rs.getString("writer"));
                 temp.setEmail(rs.getString("email"));
                 temp.setSubject(rs.getString("subject"));
                 temp.setPasswd(rs.getString("passwd"));
                 temp.setReg_date(rs.getTimestamp("reg_date"));
                 temp.setReadcount(rs.getInt("readcount"));
                 temp.setRef(rs.getInt("ref"));
                 temp.setRe_step(rs.getInt("re_step"));
                 temp.setRe_level(rs.getInt("re_level"));
                 temp.setContent(rs.getString("content"));
                 temp.setIp(rs.getString("ip"));
                 temp.setFilename(rs.getString("filename"));
                 temp.setFilesize(rs.getInt("filesize"));
               
            
            }
            
        }catch (Exception ex) {
           ex.printStackTrace();
        }finally {
            if(rs != null) try{ rs.close();} catch(SQLException ex) {}
            if(pstmt != null) try{ pstmt.close();} catch(SQLException ex) {}
            if(conn != null) try{ conn.close();} catch(SQLException ex) {}
        }
        
        return temp;
    }
}
