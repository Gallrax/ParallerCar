<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/13
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content">

        <div class="row">
            <div class="column grid-20">
                <div class="path">当前位置：<a href="${pageContext.request.contextPath}/index.jsp">首页</a>&nbsp;&gt;&nbsp;<span id="tit">个人信息</span></div>
            </div>
        </div>
        <div class="row">
            <div class="column grid-4">

                <div class="inbox">
                    <div class="inbox-title">用户管理中心</div>
                    <div class="inbox-con">
                        <ul id="footer_tab" class="user-nav">
                            <li><a href="${pageContext.request.contextPath}/userSaleInfo.jsp?">车源管理<i class="icon-arrow"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/userFindInfo.jsp" >求购管理<i class="icon-arrow"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/userInfo.jsp" >个人基本信息<i class="icon-arrow"></i></a></li>
                            <li><a href="${pageContext.request.contextPath}/pwd.jsp" >修改密码<i class="icon-arrow"></i></a></li>
                            <%--<li><a href="http://www.topcars.cn/dealer/20426/">我的主页<i class="icon-arrow"></i></a></li>--%>
                            <li class="last-li"><a href="#">联系管理员<i class="icon-arrow"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>

