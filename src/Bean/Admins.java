package Bean;

public class Admins {

    private int id;                     //定义管理员的id序号
    private String admin;               //登录账号，唯一
    private String password;            //密码
    private String realname;            //真实姓名
    private String phone;               //电话号码
    private String email;               //邮箱
    private String address;             //地址

    //获取管理员的id序号
    public int getId() {
        return id;
    }

    //设置管理员的id序号
    public void setId(int id) {
        this.id = id;
    }

    //获取管理员的账号
    public String getAdmin() {
        return admin;
    }

    //设置管理员的账号
    public void setAdmin(String admin) {
        this.admin = admin;
    }

    //获取管理员的密码
    public String getPassword() {
        return password;
    }

    //设置管理员的密码
    public void setPassword(String password) {
        this.password = password;
    }

    //获取管理员的真实姓名
    public String getRealname() {
        return realname;
    }

    //设置管理员的真实姓名
    public void setRealname(String realname) {
        this.realname = realname;
    }

    //获取管理员的电话
    public String getPhone() {
        return phone;
    }

    //设置管理员的电话号码
    public void setPhone(String phone) {
        this.phone = phone;
    }

    //获得管理员的邮箱地址
    public String getEmail() {
        return email;
    }

    //设置管理员的邮箱地址
    public void setEmail(String email) {
        this.email = email;
    }

    //获取管理员的地址
    public String getAddress() {
        return address;
    }

    //设置管理员的地址
    public void setAddress(String address) {
        this.address = address;
    }
}
