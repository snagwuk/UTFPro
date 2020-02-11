package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

@SuppressWarnings("serial")
public class DBCPInit extends HttpServlet
{
    public void init() throws ServletException 
    {
        loadJDBCDriver();
        initConnectionPool();
    }
    
    private void   loadJDBCDriver()
    {
        try{
           Class.forName("oracle.jdbc.driver.OracleDriver");
        }catch (ClassNotFoundException ex) {
            throw new RuntimeException("fail to load JDBC Driver",ex);
        }
        
    }
    
    private void   initConnectionPool()
    {
        try{
        String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
        String dbUser = "scott";
        String dbPass = "1111";
        ConnectionFactory connFactiory = new DriverManagerConnectionFactory(jdbcDriver,dbUser,dbPass);
        PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactiory, null);
        poolableConnFactory.setValidationQuery("select 1");
        
        GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
        poolConfig.setTimeBetweenEvictionRunsMillis(1000L*60L*5L);
        poolConfig.setTestWhileIdle(true);
        poolConfig.setMinIdle(4);
        poolConfig.setMaxTotal(50);
        
        GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory,poolConfig);
        poolableConnFactory.setPool(connectionPool);
        
        Class.forName("org.apache.commons.dbcp2.PoolingDriver");
        PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
        driver.registerPool("dbpool", connectionPool);
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}