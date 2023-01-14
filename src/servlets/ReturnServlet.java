package servlets;


import dao.BookDAO;
import dao.BorrowDAO;
import dao.StudentDAO;
import Bean.Books;
import Bean.Borrows;
import Bean.Students;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = "/returnServlet")
public class ReturnServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");


        int s_id = Integer.parseInt(req.getParameter("s_id"));
        int b_id = Integer.parseInt(req.getParameter("b_id"));

        StudentDAO s_dao = new StudentDAO();
        BookDAO b_dao = new BookDAO();
        BorrowDAO bo_dao = new BorrowDAO();

        Students student = null;
        Books book = null;
        Borrows borrow = null;

        try {
            student = s_dao.getStudentById(s_id);
            book = b_dao.getBookById(b_id);
            borrow = bo_dao.getBorrowById(s_id,b_id);

            student.setAmount(student.getAmount() - 1);
            book.setAmount(book.getAmount() + 1);

            if(borrow.getAmount() - 1 == 0){
                bo_dao.deleteBorrow(borrow);
                resp.getWriter().println("<script>" +
                        "alert('归还图书成功!!!');" +
                        "window.location.href=\"user/my_borrow.jsp\";" +
                        "</script>");
            }else{
                borrow.setAmount(borrow.getAmount()-1);
            }

            if(s_dao.updateStudent(student) && b_dao.updateBook(book) && bo_dao.updateBorrow(borrow)){
                resp.getWriter().println("<script>" +
                        "alert('归还图书成功!!!');" +
                        "window.location.href=\"user/my_borrow.jsp\";" +
                        "</script>");
            }else{
                resp.getWriter().println("<script>" +
                        "alert('归还图书失败!!!');" +
                        "window.location.href=\"user/my_borrow.jsp\";" +
                        "</script>");
            }


        }catch (Exception e){
            System.out.println("进行图书归还出现异常!");
        }

    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
