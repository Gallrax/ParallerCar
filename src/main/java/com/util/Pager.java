package com.util;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/11.
 */
public class Pager {

    //		private static final int PAGE_DEFAULT_LIMIT = 20; //每页显示最大条数
    private static final int PAGE_DEFAULT_LIMIT = 5; //每页显示最大条数
    private static final int INDEX_PAGE_DEFAULT_LIMIT=12;//前台页面每页默认最大显示数
    private static final int PAGE_BAR_SIZE = 9; //最大导航页数

    private int start=0;//开始数
    private int currentPage;//当前页数

    private int totalCount =0;//总共条数

    private int totalPage;//总共页数

    private int pageLimit;//每页显示条数

    private int indexPageLimit;//前端页面每页显示数

    private boolean hasNextPage;//是否含有下一条

    private boolean hasPrevPage;//是否含有上一条

    private int pageCount=5;//分页显示页数个数

    private int first=-1;

    private String current;

    private String url;

    private String param;

    private List<String> pageBarList = new ArrayList<String>();//页数导航栏

    public Pager(){
        super();
        this.currentPage = 1;
    }
    public Pager(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setTotalCount(int totalCount) {
        if (totalCount <= 0) {
            return;
        }
        this.totalCount = totalCount;

        if (this.pageLimit <= 0) {
            this.pageLimit = PAGE_DEFAULT_LIMIT;
        }

        if (this.totalCount % this.pageLimit == 0) {
            this.totalPage = this.totalCount / this.pageLimit;
        } else {
            this.totalPage = this.totalCount / this.pageLimit + 1;
        }

        if (this.currentPage > this.totalPage) {
            this.currentPage = this.totalPage;
        } else if (this.currentPage <= 0) {
            this.currentPage = 1;
        }

        this.hasPrevPage = this.currentPage != 1;
        this.hasNextPage = this.currentPage != this.totalPage;

    }

    public void setPageBar() {
        if (this.totalPage <= PAGE_BAR_SIZE) {
            for (int i = 1; i <= this.totalPage; i++) {
                pageBarList.add(Integer.toString(i));
            }
        } else if (this.currentPage <= PAGE_BAR_SIZE / 2) {
            for (int i = 1; i <= PAGE_BAR_SIZE; i++) {
                pageBarList.add(Integer.toString(i));
            }
        } else if (this.currentPage >= this.totalPage - (PAGE_BAR_SIZE - 1) / 2) {
            for (int i = this.totalPage - PAGE_BAR_SIZE + 1; i <= this.totalPage; i++) {
                pageBarList.add(Integer.toString(i));
            }
        } else {
            for (int i = this.currentPage - PAGE_BAR_SIZE / 2; i < this.currentPage - PAGE_BAR_SIZE / 2 + PAGE_BAR_SIZE; i++) {
                pageBarList.add(Integer.toString(i));
            }
        }
    }

    public int getNextPage() {
        return this.currentPage + 1;
    }

    public int getPrevPage() {
        return this.currentPage - 1;
    }

    public boolean isHasNextPage() {
        return hasNextPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public void setHasNextPage(boolean hasNextPage) {
        this.hasNextPage = hasNextPage;
    }

    public boolean isHasPrevPage() {
        return hasPrevPage;
    }

    public void setHasPrevPage(boolean hasPrevPage) {
        this.hasPrevPage = hasPrevPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getPageLimit() {
        if (this.pageLimit <= 0) {
            this.pageLimit = PAGE_DEFAULT_LIMIT;
        }
        return pageLimit;
    }

    public void setPageLimit(int pageLimit) {
        this.pageLimit = pageLimit;
    }

    public int getIndexPageLimit() {
        if(this.indexPageLimit<=0){
            this.indexPageLimit=INDEX_PAGE_DEFAULT_LIMIT;
        }
        return indexPageLimit;
    }
    public void setIndexPageLimit(int indexPageLimit) {
        this.indexPageLimit = indexPageLimit;
    }
    public List<String> getPageBarList() {
        this.setPageBar();
        return pageBarList;
    }

    public void setPageBarList(List<String> pageBarList) {
        this.pageBarList = pageBarList;
    }
    //获取第一条记录id
    public int getFirstResult(){
        if(first == -1){
            if (this.pageLimit <= 0) {
                this.pageLimit = PAGE_DEFAULT_LIMIT;
            }
            first = (this.currentPage - 1) * this.pageLimit;
        }
        return first;
    }
    public String getCurrent() {
        current = Integer.toString(currentPage);
        return current;
    }
    public int getFirst() {
        if(first == -1){
            if (this.pageLimit <= 0) {
                this.pageLimit = PAGE_DEFAULT_LIMIT;
            }
            first = (this.currentPage - 1) * this.pageLimit;
        }
        return first;
    }
    public String getUrl() {
        return url;
    }
    public Pager setUrl(String url) {
        this.url = url;
        return this;
    }
    public String getParam() {
        return param;
    }
    public void setParam(String param) {
        this.param = param;
    }
    public int getStart() {
        return start;
    }
    public void setStart(int start) {
        this.start = start;
    }


    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }
    public String page(int page,int total,int pageSize,String url){
        //总页数
        int pageCount = 0;
        if(total%pageSize==0){
            pageCount = total/pageSize;
        }else{
            pageCount = (total/pageSize) + 1;
        }
        if(pageCount==0)pageCount=1;
        //开始条数
        int startIndex = 1;
        int endIndex = pageCount;

        if(page > 9)
            startIndex = page - 5;
        int p = pageCount - 5;
        if(page < p)
            endIndex = page + 5;
        StringBuffer pageStr = new StringBuffer();
        pageStr.append("<div class=\"page\" style='margin:27px 0 18px 0'>");
        StringBuffer str = new StringBuffer();
        if(page > 1){
            pageStr.append("<a class='first false' href=\"/"+url+"?"+str.toString()+"\">首页</a><a class='prev' href=\"/"+url+"?page="+(page-1)+"&"+str.toString()+"\">&lt;上一页</a>");
        }

        for (int i = startIndex; i <= endIndex; i++) {
            if(i == page){
                pageStr.append("<a class=\"cur no1\">"+i+"</a>");
            }else{
                pageStr.append("<a href=\"/"+url+"?page="+i+"&"+str.toString()+"\">"+i+"</a>");
            }
        }

        if(page < pageCount){
            pageStr.append("<a class='next' href=\"/"+url+"?page="+(page+1)+"&"+str.toString()+"\">&gt;下一页</a><a class='last' href=\"/"+url+"?page="+pageCount+"&"+str.toString()+"\">尾页</a>");
        }
        pageStr.append("</div>");
        return pageStr.toString();
    }
}
