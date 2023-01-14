<%@ page import="Bean.Students" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.StudentDAO" %><%--
  Created by IntelliJ IDEA.

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="box-body" id="box-body" style="overflow-y: auto;">
        <%
            ArrayList<Students> students = new StudentDAO().getAllStudents();
        %>
        <h2><%="学生账号信息删除"%></h2>
        <table>
            <tr>
                <td width="250px"><%="学生学号"%></td>
                <td width="200px"><%="学生姓名"%></td>
                <td width="150px"><%="学生年级"%></td>
                <td width="140px"><%="已借数量"%></td>
                <td width="220px"><%="电话号码"%></td>
                <td width="50px"><%="操作"%></td>
            </tr>
                <%
                    for (Students student: students){
                %>
            <tr>
                <td><%=student.getUser()%></td>
                <td><%=student.getRealname()%></td>
                <td><%=student.getGrade()%></td>
                <td><%=student.getAmount()%></td>
                <td><%=student.getPhone()%></td>
                <td><a href="../delStudentServlet?user=<%=student.getUser()%>">删除</a></td>

            </tr>
                <%
            }
            %>
    </div>
</body>
</html>
