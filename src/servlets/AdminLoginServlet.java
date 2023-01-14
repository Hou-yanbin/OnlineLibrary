package servlets;

import dao.AdminDAO;
import Bean.Admins;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String a_user = req.getParameter("a_user");
        String a_password = req.getParameter("a_password");
        HttpSession session = req.getSession();

        AdminDAO a_dao = new AdminDAO();
        Admins admin = null;
        try{
            if(a_dao.isExist(a_user,a_password)){
                admin = a_dao.getAdminByUser(a_user);
                session.setAttribute("admin",admin);
                resp.sendRedirect(req.getContextPath() + "/admin.jsp");
            }else{
//                String a_msg = (String) session.getAttribute("a_msg");
//                String check = (String) session.getAttribute("check");
                String a_msg = (String) req.getAttribute("a_msg");
                String check = (String) req.getAttribute("check");
                a_msg = "管理员账户或密码输入错误!";
                check = "checked";
                req.setAttribute("a_msg",a_msg);
                req.setAttribute("check",check);
                System.out.println(req.getRequestDispatcher(req.getContextPath()));
                req.getRequestDispatcher("/login.jsp").forward(req,resp);
//                session.setAttribute("a_msg",a_msg);
//                session.setAttribute("check",check);
//                resp.sendRedirect(req.getContextPath() + "/login.jsp");
            }
        }catch (Exception e){
            System.out.println("数据库管理员表查询错误!");
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
