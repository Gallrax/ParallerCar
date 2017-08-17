<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/13
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"/>
<link href="${pageContext.request.contextPath}/css/signup.css" rel="stylesheet" type="text/css">
<body>

<div class="content">

    <div class="row">
        <div class="column grid-20">

            <div class="inbox register">
                <div class="inbox-title">
                    <h2>用户注册中心</h2>
                    <div class="dealer-tab">
                        <ul>
                            <li class=""><a id="personRegist" href="#">个人免费注册</a><i class="baseline"></i></li>
                            <li class=""><a id="companyRegist" href="#">公司免费注册</a><i class="baseline"></i></li>
                        </ul>
                    </div>
                </div>
                <div class="inbox-con">
                    <div class="tab-content">
                        <div class="tab-content-item current">
                            <form name="register_form" id="register_form" method="post" action="${pageContext.request.contextPath}/user/saveUser">
                                <table cellpadding="0" cellspacing="0" border="0" class="table-reg">
                                    <tr>
                                        <th>用户名</th>
                                        <td><input class="txt-reg" type="text" name="username" id="username" onblur="check_username();" /><span class="ver-grey">请输入至少6位数字或字符</span></td>
                                    </tr><tr>
                                        <th>登录密码</th>
                                        <td><input class="txt-reg" type="password" name="password" id="password" onblur="check_password();" /><span class="ver-grey">请输入至少6位数字或字符</span></td>
                                    </tr>
                                    <tr>
                                        <th>重复密码</th>
                                        <td><input class="txt-reg" type="password" name="confirm_password" id="confirm_password" onblur="check_confirm_password();" /><span class="ver-grey">请再次输入密码</span></td>
                                    </tr>
                                    <tr>
                                        <th>真实姓名</th>
                                        <td><input class="txt-reg" type="text" name="name" id="linker" onblur="check_linker();" /><span class="ver-grey">请填写身份证上的真实姓名</span></td>
                                    </tr>
                                    <tr>
                                        <th>所在城市</th>
                                        <td>
                                            <select class="sel-reg" name="province" id="province">
                                                <option value="北京市">北京市</option>
                                                <option value="河南省">河南省</option>
                                                <option value="陕西省">陕西省</option>
                                            </select>
                                            <select class="sel-reg" name="city" id="city">
                                                <option value="北京市">北京市</option>
                                            </select>
                                            <span class="ver-grey">请选择您所在的城市</span>
                                        </td>
                                    </tr>
                                    <tr id="business">
                                        <th><span class="red"></span>主营品牌</th>
                                        <td><input class="txt-reg" type="text" name="business" id="sell_brand" /><span class="ver-grey">多个品牌间用逗号分隔</span></td>
                                    </tr>
                                    <tr>
                                        <th>公司名称</th>
                                        <td><input class="txt-reg txt-comp" type="text" name="company" id="company_name" onblur="check_comname();" /><span class="ver-grey">请输入公司全称</span></td>
                                    </tr>
                                    <tr id="companyAddress">
                                        <th>公司地址</th>
                                        <td><input class="txt-reg txt-comp" type="text" name="companyAddress" id="company_address" /><span class="ver-grey">请输入公司地址</span></td>
                                    </tr>
                                    <tr id="ok">
                                        <th>&nbsp;</th>
                                        <td><a href="javascript:void(0);" class="btn btn-green" name="reg_submit" id="reg_submit">完成注册</a></td>
                                    </tr>
                                    <input id="isAlone" name="isAlone" type="hidden"/>
                                </table>
                            </form>
                            <div class="logtips">
                                <p class="fn-mb10">注册说明</p>
                                <p>1. 业内车源信息平台</p>
                                <p>2. 免费找车源、发车源、发寻车信息...</p>
                                <p>3. 必须真实身份注册</p>
                                <p>4. 客服电话：400-888-8888</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>

</div>

</body>

<jsp:include page="tail.jsp"/>

