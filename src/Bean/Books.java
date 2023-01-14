package Bean;

public class Books {

    private int id;
    private String name;
    private String author;
    private String intro;
    private int amount;
    private String category;

    //取得图书的id序号
    public int getId() {
        return id;
    }

    //设置图书的id序号
    public void setId(int id) {
        this.id = id;
    }

    //获取图书的名称
    public String getName() {
        return name;
    }

    //设置图书的名称
    public void setName(String name) {
        this.name = name;
    }

    //获取图书的作者
    public String getAuthor() {
        return author;
    }

    //设置图书的作者
    public void setAuthor(String author) {
        this.author = author;
    }

    //获取图书的简介
    public String getIntro() {
        return intro;
    }

    //设置图书的简介
    public void setIntro(String intro) {
        this.intro = intro;
    }

    //获取图书的数量
    public int getAmount() {
        return amount;
    }

    //设置图书的数量
    public void setAmount(int amount) {
        this.amount = amount;
    }

    //获取图书的类型
    public String getCategory() {
        return category;
    }

    //设置图书的类型
    public void setCategory(String category) {
        this.category = category;
    }
}
