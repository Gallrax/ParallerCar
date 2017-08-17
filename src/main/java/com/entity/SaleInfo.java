package com.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/6.
 * 配置(配置是商家的出售帖)
 */
@Entity(name = "t_saleinfo")
@Indexed
public class SaleInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    @Field(name = "siid",index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer id;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String title;
    @Column(name = "outer_color")
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String outerColor;
    @Column(name = "inner_color")
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String innerColor;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;//到店时间
    @Field
    private String price;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String content;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date insertTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    @IndexedEmbedded
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "car_id")
    @IndexedEmbedded
    private Car car;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "source_id")
    @IndexedEmbedded
    private Source source;

    public SaleInfo() {
    }

    @Override
    public String toString() {
        return "SaleInfo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", outerColor='" + outerColor + '\'' +
                ", innerColor='" + innerColor + '\'' +
                ", date=" + date +
                ", price='" + price + '\'' +
                ", content='" + content + '\'' +
                ", insertTime=" + insertTime +
                ", user=" + user +
                ", car=" + car +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOuterColor() {
        return outerColor;
    }

    public void setOuterColor(String outerColor) {
        this.outerColor = outerColor;
    }

    public String getInnerColor() {
        return innerColor;
    }

    public void setInnerColor(String innerColor) {
        this.innerColor = innerColor;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Source getSource() {
        return source;
    }

    public void setSource(Source source) {
        this.source = source;
    }
}
