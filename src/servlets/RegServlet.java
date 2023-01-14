package servlets;

import dao.StudentDAO;
import Bean.Students;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/regServlet")
public class RegServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        String user = req.getParameter("user");
        String password = req.getParameter("password");
        String realname = req.getParameter("realname");
        String grade = req.getParameter("grade");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String admin = req.getParameter("admin");
        String address = "中国";

        Students student = null;
        StudentDAO s_dao = new StudentDAO();
        try{
            if(s_dao.isExist(user)){
                if(admin != null){
                    out.println("<script>" +
                            "alert('此学号已注册过，请重试!');" +
                            "window.location.href = \"admin/add_student.jsp\";" +
                            "</script>");
                }else{
                    out.println("<script>" +
                            "alert('此学号已注册过，请重试!');" +
                            "window.location.href = \"reg.jsp\";" +
                            "</script>");
                }
            }else{
                student = new Students();

                student.setUser(user);
                student.setPassword(password);
                student.setRealname(realname);
                student.setGrade(grade);
                student.setPhone(phone);
                student.setEmail(email);
                student.setAddress(address);
                student.setAmount(0);

                if(s_dao.addStudent(student)){
                    if(admin != null){
                        out.println("<script>" +
                                "alert('注册成功!!!');" +
                                "window.location.href = \"admin/add_student.jsp\";" +
                                "</script>");
                    }else{
                        ServletContext application = this.getServletContext();
                        String person = (String)application.getAttribute("person");
                        if(person == null){
                            person = "1";
                        }else{
                            person = (Integer.parseInt(person) + 1) + "";
                        }
                        student = s_dao.getStudentByName(student.getUser());
                        req.getSession().setAttribute("student",student);
                        application.setAttribute("person",person);
                        out.println("<script>" +
                                "alert('注册成功，即将跳转到主界面!');" +
                                "window.location.href = \"user.jsp\";" +
                                "</script>");
                    }
                }else{
                    if(admin != null){
                        out.println("<script>" +
                                "alert('注册失败，请重新填写注册信息!!!');" +
                                "window.location.href = \"admin/add_student.jsp\";" +
                                "</script>");
                    }else{
                        out.println("<script>" +
                                "alert('注册失败，请重新填写注册信息!!!');" +
                                "window.location.href = \"reg.jsp\";" +
                                "</script>");
                    }
                }
            }
        }catch (Exception e){
            System.out.println("用户注册数据库查询失败!");
        }finally {
            out.close();
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
