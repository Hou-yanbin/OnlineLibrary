package dao;

import util.*;

import java.sql.*;

abstract public class DAOBase {

    protected Connection conn;
    protected PreparedStatement ps;
    protected Statement stmt;
    protected ResultSet rs;
    protected String sql_str;

    /**
     * 若数据库虚拟表对象存在，则关闭
     * 若数据库操纵类PreparedStatement对象ps存在，则关闭
     * 若数据库操纵类Statement对象stmt存在，则关闭
     */
    public void release(){
        try{
            if(rs != null){
                rs.close();
            }
            if(ps != null){
                ps.close();
            }
            if(stmt != null){
                stmt.close();
            }
        }catch (Exception e){
            System.out.println("关闭所有的数据库操作对象失败!");

        }
    }
}
