<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/20
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/jquery.Jcrop.css" rel="stylesheet" type="text/css">
<body>
<jsp:include page="userCenter.jsp"/>
<div class="column grid-16">
    <div class="inbox">
        <div class="inbox-title">发布求购信息</div>
        <div class="inbox-con">
        </div>
        <c:if test="${findInfo == null}">
            <form name="want_buy_form" id="want_buy_form" method="post" action="${pageContext.request.contextPath}/findInfo/saveFindInfo">
        </c:if>
        <c:if test="${findInfo != null}">
            <form name="want_buy_form" id="want_buy_form" method="post" action="${pageContext.request.contextPath}/findInfo/updateFindInfo">
        </c:if>
            <table cellpadding="0" cellspacing="0" border="0" class="table-user1">
                <input type="hidden" name="id" value="${findInfo.id}"/>
                <input type="hidden" name="user.id" value="${sessionScope.user.id}"/>
                <input type="date" name="insertTime" value="${fn:substringBefore(findInfo.insertTime, " ")}" style="display: none"/>
                <tr>
                    <th>选择要找的车型：</th>
                    <td>
                        <input id="sid" type="hidden" value="${findInfo.source.id}">
                        <select class="sel-user1" name="source.id" id="buy_import_type">
                            <%--<option value="0">进口方式</option>
                            <option value="1">美规</option>
                            <option value="3">中东版</option>
                            <option value="5">加版</option>--%>
                        </select>
                        <input id="bid" type="hidden" value="${findInfo.car.brand.id}">
                        <select class="sel-user2" name="brand_id" id="brand_id" >
                            <%--<option value="0">选择品牌</option>
                            <option value="286">A-奥迪</option>
                            <option value="291">B-奔驰</option>
                            <option value="290">B-宝马</option>
                            <option value="300">F-福特</option>
                            <option value="299">F-丰田</option>
                            <option value="310">L-路虎</option>--%>
                        </select>
                        <input id="cid" type="hidden" value="${findInfo.car.id}">
                        <select class="sel-user2" name="car.id" id="series_id">
                            <%--<option value="0">选择车系</option>
                            <option value="${findInfo.car.id}">${findInfo.car.name}</option>--%>
                        </select>

                    </td>
                </tr>
                <tr>
                    <th>标题：</th>
                    <td><input type="text" class="txt-user4" name="title" id="buy_title" value="${findInfo.title}"></td>
                </tr>
                <tr>
                    <th>外观颜色：</th>
                    <td>
                        <select class="sel-user2" name="outerColor" >
                            <c:if test="${findInfo.innerColor == '黑'}">
                                <option value="黑" selected="selected">黑</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '黑'}">
                                <option value="黑">黑</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor == '白'}">
                                <option value="白" selected="selected">白</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '白'}">
                                <option value="白">白</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor == '棕'}">
                                <option value="棕" selected="selected">棕</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '棕'}">
                                <option value="棕">棕</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor == '红'}">
                                <option value="红" selected="selected">红</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '红'}">
                                <option value="红">红</option>
                            </c:if>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>内饰颜色：</th>
                    <td>
                        <select class="sel-user2" name="innerColor" >
                            <c:if test="${findInfo.innerColor == '黑'}">
                                <option value="黑" selected="selected">黑</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '黑'}">
                                <option value="黑">黑</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor == '米'}">
                                <option value="米" selected="selected">米</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '米'}">
                                <option value="米">米</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor == '棕'}">
                                <option value="棕" selected="selected">棕</option>
                            </c:if>
                            <c:if test="${findInfo.innerColor != '棕'}">
                                <option value="棕">棕</option>
                            </c:if>
                            <option value="不限">不限</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>有效期：</th>
                    <td>
                        <select class="sel-user2" name="valid" >
                            <c:if test="${findInfo.valid == '一天'}">
                                <option value="黑" selected="selected">一天</option>
                            </c:if>
                            <c:if test="${findInfo.valid != '一天'}">
                                <option value="一天">一天</option>
                            </c:if>
                            <c:if test="${findInfo.valid == '三天'}">
                                <option value="三天" selected="selected">三天</option>
                            </c:if>
                            <c:if test="${findInfo.valid != '三天'}">
                                <option value="三天">三天</option>
                            </c:if>
                            <c:if test="${findInfo.valid == '一周'}">
                                <option value="一周" selected="selected">一周</option>
                            </c:if>
                            <c:if test="${findInfo.valid != '一周'}">
                                <option value="一周">一周</option>
                            </c:if>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th valign="top">详细描述需求：</th>
                    <td>
                        <div class="setmsg finddes">
                            <textarea class="tarea-setmsg" name="content" id="buy_detail_des">${findInfo.content}</textarea>
                            <div class="setmsg-submit">
                                <a class="btn btn-cyan" href="javascript:void(0);" id="submit_want_buy">发送</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>

        </form>
    </div>
