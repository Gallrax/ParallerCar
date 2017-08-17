package com.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/6.
 * 寻车贴
 */
@Entity(name = "t_findinfo")
@Indexed
public class FindInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    @Field(name = "fiid",index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer id;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String title;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String content;
    @Column(name = "outer_color")
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String outerColor;
    @Column(name = "inner_color")
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String innerColor;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String valid;//有效期
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

    public FindInfo() {
    }

    @Override
    public String toString() {
        return "FindInfo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", outerColor='" + outerColor + '\'' +
                ", innerColor='" + innerColor + '\'' +
                ", valid='" + valid + '\'' +
                ", insertTime=" + insertTime +
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public String getValid() {
        return valid;
    }

    public void setValid(String valid) {
        this.valid = valid;
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
