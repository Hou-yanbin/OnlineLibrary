<%@ page import="Bean.Books" %>
<%@ page import="dao.BookDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.awt.print.Book" %>
<%--

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show Book</title>
</head>
<body>
    <div class="box-body" id="box-body" style="overflow-y: auto;">
        <%
            ArrayList<Books> books = new BookDAO().getAllBooks();
        %>
        <h2><%="所有图书信息"%></h2>
        <table>
            <tr>
                <td width="250px"><%="图书名称"%></td>
                <td width="200px"><%="图书作者"%></td>
                <td width="150px"><%="图书类别"%></td>
                <td width="150px"><%="图书数量"%></td>
            </tr>
                <%
                    for (Books book: books){
                %>
            <tr>
                <td><%=book.getName()%></td>
                <td><%=book.getAuthor()%></td>
                <td><%=book.getCategory()%></td>
                <td><%=book.getAmount()%></td>

            </tr>
                <%
            }
        %>
    </div>
</body>
</html>
