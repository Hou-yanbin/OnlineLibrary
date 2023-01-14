<%--
  Created by IntelliJ IDEA.

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" href="../css/reg.css">
</head>
<body style="background-image: none;margin-top: 0px">
<div class="box-body">
    <form action="../regServlet" method="post" name="form">
        <table>
            <tr>
                <th>学生学号：</th>																	<!-- 输入用户名称 -->
                <td><input type="text" name="user" id="user" placeholder="长度为9位的数字，要求未注册过" autocomplete="off"></td>
            </tr>
            <tr>
                <th>密　　码：</th>																	<!-- 输入密码 -->
                <td><input type="password" name="password" placeholder="长度6~20，大小写字母、数字或下划线" autocomplete="off"></td>
            </tr>
            <tr>
                <th>确认密码：</th>																	<!-- 重复密码 -->
                <td><input type="password" name="repwd" placeholder="请再次输入密码进行确认" autocomplete="off"></td>
            </tr>
            <tr>
                <th>真实姓名：</th>																	<!-- 输入用户真实姓名 -->
                <td><input type="text" name="realname" placeholder="输入您的真实姓名" autocomplete="off"></td>
            </tr>

            <tr>
                <th>年　　级：</th>																	<!-- 输入手机号码 -->
                <td>
                    <select name="grade" id="grade" style="height: 38px; margin-bottom: 15px;">
                        <option value="2020">2020级</option>
                        <option value="2019">2019级</option>
                        <option value="2018">2018级</option>
                        <option value="2017">2017级</option>
                        <option value="2016">2016级</option>
                        <option value="2015">2015级</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>电话号码：</th>
                <td><input type="text" name="phone" placeholder="13、14、15、17、18开头的11位手机号" autocomplete="off"></td>
            </tr>
            <tr>
                <th>电子邮箱：</th>																	<!-- 输入电子邮箱 -->
                <td><input type="text" name="email" placeholder="用户名@域名（域名后缀至少2个字符）" autocomplete="off"></td>
            </tr>
            <tr>																<!-- 输入身份证号 -->
                <td><input type="hidden" name="admin" value="true"></td>
            </tr>
            </table>
            <input type="button" onclick="checkData()" value="注册">		<!-- 注册按钮 -->
        </form>
    </div>
    <script src="../js/reg.js"></script>
</body>
</html>
