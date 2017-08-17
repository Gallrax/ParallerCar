package com.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/3.
 * 某款车
 */
@Entity(name = "t_car")
@Indexed
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    @Field(name = "cid",index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer id;
    @Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
    private String name;//车型名
    @Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
    private String type;//类型
    private String image;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "brand_id")
    @IndexedEmbedded
    private Brand brand;//品牌

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "car")
    @ContainedIn
    private Set<FindInfo> findInfos;

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "car")
    @ContainedIn
    private Set<SaleInfo> saleInfos;

    /*@JSONField(serialize = false)
    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "t_c_s",
            joinColumns = { @JoinColumn(name = "c_id")},
            inverseJoinColumns = { @JoinColumn(name = "s_id")})
    @IndexedEmbedded
    private Set<Source> sources;//来源*/
    public Car() {
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }


    public Set<FindInfo> getFindInfos() {
        return findInfos;
    }

    public void setFindInfos(Set<FindInfo> findInfos) {
        this.findInfos = findInfos;
    }

    public Set<SaleInfo> getSaleInfos() {
        return saleInfos;
    }

    public void setSaleInfos(Set<SaleInfo> saleInfos) {
        this.saleInfos = saleInfos;
    }
}
