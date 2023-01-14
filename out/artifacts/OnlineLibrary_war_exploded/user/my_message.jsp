<%@ page import="Bean.Students" %>
<%@ page import="dao.StudentDAO" %><%--
  Created by IntelliJ IDEA
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Message</title>
</head>
<body>
    <%
        StudentDAO s_dao = new StudentDAO();
        Students student = (Students)session.getAttribute("student");
        if(student != null){
            student = s_dao.getStudentByName(student.getUser());
            session.setAttribute("student",student);
    %>
            <div id="my_message">
                <h2><%="我的基本信息"%></h2>
                <table>
                    <tr><td width="120px">我的姓名:</td><td><%=student.getRealname()%></td></tr>
                    <tr><td>我的密码:</td><td><%=student.getPassword()%></td></tr>
                    <tr><td>我的年级:</td><td><%=student.getGrade()%></td></tr>
                    <tr><td>我的电话:</td><td><%=student.getPhone()%></td></tr>
                    <tr><td>我的邮箱:</td><td><%=student.getEmail()%></td></tr>
                    <tr><td>我的住址:</td><td><%=student.getAddress()%></td></tr>
                    <tr><td>可借书籍:</td><td><%=10 - student.getAmount()%></td></tr>
                    <tr><td>已借书籍:</td><td><%=student.getAmount()%></td></tr>
                </table>
        <%
            }
        %>
            </div>



</body>
</html>
