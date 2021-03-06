package member;

import java.sql.Timestamp;

public class LogonDataBean
{
    private String id;
    private String passwd;
    private String name;
    private String jumin1;
    private String jumin2;
    private String email;
    private String blog;
    private Timestamp reg_date;
    
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
    
    public String toString()
    {
        return "LogonDataBean [id=" + id + ", passwd=" + passwd + ", name="
                + name + ", jumin1=" + jumin1 + ", jumin2=" + jumin2
                + ", email=" + email + ", blog=" + blog + ", reg_date="
                + reg_date + "]";
    }
    public Timestamp getReg_date()
    {
        return reg_date;
    }
    public void setReg_date(Timestamp reg_date)
    {
        this.reg_date = reg_date;
    }
    public String getId()
    {
        return id;
    }
    public void setId(String id)
    {
        this.id = id;
    }
    public String getPasswd()
    {
        return passwd;
    }
    public void setPasswd(String passwd)
    {
        this.passwd = passwd;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getJumin1()
    {
        return jumin1;
    }
    public void setJumin1(String jumin1)
    {
        this.jumin1 = jumin1;
    }
    public String getJumin2()
    {
        return jumin2;
    }
    public void setJumin2(String jumin2)
    {
        this.jumin2 = jumin2;
    }
    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getBlog()
    {
        return blog;
    }
    public void setBlog(String blog)
    {
        this.blog = blog;
    }
   
    
  
}
