package servlets;

import dao.BookDAO;
import Bean.Books;
import Bean.Students;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/userChoiceServlet")
public class UserChoiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String signal = req.getParameter("signal");
        HttpSession session = req.getSession();
        Students student = (Students)session.getAttribute("student");
        BookDAO b_dao = new BookDAO();
        ArrayList<Books> books = null;
        try{
            switch (signal){
                case "1":
                    books = null;
                    break;
                default:
                    books = b_dao.getBooksByCategory(signal);
                    break;
            }
            session.setAttribute("books",books);
            resp.sendRedirect("user/showBook.jsp");
            return;
        }catch (Exception e){
            System.out.println("获取详细书籍列表失败!");
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
