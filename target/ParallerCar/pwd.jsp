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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="head.jsp"/>
<link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/jquery.Jcrop.css" rel="stylesheet" type="text/css">
<body>
    <jsp:include page="userCenter.jsp"/>
    <div class="column grid-16">
        <div class="inbox">
            <div class="inbox-title">修改密码</div>
            <div class="inbox-con password">
                <form name="change_pass_form" id="change_pass_form" method="post" >
                    <table cellpadding="0" cellspacing="0" border="0" class="table-password">
                        <tr>
                            <th>原密码：</th>
                            <td><input type="password" class="txt-user2" name="old_pass" id="old_pwd" onblur="check_old_pass()"><span class="ver-grey">至少6位数字或字符</span></td>
                        </tr>
                        <tr>
                            <th>新密码：</th>
                            <td><input type="password" class="txt-user2" name="new_pass" id="password" onblur="check_password()"><span class="ver-grey">至少6位数字或字符</span></td>
                        </tr>
                        <tr>
                            <th>重复新密码：</th>
                            <td><input type="password" class="txt-user2" name="confirm_new_pass" id="confirm_password" onblur="check_confirm_password()"><span class="ver-grey">请再次输入密码</span></td>
                        </tr>
                        <tr>
                            <th>&nbsp;</th>
                            <td><a class="btn btn-cyan" href="javascript:void(0);" id="change_my_password" onclick="change()">确认修改</a></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    </div><%--不可少，与子页面userCenter.jsp对应--%>
    </div><%--不可少，与子页面userCenter.jsp对应--%>
<script>

    $(function () {
        $("#footer_tab li:eq(3)").addClass("current");
    });

    function change() {

        if(check_old_pass() == false)
        {
            return false;
        }

        if(check_password() == false)
        {
            return false;
        }

        if(check_confirm_password() == false)
        {
            return false;
        }

        $.ajax({
            url : "${pageContext.request.contextPath}/user/changePassword",
            type : "post",
            data : {
                "oldPassword" : $("#old_pwd").val(),
                "newPassword" : $("#password").val()
            },
            success : function(response) {
                if(response == "true"){
                    window.location.href = "${pageContext.request.contextPath}/index.jsp"
                }else{
                    alert("密码错误");
                }
            }
        });
    }

    /**
     * 检查原密码
     */
    function check_old_pass()
    {
        var my_old_pass = $("#old_pwd").val();
        if(!my_old_pass)
        {
            $("#old_pwd").next(".ver-grey").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>密码不能为空");
            return false;
        }
        else if(my_old_pass.length < 6)
        {
            $("#old_pwd").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请输入至少6位数字或字符");
            return false;
        }
        else
        {
            $("#old_pwd").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
            return true;
        }
    }

    /**
     * 检查密码
     */
    function check_password()
    {
        var my_password = $("#password").val();
        if(!my_password)
        {
            $("#password").next(".ver-grey").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>密码不能为空");
            return false;
        }
        else if(my_password.length < 6)
        {
            $("#password").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请输入至少6位数字或字符");
            return false;
        }
        else
        {
            $("#password").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
            return true;
        }
    }

    /**
     * 检查重复密码
     * @returns {boolean}
     */
    function check_confirm_password()
    {
        var my_password = $("#password").val();
        var my_confirm_password = $("#confirm_password").val();
        if(check_password() == false)
        {
            return false;
        }
        if(!my_confirm_password)
        {
            $("#confirm_password").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请再次输入密码");
            return false;
        }
        else if(my_confirm_password.length < 6)
        {
            $("#confirm_password").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请输入至少6位数字或字符");
            return false;
        }
        else if(my_password != my_confirm_password)
        {
            $("#confirm_password").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>两次密码输入不一致");
            return false;
        }
        else
        {
            $("#confirm_password").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
        }
    }
</script>
</body>
<jsp:include page="tail.jsp"/>
</html>