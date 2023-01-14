package servlets;


import dao.StudentDAO;
import Bean.Students;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/userLoginServlet")
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String user = req.getParameter("user");
        String password = req.getParameter("password");
        String check = req.getParameter("check");
        HttpSession session = req.getSession();
        StudentDAO s_dao = new StudentDAO();
        try{
            if(s_dao.isExist(user,password)){

                  if(check != null){
                      Cookie user_cookie = new Cookie("user",user);
                      Cookie password_cookie = new Cookie("password",password);
                      Cookie check_cookie = new Cookie("check","checked");
                      user_cookie.setMaxAge(7*24*60*60);
                      password_cookie.setMaxAge(7*24*60*60);
                      check_cookie.setMaxAge(7*24*60*60);
                      resp.addCookie(user_cookie);
                      resp.addCookie(password_cookie);
                      resp.addCookie(check_cookie);
                  }else{
                      Cookie user_cookie = new Cookie("user",user);
                      Cookie password_cookie = new Cookie("password",password);
                      Cookie check_cookie = new Cookie("check","");
                      user_cookie.setMaxAge(0);
                      password_cookie.setMaxAge(0);
                      check_cookie.setMaxAge(0);
                      resp.addCookie(user_cookie);
                      resp.addCookie(password_cookie);
                      resp.addCookie(check_cookie);
                  }
                  Students student = s_dao.getStudentByName(user);
                  ServletContext application = this.getServletContext();
                  String person = (String)application.getAttribute("person");
                  if(person == null){
                      person = "1";
                  }else{
                      person = (Integer.parseInt(person) + 1) + "";
                  }


                  session.setAttribute("student", student);
                  application.setAttribute("person",person);
                  resp.sendRedirect(req.getContextPath() + "/user.jsp");
            }else {
                String msg = (String)req.getAttribute("msg");
                if(msg == null) msg = "账号或密码输入有误,请重试!";
                req.setAttribute("msg",msg);

                req.getRequestDispatcher("/login.jsp").forward(req,resp);
            }
        }catch (Exception e){
            System.out.println("数据库查询失败!");
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
