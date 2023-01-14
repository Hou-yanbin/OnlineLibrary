package dao;

import util.OpenConnection;
import Bean.Admins;

import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDAO extends DAOBase{

    private Admins admin;
    public ArrayList<Admins> getAllAdmins() throws Exception{
        sql_str = "SELECT * FROM admins";
        ArrayList<Admins> admins = new ArrayList<Admins>();

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        rs = ps.executeQuery();

        while(rs.next()){
            admin = this.assemble(rs);
            admins.add(admin);
        }

        this.release();
        OpenConnection.closeConnection(conn);
        return admins;
    }



    public Admins getAdminByUser(String user) throws Exception{
        sql_str = "SELECT * FROM admins WHERE admin = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,user);
        rs = ps.executeQuery();

        if(rs.next()) admin = this.assemble(rs);

        return admin;
    }


    public boolean isExist(String admin, String password) throws Exception{
        boolean flag = false;
        sql_str = "SELECT * FROM admins WHERE admin = ? AND password = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,admin);
        ps.setString(2,password);
        rs = ps.executeQuery();

        if(rs.next()) flag = true;
        return flag;
    }



    public Admins assemble(ResultSet rs) throws Exception{
        admin = new Admins();

        admin.setId(rs.getInt("id"));
        admin.setAdmin(rs.getString("admin"));
        admin.setPassword(rs.getString("password"));
        admin.setRealname(rs.getString("realname"));
        admin.setPhone(rs.getString("phone"));
        admin.setEmail(rs.getString("email"));
        admin.setAddress(rs.getString("address"));

        return admin;
    }
}
