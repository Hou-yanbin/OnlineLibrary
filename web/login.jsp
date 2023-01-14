<%@ page import="Bean.Students" %><%--
  Created by IntelliJ IDEA.

  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>                                                   <%--标题名称--%>
    <link rel="stylesheet" type="text/css" href="css/login.css">                <%--导入登录界面的css样式--%>

</head>
<body>
    <%
        Cookie[] cookies = request.getCookies();                               /*获取本机的cookie数据, 以cookie类型的数组返回*/
        String user = "";                                                      /*定义用户名字符串, 默认为空字符串*/
        String password = "";                                                  /* 定义用户密码字符串， 默认为空字符串密码*/
        String check="checked";                                                /* 定义check数据表示用户上次登录选择的登录方式，默认为选中*/
        if(cookies != null && cookies.length > 0){                             /* 若成功获取cookie数组cookies，并且不为null且长度大于0*/

            for(int i = 0; i < cookies.length; i++){                           /* 对cookie内存放的所有数据进行循环遍历*/
                if(cookies[i].getName().equals("user")){                       /* 若匹配到键名为"user"的cookie数据，说明其存取的为该用户的账户数据*/
                    user = cookies[i].getValue();                              /* 获取键值，获取该用户的账号 */
                }
                if(cookies[i].getName().equals("password")){                    /*若匹配到键名为"password"的cookie数据，说明其存放的为该用户的密码数据*/
                    password = cookies[i].getValue();                           /*获取键值，获取该用户的密码*/
                }
                if(cookies[i].getName().equals("check")){                       /*若匹配到键名为"check"的cookie数据，为上次用户选择学生登录或管理员登录的信息*/
                    check = cookies[i].getValue();                              /*获取键值，获取登录状态*/
                }
            }
        }

        Students student = (Students) session.getAttribute("student");          //每次返回登录界面都获取session对象中的学生用户
        if(student != null){                                                            //若student对象存在，说明此时为退出登录状态，则进行以下操作
            session.removeAttribute("student");                                         //移除session对象中的用户信息
            String person = (String)application.getAttribute("person");                 //获取application对象中的所有用户数量，为字符串类型
            application.setAttribute("person",(Integer.parseInt(person)-1) + "");       //重新设置application对象中的用户数量，为原来数据减1，字符串类型存入
        }

    %>
    <div class="htmleaf-container">
        <div class="login-wrap">                            <%-- 登录界面的div块--%>
            <div class="login-html">
                <h2>图书馆系统</h2>                          <%--二级标题, 登录信息--%>

                <%--分为两种登录方式, 学生登录和管理员身份登录--%>
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked>
                <label for="tab-1" class="tab">学生</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up" ${requestScope.check}>     <%--若获取的请求信息为checked时，下次以管理员登录为默认--%>
                <label for="tab-2" class="tab">管理员</label>
                <div class="login-form">
                    <div class="sign-in-htm">
                        <form action="userLoginServlet" method="post" name="form_user">            <%--学生学号登录的表单，提交给userLoginServlet进行处理--%>
                            <div class="group">
                                <label class="label">学号</label>
                                <input name="user" type="text" class="input" placeholder="输入您的学号，9位数字" autocomplete="off" value="<%=user%>">
                            </div>
                            <div class="group">
                                <label class="label">密码</label>
                                <input name="password" type="password" class="input" placeholder="输入您的登录密码" autocomplete="off" value="<%=password%>">
                            </div>
                            <div class="group">
                                <input id="check" type="checkbox" class="check" name="check" <%=check%>>
                                <label for="check"><span class="icon"></span> 记住密码</label>
                                <a href="reg.jsp" class="reg">没有学号?立即注册</a>
                                <p class="error">&nbsp;${requestScope.msg}</p>              <%--若用户登录失败，jsp将在此显示用户登录失败的信息--%>
                            </div>
                            <div class="group">
                                <%--以button方式进行javascript点击函数处理，验证登录格式，并提交--%>
                                <input type="button" class="button" onclick="onclick_user()" value="登录">
                            </div>
                        </form>
                    </div>
                    <div class="sign-up-htm">
                        <form action="adminLoginServlet" method="post" name="form_admin">   <%--管理员登录的表单，提交给AdminLoginServlet进行处理--%>
                            <div class="group">
                                <label class="label">管理员账号</label>
                                <input name="a_user" type="text" class="input" placeholder="输入管理员账号，9位数字" autocomplete="off">
                            </div>
                            <div class="group">
                                <label class="label">管理员密码</label>
                                <input name="a_password" type="password" class="input" placeholder="输入您的管理员密码" autocomplete="off">
                            </div>
                            <div class="group">
                                <p>暂不支持记住密码及注册</p>
                                <p class="error">&nbsp;${requestScope.a_msg}</p>            <%--若管理员登录失败，将在此显示管理员登录失败的信息--%>
                            </div>
                            <div class="group">
                                <%--以button方式进行javascript点击函数处理，验证管理员登录格式，并提交--%>
                                <input type="button" class="button" onclick="onclick_admin()" value="登录">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/login.js"></script>             <%--导入javascript登录验证函数js文件--%>
</body>
</html>
