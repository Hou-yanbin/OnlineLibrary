package dao;

import util.OpenConnection;
import Bean.Borrows;

import java.sql.ResultSet;
import java.util.ArrayList;

public class BorrowDAO extends DAOBase {

    private Borrows borrow = null;
    public ArrayList<Borrows> getAllBorrows() throws Exception{
        sql_str = "SELECT * FROM borrows";
        ArrayList<Borrows> borrows = new ArrayList<>();
        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        rs = ps.executeQuery();

        while(rs.next()) {
            borrow = this.assemble(rs);
            borrows.add(borrow);
        }

        this.release();
        OpenConnection.closeConnection(conn);
        return borrows;
    }


    public ArrayList<Borrows> getBorrowsBySId(int s_id) throws Exception{
        ArrayList<Borrows> borrows = new ArrayList<>();
        sql_str = "SELECT * FROM borrows WHERE s_id = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,s_id);
        rs = ps.executeQuery();

        while (rs.next()){
            borrow = this.assemble(rs);
            borrows.add(borrow);
        }

        this.release();
        OpenConnection.closeConnection(conn);

        return borrows;
    }


    public boolean addBorrows(Borrows borrow) throws Exception{
        boolean flag = false;
        sql_str = "INSERT INTO borrows VALUES(?,?,?)";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,borrow.getS_id());
        ps.setInt(2,borrow.getB_id());
        ps.setInt(3,borrow.getAmount());
        if(ps.executeUpdate() > 0)  flag = true;

        this.release();
        OpenConnection.closeConnection(conn);

        return flag;

    }


    public boolean deleteBorrow(Borrows borrow) throws Exception{
        boolean flag = false;
        sql_str = "DELETE FROM borrows WHERE s_id = ? AND b_id = ? AND amount = ?";

        conn = OpenConnection.getConnection();
        ps =conn.prepareStatement(sql_str);

        ps.setInt(1,borrow.getS_id());
        ps.setInt(2,borrow.getB_id());
        ps.setInt(3,borrow.getAmount());


        if(ps.executeUpdate() > 0) flag = true;
        return flag;
    }



    public Borrows getBorrowById(int s_id, int b_id) throws Exception{
        sql_str = "SELECT * FROM borrows WHERE s_id = ? AND b_id = ?";


        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,s_id);
        ps.setInt(2,b_id);

        rs = ps.executeQuery();

        if(rs.next()) borrow = this.assemble(rs);

        this.release();
        OpenConnection.closeConnection(conn);
        return borrow;


    }


    public boolean updateBorrow(Borrows borrow) throws  Exception{
        boolean flag = false;
        sql_str = "UPDATE borrows SET amount = ? WHERE s_id = ? AND b_id = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,borrow.getAmount());
        ps.setInt(2,borrow.getS_id());
        ps.setInt(3,borrow.getB_id());

        if(ps.executeUpdate() > 0) flag = true;

        this.release();
        OpenConnection.closeConnection(conn);

        return flag;
    }



    public Borrows assemble(ResultSet rs) throws Exception{
        borrow = new Borrows();

        borrow.setS_id(rs.getInt("s_id"));
        borrow.setB_id(rs.getInt("b_id"));
        borrow.setAmount(rs.getInt("amount"));

        return borrow;
    }

}
