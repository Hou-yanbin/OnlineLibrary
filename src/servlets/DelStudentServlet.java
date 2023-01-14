package servlets;

import dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(urlPatterns = "/delStudentServlet")
public class DelStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        String user = req.getParameter("user");
        StudentDAO s_dao = new StudentDAO();
        if(user != null){
            try{
                if(s_dao.delStudentByName(user)){

                    out.println("<script>" +
                            "alert('删除成功，此学生信息已被删除!!!');" +
                            "window.location.href = \"admin/del_student.jsp\";" +
                            "</script>");
                }else{

                    out.println("<script>" +
                            "alert('删除失败，请重新进行选择操作!!!');" +
                            "window.location.href = \"admin/del_student.jsp\";" +
                            "</script>");
                }

            }catch (Exception e){
                System.out.println("出现异常，删除学生操作失败！");
            }
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
