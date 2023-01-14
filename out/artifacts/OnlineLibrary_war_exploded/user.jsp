<%@ page import="dao.BookDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.awt.print.Book" %>
<%@ page import="Bean.Books" %>
<%@ page import="Bean.Students" %>
<%@ page import="Bean.Borrows" %>
<%@ page import="dao.BorrowDAO" %>
<%@ page import="dao.StudentDAO" %><%--
  Created by IntelliJ IDEA.

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>Online Library</title>
      <link rel="stylesheet" href="css/head02.css">
      <link rel="stylesheet" href="css/index.css">
  </head>
  <body>
    <%
        Students student = (Students)session.getAttribute("student");
        if(student == null){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
    %>
    <div class="sidebar">
        <ul>
            <li><a href="#"><%="用户:" + student.getRealname()%></a></li>
            <li><a href="userChoiceServlet?signal=1" target="showBook">全部图书</a></li>
            <li><a href="userChoiceServlet?signal=literature" target="showBook">文学书籍</a></li>
            <li><a href="userChoiceServlet?signal=science" target="showBook">理工书籍</a></li>
            <li><a href="userChoiceServlet?signal=history" target="showBook">历史书籍</a></li>
            <li><a href="userChoiceServlet?signal=philo" target="showBook">哲学书籍</a></li>
            <li><a href="userChoiceServlet?signal=foreign" target="showBook">外语书籍</a></li>
            <li><a href="userChoiceServlet?signal=political" target="showBook">政治书籍</a></li>
            <li><a href="userChoiceServlet?signal=program" target="showBook">编程书籍</a></li>
            <li><a href="user/my_borrow.jsp" target="showBook">我的已借图书</a></li>
            <li><a href="user/my_message.jsp" target="showBook">我的基本信息</a></li>
            <li><a href="login.jsp">切换账号/退出</a></li>
        </ul>
    </div>
    <a class="btn"></a>



    <div class="box">

        <div class="box-head">图 书 馆 系 统</div>														<!-- 用户注册的标题 -->
        <iframe src="user/refresh.jsp" frameborder="0" height="50px" width="100%" id="person_iframe"></iframe>
        <iframe class="showBook" name="showBook" src="user/showBook.jsp" frameborder="0" width="100%" height="80%"></iframe>

    </div>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $('.btn').on('click',function () {
            $('.btn').toggleClass('btnc');
            $('.sidebar').toggleClass('side');

        })
    </script>
  </body>
</html>
