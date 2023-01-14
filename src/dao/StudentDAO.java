package dao;

import util.OpenConnection;
import Bean.Students;

import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentDAO extends DAOBase{

    private Students student = null;

    public ArrayList<Students> getAllStudents() throws Exception{
        ArrayList<Students> students = new ArrayList<Students>();
        sql_str = "SELECT * FROM students";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        rs = ps.executeQuery();

        while(rs.next()){
            student = this.assemble(rs);
            students.add(student);
        }

        this.release();
        OpenConnection.closeConnection(conn);
        return students;
    }



    public boolean addStudent(Students student) throws Exception{
        boolean flag = false;

        sql_str = "INSERT INTO students(user,password,realname,grade,phone,email,address,amount) VALUES(?,?,?,?,?,?,?,?)";
        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);

        ps.setString(1,student.getUser());
        ps.setString(2,student.getPassword());
        ps.setString(3,student.getRealname());
        ps.setString(4,student.getGrade());
        ps.setString(5,student.getPhone());
        ps.setString(6,student.getEmail());
        ps.setString(7,student.getAddress());
        ps.setInt(8,student.getAmount());

        if(ps.executeUpdate() > 0) flag = true;

        this.release();
        OpenConnection.closeConnection(conn);
        return flag;
    }


    public boolean delStudentByName(String user) throws Exception{
        boolean flag = false;
        sql_str = "DELETE FROM students WHERE user = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,user);

        if(ps.executeUpdate() > 0) flag = true;

        this.release();
        OpenConnection.closeConnection(conn);
        return flag;
    }



/*    public boolean modifyStudentByName(String user) throws  Exception{
        boolean flag = false;
        sql_str = "UPDATE students SET realname = ?, grade = ?, phone = ? WHERE user = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        return flag;

    }*/



    public Students getStudentByName(String name) throws Exception{
        sql_str = "SELECT * FROM students WHERE user = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,name);
        rs = ps.executeQuery();

        if(rs.next()) student = this.assemble(rs);

        this.release();
        OpenConnection.closeConnection(conn);
        return student;
    }


    public Students getStudentById(int id) throws Exception{
        sql_str = "SELECT * FROM students WHERE id = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,id);
        rs = ps.executeQuery();
        if (rs.next()) student = this.assemble(rs);

        this.release();
        OpenConnection.closeConnection(conn);
        return student;


    }


    public boolean updateStudent(Students student) throws Exception{
        boolean flag = false;
        sql_str = "UPDATE students SET amount = ? WHERE id = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,student.getAmount());
        ps.setInt(2,student.getId());

        if(ps.executeUpdate() > 0) flag = true;

        this.release();
        OpenConnection.closeConnection(conn);

        return flag;
    }



    public boolean isExist(String user, String password) throws Exception{
        boolean flag = false;
        sql_str = "SELECT * FROM students WHERE user = ? AND password = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);

        ps.setString(1,user);
        ps.setString(2,password);

        rs = ps.executeQuery();

        if(rs.next()) flag = true;
        this.release();
        OpenConnection.closeConnection(conn);
        return flag;
    }



    public boolean isExist(String user)  throws Exception{
        boolean flag = false;
        sql_str = "SELECT * FROM students WHERE user = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,user);
        rs = ps.executeQuery();

        if(rs.next()) flag = true;

        this.release();
        OpenConnection.closeConnection(conn);

        return flag;
    }


    public Students assemble(ResultSet rs) throws Exception{
        student = new Students();

        student.setId(rs.getInt("id"));
        student.setUser(rs.getString("user"));
        student.setPassword(rs.getString("password"));
        student.setRealname(rs.getString("realname"));
        student.setGrade(rs.getString("grade"));
        student.setPhone(rs.getString("phone"));
        student.setEmail(rs.getString("email"));
        student.setAddress(rs.getString("address"));
        student.setAmount(rs.getInt("amount"));

        return student;
    }

}
