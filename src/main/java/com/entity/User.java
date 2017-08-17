package com.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * Created by on 2017/3/6.
 * 用户
 */
@Entity(name = "t_user")
@Indexed
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    @Field(name = "uid",index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer id;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String username;
    private String password;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String name;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String content;//个人介绍
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String phone;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer isAlone;//0:个人,1:公司
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String province;//省
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String city;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String business;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String company;
    @Field(index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private String companyAddress;
    @Field
    @SortableField
    @JSONField(format = "yyyy-MM-dd")
    private Date insertTime;

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
    @ContainedIn
    private Set<FindInfo> findInfos;

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
    @ContainedIn
    private Set<FindInfo> saleInfos;

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", phone='" + phone + '\'' +
                ", isAlone=" + isAlone +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", business='" + business + '\'' +
                ", company='" + company + '\'' +
                ", companyAddress='" + companyAddress + '\'' +
                ", insertTime=" + insertTime +
                ", findInfos=" + findInfos +
                ", saleInfos=" + saleInfos +
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getIsAlone() {
        return isAlone;
    }

    public void setIsAlone(Integer isAlone) {
        this.isAlone = isAlone;
    }

    public String getBusiness() {
        return business;
    }

    public void setBusiness(String business) {
        this.business = business;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public Date getInsertTime() {
        return insertTime;
    }

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }

    public Set<FindInfo> getFindInfos() {
        return findInfos;
    }

    public void setFindInfos(Set<FindInfo> findInfos) {
        this.findInfos = findInfos;
    }

    public Set<FindInfo> getSaleInfos() {
        return saleInfos;
    }

    public void setSaleInfos(Set<FindInfo> saleInfos) {
        this.saleInfos = saleInfos;
    }
}
