<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<head>
    <link href="${pageContext.request.contextPath}/css/carsource.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="content">
    <div class="row">
        <div class="column grid-20">
            <div class="usearea">
                <div class="searchbar">
                    <div class="search">
                        <div class="search-left"><i class="icon-search"></i></div>
                        <input type="text" class="txt-search" style="" name="search_table" id="search_table"
                               placeholder="请输入公司名称、个人名称、品牌名称…">
                    </div>
                    <a href="#" onclick="searchOr()" class="btn-search" id="search_btn">搜索</a>
                </div>
            </div>

            <div class="path">当前位置：<a href="${pageContext.request.contextPath}/index.jsp">首页</a>&nbsp;&gt;&nbsp;车源信息</div>
        </div>
    </div>


    <div class="row">
        <div class="column grid-14 fn-visible">

            <div class="inbox fn-mb10 filter">
                <div class="inbox-title">
                    <h2>条件筛选</h2>
                </div>
                <div class="inbox-con">
                    <!--2014-09-03 修改-->
                    <ul class="filter-list">
                        <li id="brand">
                            <span class="filter-tit">品牌：</span>
                            <a href="#" onclick="changeBrand(0)" class="cur">全部</a>
                            <a href="#" onclick="changeBrand(1)">奔驰</a>
                            <a href="#" onclick="changeBrand(2)">宝马</a>
                            <a href="#" onclick="changeBrand(3)">奥迪</a>
                            <a href="#" onclick="changeBrand(4)">丰田</a>
                            <a href="#" onclick="changeBrand(5)">福特</a>
                        </li>

                        <li id="source">
                            <span class="filter-tit">规格：</span>
                            <a class="cur" href="#" onclick="changeSource(0)">不限</a>
                            <a href="#" onclick="changeSource(1)">美规</a>
                            <a href="#" onclick="changeSource(2)">加版</a>
                            <a href="#" onclick="changeSource(3)">中东版</a>
                        </li>

                        <li id="type">
                            <span class="filter-tit">结构：</span>
                            <a class="cur" href="#" onclick="changeType(0, '0')">不限</a>
                            <a href="#" onclick="changeType(1, 'C')">轿车</a>
                            <a href="#" onclick="changeType(2, 'SUV')">SUV</a>
                            <a href="#" onclick="changeType(3, 'MPV')">MPV</a>
                            <a href="#" onclick="changeType(4, 'SC')">跑车</a>
                        </li>

                        <li id="city">
                            <span class="filter-tit">城市：</span>
                            <a class="cur" href="#" onclick="changeCity(0, '0')">不限</a>
                            <a href="#" onclick="changeCity(1, '北京')">北京市</a>
                            <a href="#" onclick="changeCity(2, '西安')">西安市</a>
                            <a href="#" onclick="changeCity(3, '郑州')">郑州市</a>
                        </li>
                    </ul>
                    <!--2014-09-03 修改-->
                </div>
            </div>


            <div class="inbox">
                <div class="inbox-title">
                    <h2>车源信息列表</h2>
                </div>
                <div class="inbox-con">
                    <table id="table" cellpadding="0" cellspacing="0" border="0" class="table-resource">
                        <tr>
                            <th class="tabletd1">标题</th>
                            <th>价格</th>
                            <th>颜色</th>
                            <th>地区</th>
                            <th>发布人</th>
                            <th>发布时间</th>
                        </tr>
                        <%--<tr>
                            <td class="tabletd1"><a href="http://www.topcars.cn/buy/849.html"
                                                    title="2017款 丰田兰德酷路泽4000 GXR">2017款 丰田兰德酷路泽4000 GXR</a></td>
                            <td>黑/棕</td>
                            <td>重庆市</td>
                            <td><a href="http://www.topcars.cn/dealer/19248/" title="舒元甲">舒元甲</a></td>
                            <td><span class="grey">02月14日</span></td>
                        </tr>--%>
                    </table>

                    <div id="page" class="page">
                        <%--<span class="page-item-info">共23页</span>--%>
                        <%--&nbsp;<a href="#"> 下一页</a>&nbsp;&nbsp;<a href="#">末页</a>--%>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<jsp:include page="tail.jsp"/>
