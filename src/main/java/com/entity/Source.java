package com.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.hibernate.search.annotations.*;
import org.hibernate.search.annotations.Index;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by Administrator on 2017/3/6.
 * 来源(中东版，加规，美版)
 */
@Entity(name = "t_source")
@Indexed
public class Source {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @DocumentId
    @Field(name = "sid",index = Index.YES, analyze = Analyze.YES, store = Store.YES)
    private Integer id;
    @Field(index = Index.YES, analyze = Analyze.NO, store = Store.YES)
    private String name;

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "source")
    @ContainedIn
    private Set<FindInfo> findInfos;

    @JSONField(serialize = false)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "source")
    @ContainedIn
    private Set<SaleInfo> saleInfos;

    /*@JSONField(serialize = false)
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "sources")
    @ContainedIn
    private Set<Car> cars;*/
    public Source() {
    }

    @Override
    public String toString() {
        return "Source{" +
                "id=" + id +
                ", name='" + name + '\'' +
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
