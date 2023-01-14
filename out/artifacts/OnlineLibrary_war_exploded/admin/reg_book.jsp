<%--
  Created by IntelliJ IDEA.

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reg Book</title>
    <link rel="stylesheet" href="../css/reg.css">
</head>
<body style="background-image: none">
    <div class="box-body" id="box-body" style="overflow-y: auto;">
        <form action="../addBookServlet" method="post" name="form">
            <table>
                <tr>
                    <th>图书名称: </th>
                    <td><input type="text" name="name" placeholder="请输入图书的名称" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>图书作者: </th>
                    <td><input type="text" name="author"  placeholder="输入图书的作者" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>图书数量: </th>
                    <td><input type="text" name="amount"  placeholder="请输入添加图书的数量,1~9999之间" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>图书类型: </th>
                    <td><input type="text" name="category"  placeholder="请输入添加图书的类型" autocomplete="off"></td>
                </tr>
            </table>
            <br>
            <input type="button" onclick="check_data_book()" value="提交">
        </form>
    </div>
    <script>
        function check_data_book() {
            if(form.name.value == null || form.name.value == ""){
                alert("图书名称输入错误或未输入!");
                form.name.focus();
                return;
            }
            if(form.author.value == null || form.author.value == ""){
                alert("图书作者输入错误或未输入!");
                form.author.focus();
                return;
            }
            if(form.amount.value == null || form.amount.value == "" || !new RegExp("^\\d{1,4}$").test(form.amount.value)){
                alert("图书数量输入错误或未输入!");
                form.amount.focus();
                return;
            }
            if(form.category.value == null || form.category.value == ""){
                alert("图书类型输入错误或未输入!");
                form.category.focus();
                return;
            }
            form.submit();
        }

    </script>
</body>
</html>
