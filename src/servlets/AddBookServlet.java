package servlets;

import dao.BookDAO;
import Bean.Books;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/addBookServlet")
public class AddBookServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String amount = req.getParameter("amount");
        String category = req.getParameter("category");
        BookDAO b_dao = new BookDAO();
        Books book = null;

        if(name != null && author != null && amount != null && category != null){
            book = new Books();
            book.setName(name);
            book.setAuthor(author);
            book.setIntro("暂未介绍");
            book.setAmount(Integer.parseInt(amount));
            book.setCategory(category);
            PrintWriter out = resp.getWriter();
            try{
                if(b_dao.addBook(book)){
                    out.println("<script>" +
                            "alert('添加成功，此图书信息已经被添加!!!');" +
                            "window.location.href = \"admin/reg_book.jsp\";" +
                            "</script>");
                }else {
                    out.println("<script>" +
                            "alert('添加失败，此图书可能已被添加!!!');" +
                            "window.location.href = \"admin/reg_book.jsp\";" +
                            "</script>");
                }
            }catch (Exception e){
                System.out.println("出现异常，图书表中添加图书失败!");
            }

        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
