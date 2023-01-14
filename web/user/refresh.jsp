<%--
  Created by IntelliJ IDEA.
  Date: 2020/6/5
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        response.setHeader("Refresh","5");
    %>
    <p align="right" name="person_ifa"><%="当前在线人数:" + application.getAttribute("person")%></p>
</body>
</html>
