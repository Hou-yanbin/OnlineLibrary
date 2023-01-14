<%@ page import="dao.StudentDAO" %>
<%@ page import="Bean.Students" %>
<%@ page import="dao.BorrowDAO" %>
<%@ page import="Bean.Borrows" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.BookDAO" %><%--
  Created by IntelliJ IDEA.
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Borrow Books</title>
</head>
<body>
    <%
        BorrowDAO bo_dao = new BorrowDAO();
        StudentDAO s_dao = new StudentDAO();
        ArrayList<Borrows> borrows = null;
        Students student = (Students)session.getAttribute("student");
        borrows = bo_dao.getBorrowsBySId(student.getId());
        if(borrows != null && borrows.size() > 0){
            BookDAO b_dao = new BookDAO();
    %>
        <div id="my_borrow" name="my_borrow" style="height: 80%;overflow-y: auto;" >
            <h2><%="我的已借书籍"%></h2>
            <table>
                <tr>
                    <td width="250px"><%="图书名称"%></td>
                    <td width="200px"><%="图书作者"%></td>
                    <td width="150px"><%="图书类型"%></td>
                    <td width="100px"><%="图书数量"%></td>
                    <td width="50px"><%="操作"%></td>
                </tr>
                <%
                    for(Borrows borrow: borrows){
                %>
                <tr>
                    <td><%=b_dao.getBookById(borrow.getB_id()).getName()%></td>
                    <td><%=b_dao.getBookById(borrow.getB_id()).getAuthor()%></td>
                    <td><%=b_dao.getBookById(borrow.getB_id()).getCategory()%></td>
                    <td><%=borrow.getAmount()%></td>
                    <td><a href="../returnServlet?s_id=<%=student.getId()%>&b_id=<%=borrow.getB_id()%>">还书</a></td>

                </tr>
                <%
                    }
                %>
            </table>
            <%
                }
            %>
        </div>
</body>
</html>
