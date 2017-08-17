<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/13
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<jsp:include page="head.jsp"/>
<body>

<div class="content">
    <div class="row">
        <div class="column grid-20">

            <div class="caricon">
                <ul>
                    <li class="caricon01"><a href="${pageContext.request.contextPath}/saleInfos.jsp?car.type=C">轿车</a></li>
                    <li class="caricon03"><a href="${pageContext.request.contextPath}/saleInfos.jsp?car.type=SUV">SUV</a></li>
                    <li class="caricon02"><a href="${pageContext.request.contextPath}/saleInfos.jsp?car.type=MPV">MPV</a></li>
                    <li class="caricon04"><a href="${pageContext.request.contextPath}/saleInfos.jsp?car.type=SC">跑车</a></li>
                </ul>
            </div>

            <div class="hotcar">
                <ul>
                    <li><span id="brand">热门品牌：</span></li>
                    <li><span id="model">热卖车型：</span></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="column grid-20">

            <div class="inbox recom">
                <div class="inbox-title">寻车快报<span class="sub-title"></span></div>
                <div class="inbox-con inbox-con-noborder">
                    <ul id="findInfo" class="inlist01 ribao-inlist">
                       <%-- <li><a target="_blank" href="http://www.topcars.cn/news/6691.html">定金寻车！17款柴油创世</a></li>--%>
                    </ul>
                </div>
            </div>

        </div>
    </div>


    <div class="row">
        <div class="column grid-20">

            <div class="inbox recom">
                <div class="inbox-title">车源快报<span class="sub-title"></span></div>
                <div class="inbox-con inbox-con-noborder">
                    <ul id="saleInfo" class="inlist01 ribao-inlist">
                        <%--<li><a target="_blank" href="http://www.topcars.cn/news/6689.html">特价！17款加版莱万特 Levante S</a></li>--%>
                    </ul>
                </div>
            </div>

        </div>
    </div>



    <div class="row">
        <div class="column grid-14">
            <div class="inbox resource">
                <div class="inbox-title">
                    <h2>最新资源表</h2>
                    <div class="dealer-tab" id="newest">
                        <ul>
                            <li class="current"><a href="http://www.topcars.cn/source.html?&member_type=2" target="_blank">公司资源表</a><i class="baseline"></i></li>
                        </ul>
                    </div>
                    <a class="inbox-right" href="http://www.topcars.cn/source.html">查看更多资源表>></a>
                </div>
                <div class="inbox-con">
                    <div class="tab-content" id="newest_content">
                        <div class="tab-content-item current">
                            <table cellpadding="0" cellspacing="0" border="0" class="table-resource" style="font-size: 12px;">
                                <tr id="user">
                                    <th width="20%" class="tabletd1">资源表名称</th>
                                    <th width="12%">所在城市</th>
                                    <th width="40%">资源表相关品牌</th>
                                    <th width="13%">更新时间</th>
                                    <th width="15%">预览</th>
                                </tr>
                                <%--<tr class="tablebg"  >
                                    <td class="tabletd1"><a href="http://www.topcars.cn/dealer/20364/" alt="绵阳众森汽车销售服务有限公司" title="绵阳众森汽车销售服务有限公司">绵阳众森汽车销售</a></td>
                                    <td>绵阳市</td>
                                    <td alt="路虎,丰田" title="路虎,丰田">路虎,丰田</td>
                                    <td><span class="table-date">2017-04-10</span></td>
                                    <td><a href="http://www.topcars.cn/dealer/20364/">浏览</a></td>
                                </tr>--%>
                                <%--<tr  >
                                    <td class="tabletd1"><a href="http://www.topcars.cn/dealer/20359/" alt="嘉恒鼎峰平行进口汽车销售" title="嘉恒鼎峰平行进口汽车销售">嘉恒鼎峰平行进口</a></td>
                                    <td>苏州市</td>
                                    <td alt="保时捷,宝马" title="保时捷,宝马">保时捷,宝马</td>
                                    <td><span class="table-date">2017-04-10</span></td>
                                    <td><a href="http://www.topcars.cn/dealer/20359/">浏览</a></td>
                                </tr>--%>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="column grid-6">
            <div class="inbox publish">
                <div class="inbox-con">
                    <a class="btn-resource" id="btn_add_resource" href="${pageContext.request.contextPath}/saleInfo/writeSaleInfo"><i class="icon-write"></i>免费发布车源信息</a>
                    <a class="btn-carsource" id="btn_add_want_buy" href="${pageContext.request.contextPath}/findInfo/writeFindInfo"><i class="icon-write"></i>免费发布寻车信息</a>
                </div>
            </div>
            <div class="inbox oneweek fn-mb10">
                <div class="inbox-title">诚信车商车源</div>
                <div class="inbox-con inbox-con-noborder">
                    <div><a class="red" href="http://www.topcars.cn/hotcar.html">Topcars联合诚信平行进口车圈</a></div>
                </div>
            </div>    </div>
    </div>
    <div class="row">
        <div class="column grid-14">
            <div class="inbox">
                <div class="inbox-title">
                    <h2>最新车源报价</h2>
                    <a class="inbox-right" href="http://www.topcars.cn/cars/">查看更多车源>></a>
                </div>
                <div class="inbox-con">
                    <div class="tab-content" id="carsource_content">
                        <div class="tab-content-item current">
                            <table cellpadding="0" cellspacing="0" border="0" class="table-resource" style="font-size: 12px;">
                                <tr id="price">
                                    <th width="50%" class="tabletd1">车型名</th>
                                    <th width="10%">报价</th>
                                    <th width="10%">状态</th>
                                    <th width="30%">经销商</th>
                                </tr>
                                <%--<tr class="tablebg">
                                    <td class="tabletd1"><a href="http://www.topcars.cn/cars/49236.html" title="2016款 丰田塔库玛 3.5 一门半 手动" alt="2016款 丰田塔库玛 3.5 一门半 手动">2016款 丰田塔库玛 3.5 一门半 手</a></td>
                                    <td><span class="red">40.00万</span></td>
                                    <td>现货</td>
                                    <td><a href="http://www.topcars.cn/dealer/14148/" title="鼎和天津进出口有限公司" >鼎和天津进出口有</a> <i class="tag tag-bred">批发商</i></td>
                                </tr>--%>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="column grid-6">
            <div class="inbox">
                <div class="inbox-title">寻车信息<a class="inbox-right" href="http://www.topcars.cn/buy/">更多>></a></div>
                <div class="inbox-con">
                    <ul id="findInfo2" class="inlist01">
                        <%--<li><span>武汉市</span><a href="http://www.topcars.cn/buy/865.html" title="2016款 Mustang 2.3T" >2016款 Mustang 2.3T</a></li>
                        <li><span>天津市</span><a href="http://www.topcars.cn/buy/864.html" title="2015款 Jeep罗宾汉 3.6L 两门版 汽油" >2015款 Jeep罗宾汉 3.6L 两门版 </a></li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="tail.jsp"/>

