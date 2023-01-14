<%@ page import="Bean.Admins" %><%--
  Created by IntelliJ IDEA.
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
    <link rel="stylesheet" href="css/head02.css">
    <link rel="stylesheet" href="css/index.css">
    <style>
        body{
            background-image: url("img/book005.webp");
        }

    </style>
</head>
<body>
    <%
        Admins admin = (Admins)session.getAttribute("admin");
        if(admin == null){
            response.sendRedirect("login.jsp");
            return;
        }
    %>


    <div class="sidebar">
        <ul>
            <li><a href="#"><%="管理员:" + admin.getRealname()%></a></li>
            <li><a href="admin/add_student.jsp" target="showBook">添加学生</a></li>
            <li><a href="admin/del_student.jsp" target="showBook">删除学生</a></li>
<%--            <li><a href="userChoiceServlet?signal=science" target="showBook">修改学生</a></li>--%>
            <li><a href="admin/show_student.jsp" target="showBook">查看学生</a></li>
            <li><a href="admin/reg_book.jsp" target="showBook">添加书籍</a></li>
            <li><a href="admin/show_book.jsp" target="showBook">查看书籍</a></li>
<%--            <li><a href="userChoiceServlet?signal=political" target="showBook">修改书籍</a></li>--%>
<%--            <li><a href="userChoiceServlet?signal=program" target="showBook">查看书籍</a></li>--%>
<%--            <li><a href="userChoiceServlet?signal=9" target="showBook">我的已借图书</a></li>--%>
<%--            <li><a href="userChoiceServlet?signal=10" target="showBook">我的基本信息</a></li>--%>
            <li><a href="login.jsp">切换账号/退出</a></li>
        </ul>
    </div>
    <a class="btn"></a>


    <div class="box">

        <div class="box-head">图 书 馆 系 统</div>														<!-- 用户注册的标题 -->
        <p align="right">机密数据，谨慎操作</p>
        <iframe name="showBook" src="admin/show_student.jsp" frameborder="0" width="100%" height="80%"></iframe>

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
