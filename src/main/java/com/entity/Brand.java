package com.entity;


import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/3.
 * 品牌
 */
@Entity(name = "t_brand")
@Indexed
public class Brand {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    @Field(name = "bid",index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer id;
    @Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
    private String name;
    private String image;

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "brand")
    @ContainedIn
    private Set<Car> cars;

    public Brand() {
    }

    @Override
    public String toString() {
        return "Brand{" +
                "id=" + id +
                ", name='" + name + '\'' +
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set<Car> getCars() {
        return cars;
    }

    public void setCars(Set<Car> cars) {
        this.cars = cars;
    }
}
