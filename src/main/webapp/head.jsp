<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/13
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8"/>
    <title>平行进口车-值得您信赖的平行进口车车源平台</title>
    <link href="${pageContext.request.contextPath}/css/public.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/wbox.css" rel="stylesheet" type="text/css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>

<div class="header">
    <div class="header-content">
        <div class="logo"><a href="${pageContext.request.contextPath}/index.jsp" style="margin-top: 30px; font-size: 24px">平行进口车</a></div>

        <%--if判断--%>
        <c:if test="${sessionScope.user != null}" >
            <div class="header-log">
                <div class="hlog-unit fn-pr10">
                    <div class="hlog-item current">
                        <a href="${pageContext.request.contextPath}/userInfo.jsp">${sessionScope.user.name}</a>
                    </div>
                    <i class="icon-arrow5"></i>
                </div>
                <div class="hlog-unit" id="register_div">
                    <input type="hidden" id="uid" value="${sessionScope.user.id}"/>
                    <div class="hlog-item"><a href="${pageContext.request.contextPath}/user/logout">安全退出</a></div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <div class="header-log">
                <div class="hlog-unit fn-pr10">
                    <div class="hlog-item current">
                        <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
                    </div>
                    <i class="icon-arrow5"></i>
                </div>
                <div class="hlog-unit" id="register_div">
                    <div class="hlog-item"><a href="${pageContext.request.contextPath}/regist.jsp">注册</a></div>
                </div>
            </div>
        </c:if>
    </div>
</div>

<%--绿色横线--%>
<div class="topline"></div>

<!--导航区域开始-->
<div class="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
        <li><a href="${pageContext.request.contextPath}/saleInfos.jsp">找车源</a></li>
        <li><a href="${pageContext.request.contextPath}/resource.jsp">资源表</a></li>
        <li><a href="${pageContext.request.contextPath}/findInfos.jsp">寻车信息</a></li>
    </ul>
</div>
<!--导航区域结束-->