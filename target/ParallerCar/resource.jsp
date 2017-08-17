<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/24
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<head>
</head>
<body>
<div class="content">
    <div class="row">
        <div class="column grid-20">
            <%--<div class="usearea">
                <div class="searchbar">
                    <div class="search">
                        <div class="search-left"><i class="icon-search"></i></div>
                        <input type="text" class="txt-search" style="" name="search_table" id="search_table"
                               placeholder="请输入公司名称、个人名称、品牌名称…">
                    </div>
                    <a href="javascript:void(0);" class="btn-search" id="search_btn">搜索</a>
                </div>
            </div>--%>

            <div class="path">当前位置：<a href="${pageContext.request.contextPath}/index.jsp">首页</a>&nbsp;&gt;&nbsp;资源表</div>
        </div>
    </div>

    <div class="row">
        <div class="column grid-20">

            <div class="inbox">
                <div class="inbox-title">
                    <h2></h2>
                    <div class="dealer-tab">
                        <ul>
                            <li id="companyResource"><a href="#" onclick="ct()">公司资源表</a><i
                                    class="baseline"></i></li>
                            <li id="personResource"><a href="#" onclick="pt()">个人资源表</a><i
                                    class="baseline"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="inbox-con">
                    <div class="tab-content">
                        <div class="tab-content-item current">
                            <table cellspacing="0" cellpadding="0" border="0" class="table-resource">
                                <tbody id="table">
                                <%--<tr id="companyTr"><th class="tabletd1">资源表名称</th><th>所在城市</th><th>经营品牌</th><th>创建时间</th></tr>--%>
                                <%--<tr id="personTr"><th class="tabletd1">资源表名称</th><th>所在城市</th><th>创建时间</th></tr>--%>
                                <%--<tr class="tablebg">
                                    <td class="tabletd1"><a href="http://www.topcars.cn/dealer/20466/source.html">深圳海顺丰实业有限公司</a>
                                    </td>
                                    <td>深圳市</td>
                                    <td>奔驰,雪佛兰</td>
                                    <td><span class="table-date">2017-04-24</span></td>
                                </tr>--%>
                                </tbody>
                            </table>
                            <div style="width: 100px;height: 10px;margin:10px auto; text-align: center">
                                <table cellspacing="10%" style="width:100%;height:100%;">
                                    <tr id="page">

                                    </tr>
                                </table>
                            </div>
                        </div>
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

    var judge = 0;//判断当前是公司资源页还是个人资源页
    var index = 0;//资源总页数
    var ph = "<tr id=\"personTr\"><th class=\"tabletd1\">个人名称</th><th>所在城市</th><th>创建时间</th></tr>";
    var ch = "<tr id=\"companyTr\"><th class=\"tabletd1\">公司名称</th><th>所在城市</th><th>经营品牌</th><th>创建时间</th></tr>";

    $(function () {
        judge = 1;
        $("#table").append(ch);
        getData(1, 1);
        $("#personTr").hide();
        $("#companyResource").addClass("current");
        getPager(1);

    });

    function ct() {
        judge = 1;
        //样式取消和table的隐藏
        $("#personResource").removeClass();
        $("#companyResource").addClass("current");
        $("#personTr").hide();
        $("#companyTr").show();
        //页数重新获取
        $("#page").empty();
        getPager(judge);
        //刷新数据
        flush(1);
    }

    function pt() {
        judge = 0;
        $("#companyResource").removeClass();
        $("#personResource").addClass("current");
        $("#companyTr").hide();
        $("#personTr").show();
        $("#page").empty();
        getPager(judge);
        flush(1);
    }

    function flush(e) {
        for (var i=1; i<=index; i++) {
            $("#a"+i).css("color", "blue");
        }
        $("#a"+e).css("color", "red");
        $("#table").empty();
        if(judge == 0) $("#table").append(ph);
        if(judge == 1) $("#table").append(ch);
        getData(e, judge);
    }

    function getPager(judge) {//查询公司还是个人资源的判断
        //获取分页
        $.ajax({
            url : "${pageContext.request.contextPath}/user/findPager",
            type : "get",
            data : "fields=isAlone&values="+ judge,
            success : function(data) {
                var str = "";
                if(data != ""){
                    index = data.totalPage;
                    for(var i=1; i<=data.totalPage; i++){
                        if(i == data.currentPage){
                            str += "<td><a id='a"+ i +"' style='color:#F00' href='#' onclick='flush("+ i +")'>"+ i +"</a></td>&nbsp;";
                        }else{
                            str += "<td><a id='a"+ i +"' href='#' onclick='flush("+ i +")'>"+ i +"</a></td>&nbsp;";
                        }
                    }
                    $("#page").html(str);
                }
            }
        });
    }

    function getData(i, judge) {
        //获取资源
        $.ajax({
            url : "${pageContext.request.contextPath}/user/findAndFields",
            type : "get",
            data : "currentPage="+ i +"&fields=isAlone&values="+ judge,
            success : function(data) {
                var str = "";
                if(data != ""){
                    if(judge == 1){//显示公司数据
                        for(var i = 0; i < data.length; i++){
                            str += "<tr class=\"tablebg\"><td class=\"tabletd1\"><a href=\"#\">"+ data[i].company +"</a></td><td>"+ data[i].city +"</td><td>"+ data[i].business +"</td><td><span class=\"table-date\">"+ data[i].insertTime +"</span></td></tr>";
                        }
                    }else if(judge == 0){//显示个人数据
                        for(var i = 0; i < data.length; i++){
                            str += "<tr class=\"tablebg\"><td class=\"tabletd1\"><a href=\"#\">"+ data[i].name +"</a></td><td>"+ data[i].city +"</td><td><span class=\"table-date\">"+ data[i].insertTime +"</span></td></tr>";
                        }
                    }
                    $("#table").append(str);
                }
            }
        });
    }

</script>