</html>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>--%>
<script>
    $(function() {

        $("#personRegist").parent().attr("class","current");
        $("#companyAddress").hide();
        $("#business").hide();

        $("#personRegist").click(function() {
            //更换class
            $("#companyRegist").parent().attr("class","");
            $("#personRegist").parent().attr("class","current");
            //隐藏公司地址和主营品牌
            $("#companyAddress").hide();
            $("#business").hide();
            //去除公司地址和主营品牌事件
            $("#company_address").unbind();
            $("#sell_brand").unbind();
            $("#isAlone").val("0");
        });


        $("#companyRegist").click(function() {
            //更换class
            $("#personRegist").parent().attr("class","");
            $("#companyRegist").parent().attr("class","current");
            //显示公司地址和主营品牌
            $("#companyAddress").show();
            $("#business").show();
            //增加公司地址和主营品牌时间
            $("#company_address").blur(check_address);
            $("#sell_brand").blur(check_sell_brand);
            $("#isAlone").val("1");
        });

        $("#province").change(function () {
            if($(this).val() == "北京市"){
                $("#city").empty();
                var str = "<option value=\"北京市\">北京市</option>";
                $("#city").append(str);
            }else if($(this).val() == "陕西省") {
                $("#city").empty();
                var str = "<option value=\"西安市\">西安市</option>";
                $("#city").append(str);
            }else if($(this).val() == "河南省") {
                $("#city").empty();
                var str = "<option value=\"郑州市\">郑州市</option>";
                $("#city").append(str);
            }
        });

        $("#reg_submit").click(function(){

            if(check_password() == false)
            {
                return false;
            }

            if(check_confirm_password() == false)
            {
                return false;
            }

            /*if(check_sell_brand() == false)
            {
                return false;
            }*/

            if(check_linker() == false)
            {
                return false;
            }

            if(check_city() == false)
            {
                return false;
            }

            if(check_comname() == false)  //公司名称
            {
                return false;
            }

            /*if(check_address() == false)  //检查地址
            {
                return false;
            }*/

            setTimeout(function(){$("#register_form").submit();}, 100);
        });

    });
</script>
<script>

    /**
     * 检查用户名
     */
    function check_username() {
        var username = $("#username").val();

        if(!username)
        {
            $("#username").next(".ver-grey").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>用户名不能为空");
            return false;
        }
        else if(username.length < 6)
        {
            $("#username").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请输入至少6位数字或字符");
            return false;
        }
        else
        {
            $.ajax({
                url : "${pageContext.request.contextPath}/user/validateUser",
                type : "post",
                dataType : "text",
                data : {
                    "field" : "username",
                    "value" : $("#username").val()
                },
                success : function(response) {
                    if(response == "true"){
                        $("#username").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
                        return true;
                    }else{
                        $("#username").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>用户名已被占用");
                        return false;
                    }
                }
            });
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

    /**
     * 检查城市
     */
    function check_city()
    {
        var my_city = $("#city").val();
        if(my_city == 0)
        {
            $("#city").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请选择您所在的城市");
            return false;
        }
        else
        {
            $("#city").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
            return true;
        }
    }


    /**
     * 检查公司名称
     */
    function check_comname()
    {
        var company_name = $("#company_name").val();
        var company_flag = true;
        if(company_name == "")
        {
            $("#company_name").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请填写公司名称");
            return false;
        }
        else
        {
            $.post("${pageContext.request.contextPath}/user/validateUser", {"field":"company", "value":company_name}, function(response){
                if(response == "false")
                {
                    $("#company_name").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>公司名称已经被注册过");
                    company_flag = false;
                }
                else
                {
                    company_flag = true;
                    $("#company_name").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
                }
            });
            return company_flag;
        }
    }

    /**
     * 检查公司地址
     */
    function check_address()
    {
        var company_address = $("#company_address").val();
        if(company_address == "")
        {
            $("#company_address").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请输入公司展厅地址");
            return false;
        }
        else
        {
            $("#company_address").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
            return true;
        }
    }

    function check_sell_brand()
    {
        var sell_brand = $("#sell_brand").val();
        if(sell_brand == "")
        {
            $("#sell_brand").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>多个品牌间用逗号分隔");
            return false;
        }
        else
        {
            $("#sell_brand").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
            return true;
        }
    }
    function check_linker()
    {
        var linker = $("#linker").val();
        if(linker == "")
        {
            $("#linker").next("span").removeClass("ver-grey").addClass("ver-orange").html("<i class=\"icon-warning\"></i>请输入公司对外业务联系人，多个联系人间用逗号分隔");
            return false;
        }
        else
        {
            $("#linker").next("span").removeClass("ver-orange").addClass("ver-grey").html("<i class=\"icon-right\"></i>");
            return true;
        }
    }
</script>
