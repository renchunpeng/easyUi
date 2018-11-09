<%@ taglib prefix="enum" uri="http://www.medstgmini.com/enum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<html>
<head>
    <%@include file="/WEB-INF/jsp/common/easyUi.jsp" %>
</head>
<body>
<div class="easyui-panel" title="编辑用户信息" style="height: 100%;width: 100%">
    <div id="mask" class="mask"></div>
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" method="post">
            <table cellpadding="5">
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="loginName" value="${sysUser.loginName}"/></td>
                    <td>密码:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="password" value="${sysUser.password}" /></td>
                </tr>
                <tr>
                    <td>姓名:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="name" value="${sysUser.name}" /></td>
                    <td>年龄:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="age" value="${sysUser.age}" /></td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                        <select id="sex" name="sex" class="easyui-combobox" style="width:150px;">
                            <c:forEach items="${enum:getEnumValues('com.soecode.lyf.enums.SexEnum')}" var="items" >
                                <c:if test="${sysUser.sex == items.key}">
                                    <option value="${items.key }" selected>${items.value}</option>
                                </c:if>
                                <c:if test="${sysUser.sex != items.key}">
                                    <option value="${items.key }">${items.value}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                    <td>手机号码:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="phone" value="${sysUser.phone}" /></td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="email" value="${sysUser.email}" /></td>
                    <td>居住地址:</td>
                    <td><input class="easyui-textbox editinput" type="text" name="address" value="${sysUser.address}" /></td>
                </tr>
                <div>
                    <input  name="userId" value="${sysUser.userId}" hidden/>
                </div>
            </table>
        </form>

        <div>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>
    </div>
</div>
<script>
    /*页面加载完成之后首先对省份下拉框进行渲染*/
    $(function(){
        console.log(${validate});
        $("#ff").validate(${validate});//加上校验规则
    });

    /**
     * 提交
     */
    function submitForm(){
        if(!$('#ff').valid()) {
            alert("验证不通过");
            return;
        }

        var data =$("#ff").serialize();
        showMask();
        $.ajax({
            url:"<%=basePath%>sysUser/edit",
            type:"POST",
            data:data,
            success:function(result){
                hideMask();
                if(result.success){
                    $.messager.alert('提示','用户信息修改成功！','info',function(){
                        window.location.href = "<%=basePath%>sysUser/toList";
                    });
                }else{
                    $.messager.alert('提示',result.Msg,'info');
                }
            }
        });
    }

    function clearForm(){
        $('#ff').form('clear');
    }
</script>
</body>
</html>