<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/9
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<jsp:include page="head.jsp"/>
<link href="${pageContext.request.contextPath}/css/signup.css" rel="stylesheet" type="text/css">
<body>

<div class="content">

    <div class="row">
        <div class="column grid-20">

            <div class="inbox">
                <div class="inbox-con inbox-login">

                    <div class="logleft"><img src="${pageContext.request.contextPath}/images/prado.jpg"></div>

                    <div class="loginbox">
                        <div class="loginbox-title">
                            <h3>用户登录</h3>
                        </div>
                        <div class="loginbox-con">
                            <form name="myform" id="myform" method="post" action="${pageContext.request.contextPath}/user/login">
                                <ul class="login-list">
                                    <li><span class="logfont">用户名</span><input name="username" id="username" class="txt-log" type="text" value="" /><i class="icon-ren"></i></li>
                                    <li><span class="logfont">密码</span><input name="password" id="password" class="txt-log" type="password" value="" /><i class="icon-key"></i></li>
                                    <li class="logsubmit">
                                        <%--<label><input type="checkbox" name="auto_login" value="1" />自动登录</label>--%>
                                        <span class="logver" id="user_err"></span>
                                    </li>
                                    <li class="logsubmit"><a class="btn btn-green" href="javascript:void(0);" id="login_submit">登录</a><input type="hidden" name="reffer" value="http://www.topcars.cn/"></li>
                                    <li class="logsubmit"><a href="${pageContext.request.contextPath}/regist.jsp">注册帐号</a></li>
                                </ul>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

<jsp:include page="tail.jsp"/>
</body>
</html>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>

<script>
    $(function(){
        $("#username").blur(function(){
            var username = $(this).val();
            if(username.length < 6)
            {
                $("#user_err").removeClass("dis_logver").addClass("logver").text("请输入正确用户名");
                return false;
            }
            else
            {
                $("#user_err").removeClass("logver").addClass("dis_logver").text("");
            }
        });
        $("#password").blur(function(){
            var my_pwd = $(this).val();
            if(my_pwd == "")
            {
                $("#user_err").removeClass("dis_logver").addClass("logver").text("密码不能为空");
                return false;
            }
            else
            {
                $("#user_err").removeClass("logver").addClass("dis_logver").text("");
            }
        });
        $("#login_submit").click(function(){

            var username = $("#username").val();

            var pwd = $("#password").val();
            if(username == "" )
            {
                $("#user_err").removeClass("dis_logver").addClass("logver").text("请输入用户名");
                return false;
            }
            if(username.length < 6)
            {
                $("#user_err").removeClass("dis_logver").addClass("logver").text("请输入正确的用户名");
                return false;
            }
            else
            {
                $("#user_err").removeClass("logver").addClass("dis_logver").text();
            }
            if(pwd == ""){
                $("#user_err").removeClass("dis_logver").addClass("logver").text("请输入密码");
                return false;
            }
            setTimeout(function(){$("#myform").submit();}, 100);
        });
    });

</script>

