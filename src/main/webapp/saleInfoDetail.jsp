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
            <div class="path">当前位置：<a href="${pageContext.request.contextPath}/index.jsp">首页</a>&nbsp;&gt;&nbsp;<a href="${pageContext.request.contextPath}/saleInfos.jsp">车源信息</a>&nbsp;&gt;&nbsp;查看详细内容</div>
        </div>
    </div>

    <div class="row">
        <div class="column grid-14">
            <div class="inbox details">
                <div class="inbox-title">
                    <h2>${saleInfo.title}</h2>
                    <div class="details-date">发布日期 <fmt:formatDate value="${saleInfo.insertTime}" pattern="yyyy-MM-dd"/> </div>
                </div>
                <div class="inbox-con">
                    <ul class="details-list">
                        <li><span>报价：</span><label class="red">${saleInfo.price}</label></li>
                        <li><span>联系电话：</span><i class="icon-phone">
                        <c:if test="${sessionScope.user != null}">
                            </i><label id="show_telphone" class="red">${saleInfo.user.phone}</label>
                        </c:if>
                        <c:if test="${sessionScope.user == null}">
                            </i><label id="show_telphone" class="red"><a href="${pageContext.request.contextPath}/login.jsp">登录即可查看手机号</a></label>
                        </c:if>
                        </li>
                        <li><span>所在地区：</span>${saleInfo.user.city}</li>
                        <li><span>外观颜色：</span>${saleInfo.outerColor}</li>
                        <li><span>内饰颜色：</span>${saleInfo.innerColor}</li>
                        <li><span>进口类型：</span>${saleInfo.source.name}</li>
                        <li class="long-li"><span>详细配置：</span>${saleInfo.content}</li>
                    </ul>
                    <div class="details-picture">
                        <div class="details-piccon">
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <c:if test="${saleInfo.user.isAlone == 1}">
            <div class="column grid-6">
                <div class="inbox fn-mb10">
                    <div class="inbox-title">商家信息</div>
                    <div class="inbox-con">
                        <dl class="dealer-info">
                            <dt>
                            <h4>${saleInfo.user.company}</h4>
                            </dt>
                            <dd>
                                <p>所在城市：${saleInfo.user.city}</p>
                                <p>店面地址：${saleInfo.user.companyAddress}</p>
                                <p id="my_linker_phone"></p>
                                <p>联系人：${saleInfo.user.name}</p>
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
