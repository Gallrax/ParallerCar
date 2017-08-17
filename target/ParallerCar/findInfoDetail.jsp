<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<head>
    <link href="${pageContext.request.contextPath}/css/dealer.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="content">
    <div class="row">
        <div class="column grid-20">
            <div class="path">当前位置：<a href="${pageContext.request.contextPath}/index.jsp">首页</a>&nbsp;&gt;&nbsp;<a href="${pageContext.request.contextPath}/findInfos.jsp">车源信息</a>&nbsp;&gt;&nbsp;查看详细内容</div>
        </div>
    </div>

    <div class="row">
        <div class="column grid-14">
            <div class="inbox details">
                <div class="inbox-title">
                    <h2>${findInfo.title}</h2>
                    <div class="details-date">发布日期 <fmt:formatDate value="${findInfo.insertTime}" pattern="yyyy-MM-dd"/> </div>
                </div>
                <div class="inbox-con">
                    <ul class="details-list">
                        <li><span>所在地区：</span>${findInfo.user.city}</li>
                        <li><span>联系电话：</span><i class="icon-phone"></i>
                            <c:if test="${sessionScope.user != null}">
                                <label id="show_telphone" class="red">${findInfo.user.phone}</label>
                            </c:if>
                            <c:if test="${sessionScope.user == null}">
                                <label id="show_telphone" class="red"><a href="${pageContext.request.contextPath}/login.jsp">登录即可查看手机号</a></label>
                            </c:if>
                        </li>
                        <li><span>外观颜色：</span>${findInfo.outerColor}</li>
                        <li><span>内饰颜色：</span>${findInfo.innerColor}</li>
                        <li><span>有效期：</span>${findInfo.valid}</li>
                        <li><span>进口类型：</span>${findInfo.source.name}</li>
                        <li class="long-li"><span>详细配置：</span>${findInfo.content}</li>

                    </ul>
                    <div class="details-picture">
                        <div class="details-piccon">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <c:if test="${findInfo.user.isAlone == 0}">
            <div class="column grid-6">
                <div class="inbox fn-mb10">
                    <div class="inbox-title">个人信息</div>
                    <div class="inbox-con">
                        <dl class="dealer-info">
                            <dt>
                            <h4>${findInfo.user.name}</h4>
                            </dt>
                            <dd>
                                <p>所在城市：${findInfo.user.city}</p>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
        </c:if>
    </div>

</div>
</div>
</body>
<jsp:include page="tail.jsp"/>
</html>
<script>

</script>