<%--<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
<script type="application/javascript">
    $(function(){

        //加载时间
        var today = new Date().getFullYear() + "-" + (new Date().getMonth() + 1) + "-" + new Date().getDate();
        $(".sub-title").append(today);

        //加载品牌
        $.ajax({
            url: '${pageContext.request.contextPath}/brand/findAll',
            type: 'get',
            success: function (data) {
                var a = "";
                $.each(data, function (index, val) {
                    a += "<a href='${pageContext.request.contextPath}/saleInfos.jsp?car.brand.bid="+ val.id +"'>" + val.name + "</a>";
                });
                $("#brand").after(a);
            }
        });

        //加载热卖车型
        $.ajax({
            url: '${pageContext.request.contextPath}/brand/findByHot',
            type: 'get',
            data: 'pager.currentPage=1',
            success: function (data) {
                var a = "";
                $.each(data, function (index, val) {
                    a += "<a href='${pageContext.request.contextPath}/saleInfos.jsp?car.id="+ val.id +"'>" + val.name + "</a>";
                });
                $("#model").after(a);
            }
        });

        //加载寻车快报    -个人
        $.ajax({
            url: '${pageContext.request.contextPath}/findInfo/findAndFields',
            type: 'get',
            data: 'fields=user.isAlone&values=0&pager.currentPage=1',
            success: function (data) {
                var a = "";
                $.each(data, function (index, val) {
                    a += "<li><a target='_blank' href='${pageContext.request.contextPath}/findInfo/findInfoDetail?id="+ val.id +"'>" + val.title + "</a></li>";
                });
                $("#findInfo").append(a);
            }
        });

        //加载车源快报    -个人
        $.ajax({
            url: '${pageContext.request.contextPath}/saleInfo/findAndFields',
            type: 'get',
            data: 'fields=user.isAlone&values=0&pager.currentPage=1',
            success: function (data) {
                var a = "";
                $.each(data, function (index, val) {
                    a += "<li><a target='_blank' href='${pageContext.request.contextPath}/saleInfo/saleInfoDetail?id="+ val.id +"'>" + val.title + "</a></li>";
                });
                $("#saleInfo").append(a);
            }
        });

        //加载最新资源    -公司
        $.ajax({
            url: '${pageContext.request.contextPath}/user/findAndFields',
            type: 'get',
            data: 'fields=isAlone&values=1&pager.currentPage=1',
            success: function (data) {
                var a = "";
                $.each(data, function (index, val) {
                    var date = new Date(val.insertTime);
                    var insertTime = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate()
                    a += "<tr class='tablebg'  ><td class='tabletd1'><a href='#'>" + val.company + "</a></td><td>" + val.city + "</td><td>" + val.business + "</td><td><span class='table-date'>" + insertTime + "</span></td><td><a href='#'>浏览</a></td></tr>";
                    //a += "<li><a target='_blank' href='#'>"+val.title+"</a></li>";
                });
                $("#user").after(a);
            }
        });

        //加载最新报价    -公司
        $.ajax({
            url: '${pageContext.request.contextPath}/saleInfo/findAndFields',
            type: 'get',
            data: 'fields=user.isAlone&values=1&pager.currentPage=1',
            success: function (data) {
                var a = "";
                $.each(data, function (index, val) {
                    a += "<tr class='tablebg'> <td class='tabletd1'><a href='${pageContext.request.contextPath}/saleInfo/saleInfoDetail?id="+ val.id +"' >" + val.title + "</a></td><td><span class='red'>" + val.price + "万</span></td><td>现货</td><td><a href='#'>" + val.user.company + "</a> <i class='tag tag-bred'>批发商</i></td></tr>";
                    //a += "<li><a target='_blank' href='#'>"+val.title+"</a></li>";
                });
                $("#price").after(a);
            }
        });

        //加载寻车信息    -公司
        $.ajax({
            url: '${pageContext.request.contextPath}/findInfo/findAndFields',
            type: 'get',
            data: 'fields=user.isAlone&values=1&pager.currentPage=1',
            success : function(data){
                var a = "";
                $.each(data, function(index, val) {
                    a += "<li><span>"+val.user.city+"</span><a href='${pageContext.request.contextPath}/findInfo/findInfoDetail?id="+ val.id +"'>"+val.title+"</a></li>";
                    //a += "<li><a target='_blank' href='#'>"+val.title+"</a></li>";
                });
                $("#findInfo2").append(a);
            }
        });

    });
</script>
</body>
</html>