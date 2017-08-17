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
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/jquery.Jcrop.css" rel="stylesheet" type="text/css">
<body>
    <jsp:include page="userCenter.jsp"/>
    <div class="column grid-16">
        <div class="inbox">
            <div class="inbox-title">个人信息</div>
            <div class="inbox-con">
                <table cellpadding="0" cellspacing="0" border="0" class="table-user1">
                    <tr>
                        <th>用户名：</th>
                        <td>${sessionScope.user.username}</td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr>
                    <tr>
                        <th>姓名：</th>
                        <td id="local_name">${sessionScope.user.name}</td>
                        <td><a href="javascript:void(0);" onclick="uname();" id="edit_member_name">修改</a></td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr>
                    <tr>
                        <th>所在城市：</th>
                        <td id="local_city">${sessionScope.user.province}&nbsp;${sessionScope.user.city}</td>
                        <td><!--<a href="#">修改</a>--></td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr>
                    <tr>
                        <th>公司名称：</th>
                        <td id="local_company_td">${sessionScope.user.company}</td>
                        <td><a href="javascript:void(0);" onclick="ucompany()" id="edit_local_company">修改</a></td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr>
                    <c:if test="${sessionScope.user.isAlone == 1}">
                    <tr>
                        <th>主营品牌：</th>
                        <td id="local_business_td">${sessionScope.user.business}</td>
                        <td><a href="javascript:void(0);" onclick="ubusiness()" id="edit_local_business">修改</a></td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr>
                        <tr>
                            <th>公司地址：</th>
                            <td id="local_companyAddress_td">${sessionScope.user.companyAddress}</td>
                            <td><a href="javascript:void(0);" onclick="ucompanyAddress()" id="edit_local_companyAddress">修改</a></td>
                            <td class="nottd"><span class="red"></span></td>
                        </tr>
                    </c:if>
                    <tr>
                        <th>一句话介绍：</th>
                        <td id="my_slogan_txt">${sessionScope.user.content}</td>
                        <td><a href="javascript:void(0);" onclick="ucontent()" id="edit_slogan">修改</a></td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr><tr>
                        <th>创建时间：</th>
                        <td><fmt:formatDate value="${sessionScope.user.insertTime}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                        <td class="nottd"><span class="red"></span></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </div><%--不可少，与子页面userCenter.jsp对应--%>
    </div><%--不可少，与子页面userCenter.jsp对应--%>
    <script>

        $(function () {
            $("#footer_tab li:eq(2)").addClass("current");
        });

        function uname() {

            var name = prompt("请输入您的名字", $("#local_name").text()); //将输入的内容赋给变量 name ，

            //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
            if (name)//如果返回的有内容
            {
                var value = encodeURI(encodeURI(name));
                window.location.href = "/ParallerCar/user/updateFields?fields=name&values="+ value;
            }
        }

        function ucontent() {
            var content = prompt("请输入您的介绍", $("#my_slogan_txt").text()); //将输入的内容赋给变量 name ，

            //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
            if (content)//如果返回的有内容
            {
                var value = encodeURI(encodeURI(content));
                window.location.href = "/ParallerCar/user/updateFields?fields=content&values="+ value;
            }
        }

        function ucompany() {
            var company = prompt("请输入您的公司名称", $("#local_company_td").text()); //将输入的内容赋给变量 name ，

            //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
            if (company)//如果返回的有内容
            {
                var value = encodeURI(encodeURI(company));
                window.location.href = "/ParallerCar/user/updateFields?fields=company&values="+ value;
            }
        }

        function ucompanyAddress() {
            var companyAddress = prompt("请输入您的公司地址", $("#local_companyAddress_td").text()); //将输入的内容赋给变量 name ，

            //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
            if (companyAddress)//如果返回的有内容
            {
                var value = encodeURI(encodeURI(companyAddress));
                window.location.href = "/ParallerCar/user/updateFields?fields=companyAddress&values="+ value;
            }
        }

        function ubusiness() {
            var bussiness = prompt("请输入您的主营品牌，请以、分割", $("#local_business_td").text()); //将输入的内容赋给变量 name ，

            //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值
            if (bussiness)//如果返回的有内容
            {
                var value = encodeURI(encodeURI(bussiness));
                window.location.href = "/ParallerCar/user/updateFields?fields=business&values="+ value;
            }
        }
    </script>
</body>
<jsp:include page="tail.jsp"/>
</html>