</div>

</div><%--不可少，与子页面userCenter.jsp .row对应--%>
</div><%--不可少，与子页面userCenter.jsp .content对应--%>
<script>
    $(function () {

        $("#footer_tab li:eq(1)").addClass("current");

        //获取进口方式
        $.ajax({
            url : "${pageContext.request.contextPath}/source/findAll",
            type : "get",
            async: false,
            success : function(data) {
                var str = "";
                if(data != ""){
                    for(var i = 0; i < data.length; i++){
                        if(data[i].id == $("#sid").val()){
                            str += "<option value="+ data[i].id +" selected='selected'>"+ data[i].name +"</option>";
                        }else {
                            str += "<option value="+ data[i].id +">"+ data[i].name +"</option>";
                        }
                    }
                    $("#buy_import_type").append(str);
                }
            }
        });

        //获取品牌
        $.ajax({
            url : "${pageContext.request.contextPath}/brand/findAll",
            type : "get",
            async: false,
            success : function(data) {
                var str = "";
                if(data != ""){
                    for(var i = 0; i < data.length; i++){
                        if(data[i].id == $("#bid").val()){
                            str += "<option value="+ data[i].id +" selected='selected'>"+ data[i].name +"</option>";
                        }else {
                            str += "<option value="+ data[i].id +">"+ data[i].name +"</option>";
                        }
                    }
                    $("#brand_id").append(str);
                }
            }
        });

        //获取车系
        $.ajax({
            url : "${pageContext.request.contextPath}/car/findAndFields",
            type : "get",
            data : "fields=brand.bid&values="+ $("#brand_id").val(),
            async: false,
            success : function(data) {
                var str = "";
                if(data != ""){
                    for(var i = 0; i < data.length; i++){
                        if(data[i].id == $("#cid").val()){
                            str += "<option value="+ data[i].id +" selected='selected'>"+ data[i].name +"</option>";
                        }else {
                            str += "<option value="+ data[i].id +">"+ data[i].name +"</option>";
                        }
                    }
                    $("#series_id").append(str);
                }
            }
        });

        $("#brand_id").change(function () {
            //获取车系
            $.ajax({
                url : "${pageContext.request.contextPath}/car/findAndFields",
                type : "get",
                data : "fields=brand.bid&values="+ $("#brand_id").val(),
                async: false,
                success : function(data) {
                    var str = "";
                    if(data != ""){
                        for(var i = 0; i < data.length; i++){
                            if(data[i].id == $("#bid").val()){
                                str += "<option value="+ data[i].id +" selected='selected'>"+ data[i].name +"</option>";
                            }else {
                                str += "<option value="+ data[i].id +">"+ data[i].name +"</option>";
                            }
                        }
                        $("#series_id").empty();
                        $("#series_id").append(str);
                    }
                }
            });
        });

        $("#submit_want_buy").click(function(){
            if($("#model_id").val() == 0)
            {
                alert("请选择车型信息");
                return false;
            }
            if($("#buy_title").val() == "")
            {
                alert("请填写标题信息");
                return false;
            }
            if(!$("#buy_import_type").val())
            {
                alert("请选择进口方式");
                return false;
            }
            if(!$("#buy_detail_des").val())
            {
                alert("请填写描述信息");
                return false;
            }
            setTimeout(function(){$("#want_buy_form").submit();}, 500);
            return true;
        });

    });
</script>
</body>
<jsp:include page="tail.jsp"/>
</html>