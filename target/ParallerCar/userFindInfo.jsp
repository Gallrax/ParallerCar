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
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/jquery.Jcrop.css" rel="stylesheet" type="text/css">
<body>
    <jsp:include page="userCenter.jsp"/>
    <div class="column grid-16">
        <div class="inbox">
            <div class="inbox-title">求购管理<a href="${pageContext.request.contextPath}/findInfo/writeFindInfo" class="inbox-right">发布寻车信息&gt;&gt;</a></div>
            <div class="inbox-con findcon">
                <table id="tb" cellpadding="0" cellspacing="0" border="0" class="table-user3">
                    <tr id="fi">
                        <th>对应车系</th>
                        <th>标题</th>
                        <th>发布时间</th>
                        <th class="lasttd">操作</th>
                    </tr>
                    <%--<tr>
                        <td>2016款 丰田霸道2700TXL 迪拜版</td>
                        <td><a href="http://www.topcars.cn/buy/869.html">测试数据，勿扰</a></td>
                        <td>2017-04-20 15:12</td>
                        <td class="lasttd"><a href="http://www.topcars.cn/?c=user&m=edit_wantbuy_info&wid=869">修改</a>&nbsp;&nbsp;<a href="http://www.topcars.cn/?c=user&m=del_wantbuy&wid=869" onclick="javascript:if(!confirm('确定要删除吗？\n此操作不可以恢复！')) { return false; }">删除</a></td>
                    </tr>--%>
                </table>
                <div style="width: 100px;height: 10px;margin:20px auto; text-align: center">
                    <table cellspacing="10%" style="width:100%;height:100%;">
                        <tr id="page">
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    </div><%--不可少，与子页面userCenter.jsp对应--%>
    </div><%--不可少，与子页面userCenter.jsp对应--%>
    <script>

        var index = 0;

        $(function () {

            $("#footer_tab li:eq(1)").addClass("current");

            //获取数据
            /*$.ajax({
             url : "${pageContext.request.contextPath}/findInfo/findAndFields",
             type : "get",
             data : "pager.currentPage=1&fields=user.uid&values="+ $("#uid").val(),
             success : function(data) {
             var str = "";
             if(data != ""){
             for(var i = 0; i < data.length; i++){
             str += "<tr><td>"+ data[i].car.name +"</td><td><a href=\"#\">"+ data[i].title +"</a></td><td>"+ data[i].insertTime +"</td><td class=\"lasttd\"><a href=\"${pageContext.request.contextPath}/findInfo/writeFindInfo?id="+ data[i].id +"\">修改</a>&nbsp;&nbsp;<a href=\"${pageContext.request.contextPath}/findInfo/deleteFindInfo?id="+ data[i].id +"\"/>删除</a></td></tr>\";"
             }
             $("#fi").after(str);
             }
             }
             });*/
            getData(1);

            //获取分页
            $.ajax({
                url : "${pageContext.request.contextPath}/findInfo/findPager",
                type : "get",
                data : "fields=user.uid&values="+ $("#uid").val(),
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
        });

        function flush(e) {
            for (var i=1; i<=index; i++) {
                $("#a"+i).css("color", "blue");
            }
            $("#a"+e).css("color", "red");
            $("#tb tr:not(:first)").empty();
            getData(e);
        }

        function getData(i) {
            //获取数据
            $.ajax({
                url : "${pageContext.request.contextPath}/findInfo/findAndFields",
                type : "get",
                data : "currentPage="+ i +"&fields=user.uid&values="+ $("#uid").val(),
                success : function(data) {
                    var str = "";
                    if(data != ""){
                        for(var i = 0; i < data.length; i++){
                            str += "<tr><td>"+ data[i].car.name +"</td><td><a href=\"#\">"+ data[i].title +"</a></td><td>"+ data[i].insertTime +"</td><td class=\"lasttd\"><a href=\"${pageContext.request.contextPath}/findInfo/writeFindInfo?id="+ data[i].id +"\">修改</a>&nbsp;&nbsp;<a href=\"${pageContext.request.contextPath}/findInfo/deleteFindInfo?id="+ data[i].id +"\">删除</a></td></tr>\";"
                        }
                        $("#fi").after(str);
                    }
                }
            });
        }
    </script>
</body>
<jsp:include page="tail.jsp"/>
</html>