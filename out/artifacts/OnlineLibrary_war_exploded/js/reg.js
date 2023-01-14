//表单提交进行输入信息校验
function checkData(){
    if(form.user.value == "" || form.user.value == "长度为9位的数字，要求未注册过" || !new RegExp("^\\d{9}$").test(form.user.value)){
        alert("学生学号输入错误或无输入, 请重试!");
        form.user.value = "";
        form.user.placeholder = "长度为9位的数字，要求未注册过";
        form.user.focus();
        return;
    }
    if(form.password.value == "" || form.password.value == "长度6~20，大小写字母、数字或下划线" || !new RegExp("^\\w{6,20}$").test(form.password.value)){
        alert("密码输入错误或无输入, 请重试!");
        form.password.value = "";
        form.password.placeholder = "长度6~20，大小写字母、数字或下划线";
        form.password.focus();
        return;
    }
    if(form.repwd.value == "" || form.repwd.value == "请再次输入密码进行确认" || !new RegExp("^\\w{6,20}$").test(form.repwd.value) || form.password.value != form.repwd.value){
        alert("再次输入密码错误或无输入, 请重试!");
        form.repwd.value = "";
        form.repwd.placeholder = "请再次输入密码进行确认";
        form.repwd.focus();
        return;
    }
    if(form.realname.value == "" || form.realname.value == "输入您的真实姓名"){
        alert("真实姓名输入错误或无输入, 请重试!");
        form.realname.value = "";
        form.realname.placeholder = "输入您的真实姓名";
        form.realname.focus();
        return;
    }

    if(form.phone.value == "" || form.phone.value == "13、14、15、17、18开头的11位手机号" || !new RegExp("^1[34578]\\d{9}$").test(form.phone.value)){
        alert("输入手机号码错误或无输入, 请重试!");
        form.phone.value = "";
        form.phone.placeholder = "13、14、15、17、18开头的11位手机号";
        form.phone.focus();
        return;
    }

    if(form.email.value == "" || form.email.value == "用户名@域名（域名后缀至少2个字符）" || !new RegExp("^(\\w+(\\_|\\-|\\.)*)+@(\\w+(\\-)?)+(\\.\\w{2,})+$").test(form.email.value)){
        alert("输入邮箱错误或无输入, 请重试!");
        form.email.value = "";
        form.email.placeholder = "用户名@域名（域名后缀至少2个字符）";
        form.email.focus();
        return;
    }
    //将用户表单提交
    form.submit();
}