</html>
<script>

    var brand = null;
    var type = null;
    var source = null;
    var city = null;

    var index = 0;//总页数
    var str = null;

    var search = null;

    $(function () {
        brand = getQueryString("car.brand.bid");
        if(brand != null && brand != "") changeBrand(brand);
        source = getQueryString("source.sid");
        type = getQueryString("car.type");
        if(type != null && type != "") changeType(judge(type), type);
        city = getQueryString("user.city");
        changeStr();

    });

    //根据字段匹配搜索And
    function getData(i, str) {
        $("#table  tr:not(:first)").empty();
        $.ajax({
            url : "${pageContext.request.contextPath}/saleInfo/findAndFields",
            type : "get",
            data : "currentPage="+ i + str,
            success : function(data) {
                var str = "";
                if(data != ""){
                    for(var i = 0; i < data.length; i++){
                        str += "<tr class=\"tablebg\"><td class=\"tabletd1\"><a href=\"${pageContext.request.contextPath}/saleInfo/saleInfoDetail?id="+ data[i].id +"\">"+ data[i].title +"</a></td><td><span class=\"red\">"+ data[i].price +"</span></td><td>"+ data[i].outerColor +"/"+ data[i].innerColor +"</td><td>"+ data[i].user.city +"</td><td><span class=\"table-date\">"+ data[i].user.name +"</span></td><td>"+ data[i].insertTime +"</td></tr>";
                    }
                    $("#table").append(str);
                }
            }
        });
    }

    function searchOr() {
        searchValue(1);
        getSearchPager(str);
    }

    //根据关键字搜索Or
    function searchValue(i) {
        search = $("#search_table").val();
        if(search == "" || search == null) return false;
        var value = encodeURI(encodeURI(search));
        str = "&value=" + value;
        $("#table  tr:not(:first)").empty();
        $.ajax({
            url : "${pageContext.request.contextPath}/saleInfo/searchByValue",
            type : "get",
            data : "currentPage="+ i + str,
            success : function(data) {
                var str = "";
                if(data != ""){
                    for(var i = 0; i < data.length; i++){
                        str += "<tr class=\"tablebg\"><td class=\"tabletd1\"><a href=\"${pageContext.request.contextPath}/saleInfo/saleInfoDetail?id="+ data[i].id +"\">"+ data[i].title +"</a></td><td><span class=\"red\">"+ data[i].price +"</span></td><td>"+ data[i].outerColor +"/"+ data[i].innerColor +"</td><td>"+ data[i].user.city +"</td><td><span class=\"table-date\">"+ data[i].user.name +"</span></td><td>"+ data[i].insertTime +"</td></tr>";
                    }
                    $("#table").append(str);
                }
            }
        });
    }

    //根据关键字搜索And
    function getPager(str) {
        $("#page").empty();
        str = str.substring(1, str.length);
        //获取分页
        $.ajax({
            url : "${pageContext.request.contextPath}/saleInfo/findPager",
            type : "get",
            data : str,
            success : function(data) {
                if(data != ""){
                    index = data.totalPage;
                    var str = "<span class=\"page-item-info\">共"+ index +"页</span>&nbsp;";
                    for(var i=1; i<=data.totalPage; i++){
                        if(i == data.currentPage){
                            str += "&nbsp;<a id=\"a"+ i +"\" href=\"javascript:void(0);\" onclick='flush("+ i +")' class=\"cur\">"+ i +"</a>";
                        }else{
                            str += "&nbsp;<a id=\"a"+ i +"\" href=\"\" onclick='flush("+ i +")'>"+ i +"</a>";
                        }
                    }
                    $("#page").append(str);
                }
            }
        });
    }

    //根据关键字搜索Or
    function getSearchPager(str) {
        $("#page").empty();
        str = str.substring(1, str.length);
        //获取分页
        $.ajax({
            url : "${pageContext.request.contextPath}/saleInfo/findSearchPager",
            type : "get",
            data : str,
            success : function(data) {
                if(data != ""){
                    index = data.totalPage;
                    var str = "<span class=\"page-item-info\">共"+ index +"页</span>&nbsp;";
                    for(var i=1; i<=data.totalPage; i++){
                        if(i == data.currentPage){
                            str += "&nbsp;<a id=\"a"+ i +"\" href=\"#\" onclick='flush("+ i +")' class=\"cur\">"+ i +"</a>";
                        }else{
                            str += "&nbsp;<a id=\"a"+ i +"\" href=\"#\" onclick='flush("+ i +")'>"+ i +"</a>";
                        }
                    }
                    $("#page").append(str);
                }
            }
        });
    }

    function flush(e) {
        for (var i=1; i<=index; i++) {
            $("#a" + i).removeClass();
        }
        $("#a"+ e).addClass("cur");
        if(search != null && search != ""){
            searchValue(e);
        }else{
            getData(e, str);
        }
    }

    //获取url参数列表(根据key找value) 无为null
    function getQueryString(key) {
        /*var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;*/
        var url = location.search.replace(/^\?/,'').split('&');
        var paramsObj = {};
        for(var i = 0, iLen = url.length; i < iLen; i++){
            var param = url[i].split('=');
            paramsObj[param[0]] = param[1];
        }
        if(key){
            return paramsObj[key] || '';
        }
        return paramsObj;

    }

    function changeBrand(id) {
        $("#search_table").val("");
        $("#brand a").each(function(i, e){
            $(e).removeClass();
        });
        $("#brand a:eq(" + id + ")").addClass("cur");
        brand = id;
        if(id == 0) brand = null;
        changeStr();
    }

    function changeSource(id) {
        $("#search_table").val("");
        $("#source a").each(function(i, e){
            $(e).removeClass();
        });
        $("#source a:eq(" + id + ")").addClass("cur");
        source = id;
        if(id == 0) source = null;
        changeStr();
    }

    function changeType(i, t) {
        $("#search_table").val("");
        $("#type a").each(function(i, e){
            $(e).removeClass();
        });
        $("#type a:eq(" + i + ")").addClass("cur");
        type = t;
        if(i == 0) type = null;
        changeStr();
    }

    function changeCity(i, c) {//i为第几位
        $("#search_table").val("");
        $("#city a").each(function(i, e){
            $(e).removeClass();
        });
        $("#city a:eq(" + i + ")").addClass("cur");
        city = encodeURI(encodeURI(c));
        if(city == "0") city = null;
        changeStr();
    }

    function changeStr() {

        var fields = new Array();
        var values = new Array();

        if(brand != null && brand != ""){
            fields.push("car.brand.bid");
            values.push(brand);
        }
        if(source != null && source != ""){
            fields.push("source.sid");
            values.push(source);
        }
        if(type != null && type != ""){
            fields.push("car.type");
            values.push(type);
        }
        if(city != null && city != ""){
            fields.push("user.city");
            values.push(city);
        }
        str = getStr(fields, values);
        getData(1, str);
        getPager(str);
    }

    function getStr(fields, values) {
        var head = "";
        var foot = "";
        for(var i=0; i<fields.length; i++) {
            head += "&fields=" + fields[i];
            foot += "&values=" + values[i];
        }
        return head + foot;
    }

    function judge(type) {//根据类型判断位置刷新样式
        if(type == "C") return 1;
        if(type == "SUV") return 2;
        if(type == "MPV") return 3;
        if(type == "SC") return 4;
    }

</script>
