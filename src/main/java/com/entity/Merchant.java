package com.entity;

import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.SortableField;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/6.
 * 商户
 */
@Entity(name = "t_merchant")
@Indexed
public class Merchant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    private Integer id;
    private String username;
    private String password;
    @Field
    private String company;
    @Field
    private String city;
    @Field
    private String business;
    @Field
    @SortableField
    private Date insertTime;

    public Merchant() {
    }

    @Override
    public String toString() {
        return "Merchant{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", company='" + company + '\'' +
                ", city='" + city + '\'' +
                ", business='" + business + '\'' +
                ", insertTime=" + insertTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
}
