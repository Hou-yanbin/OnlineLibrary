package dao;


import util.OpenConnection;
import Bean.Books;

import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO extends DAOBase {

    private Books book;


    public ArrayList<Books> getAllBooks() throws Exception{
        sql_str = "SELECT * FROM books";
        ArrayList<Books> books = new ArrayList<Books>();

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        rs = ps.executeQuery();

        while(rs.next()){
            book = this.assemble(rs);
            books.add(book);
        }

        this.release();
        OpenConnection.closeConnection(conn);
        return books;
    }


    public ArrayList<Books> getBooksByCategory(String category) throws Exception{
        sql_str = "SELECT * FROM books WHERE category = ?";
        ArrayList<Books> books = new ArrayList<>();

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,category);
        rs = ps.executeQuery();

        while (rs.next()){
            book = this.assemble(rs);
            books.add(book);
        }

        this.release();
        OpenConnection.closeConnection(conn);
        return books;
    }


    public boolean addBook(Books book) throws Exception{
        boolean flag = false;
        sql_str = "INSERT INTO books(name,author,intro,amount,category) VALUES(?,?,?,?,?)";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setString(1,book.getName());
        ps.setString(2,book.getAuthor());
        ps.setString(3,book.getIntro());
        ps.setInt(4,book.getAmount());
        ps.setString(5,book.getCategory());

        if(ps.executeUpdate() > 0) flag = true;

        return flag;

    }




    public boolean updateBook(Books book) throws Exception{
        boolean flag = false;
        sql_str = "UPDATE books SET amount=? WHERE id=?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);

        ps.setInt(1,book.getAmount());
        ps.setInt(2,book.getId());

        if(ps.executeUpdate() > 0) flag = true;

        this.release();
        OpenConnection.closeConnection(conn);

        return flag;
    }




    public Books getBookById(int id) throws Exception{
        sql_str = "SELECT * FROM books WHERE id = ?";

        conn = OpenConnection.getConnection();
        ps = conn.prepareStatement(sql_str);
        ps.setInt(1,id);
        rs = ps.executeQuery();

        if (rs.next()) book = this.assemble(rs);

        this.release();
        OpenConnection.closeConnection(conn);
        return book;

    }



    public Books assemble(ResultSet rs) throws Exception{
        book = new Books();

        book.setId(rs.getInt("id"));
        book.setName(rs.getString("name"));
        book.setAuthor(rs.getString("author"));
        book.setIntro(rs.getString("intro"));
        book.setAmount(rs.getInt("amount"));
        book.setCategory(rs.getString("category"));


        return book;
    }
}
