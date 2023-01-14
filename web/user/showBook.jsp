<%@ page import="Bean.Books" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Bean.Borrows" %>
<%@ page import="dao.BookDAO" %>
<%@ page import="Bean.Students" %>
<%@ page import="dao.StudentDAO" %><%--
  Created by IntelliJ IDEA.
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Students student = (Students)session.getAttribute("student");
        if(student == null){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
    %>

    <%
        ArrayList<Borrows> borrows = (ArrayList<Borrows>) request.getAttribute("my_borrows");
        Students student01 = (Students)request.getAttribute("my_message");
        if(borrows == null && student01 == null){
            request.setCharacterEncoding("utf-8");
    %>
        <div class="box-body" id="box-body" style="overflow-y: auto">
            <%
              ArrayList<Books> books = null;
              books = (ArrayList<Books>) session.getAttribute("books");
              if(books == null){
                  BookDAO b_dao = new BookDAO();
                  books = b_dao.getAllBooks();
                  session.setAttribute("books",books);
              }
              if(books != null && books.size() > 0){
                  String category = null;
                  switch (books.get(0).getCategory()){
                      case "literature":
                          category = "文学书籍";
                          break;
                      case "science":
                          category = "理工书籍";
                          break;
                      case "history":
                          category = "历史书籍";
                          break;
                      case "philo":
                          category = "哲学书籍";
                          break;
                      case "foreign":
                          category = "外语书籍";
                          break;
                      case "political":
                          category = "政治书籍";
                          break;
                      case "program":
                          category = "编程书籍";
                          break;
                      default:
                          category = "未知书籍";
                          break;
                  }
                  for(int i = 0; i < books.size(); i++){
                      if(!books.get(0).getCategory().equals(books.get(i).getCategory())){
                          category = "全部书籍";
                          break;
                      }
                  }
            %>
        <h2><%=category%></h2>
        <table>
            <tr>
                <td width="250px"><%="图书名称"%></td>
                <td width="200px"><%="图书作者"%></td>
                <td width="150px"><%="图书类型"%></td>
                <td width="100px"><%="图书数量"%></td>
                <td width="50px"><%="操作"%></td>
            </tr>
            <%
                for (Books book:books){
            %>
            <tr>
                <td><%=book.getName()%></td>
                <td><%=book.getAuthor()%></td>
                <td><%=book.getCategory()%></td>
                <td><%=book.getAmount()%></td>
                <td><a href="../borrowServlet?s_id=<%=student.getId()%>&b_id=<%=book.getId()%>">借书</a></td>

            </tr>
        <%
                }
              }
            }
        %>
    </div>
</body>
</html>