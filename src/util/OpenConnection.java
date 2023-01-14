package util;

import java.sql.*;
import java.util.Properties;

public class OpenConnection {


    /**
     * 定义可以由类名直接调用的数据库连接的静态方法
     * 此方法返回的是一个数据库连接
     * @return
     */
    public static Connection getConnection(){
        Connection coon = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("加载驱动器成功!");
            coon = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_library","root","123456");
            System.out.println("数据库连接成功!");
        }catch (Exception e){
            System.out.println("数据库连接出现错误!");
        }
        return coon;
    }


    /**
     * 定义一个可以由类名直接进行调用的关闭数据库连接的静态方法
     * 参数为一个数据库连接对象， 无返回值
     * @param conn
     */
    public static void closeConnection(Connection conn){
        try{
            if(conn != null){
                conn.close();
            }
        }catch (Exception e){
            System.out.println("数据库连接关闭异常!");
        }
    }
}
