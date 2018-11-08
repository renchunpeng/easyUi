<%@ taglib prefix="enum" uri="http://www.medstgmini.com/enum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<html>
<head>
    <%@include file="/WEB-INF/jsp/common/easyUi.jsp" %>
</head>
<body>

<table id="tt" class="easyui-datagrid"
       url="/sysUser/getListVal" method="POST" data-options="fitColumns:true,singleSelect:true"
       toolbar="#tb" fitConlumns="true" singleSelect="false"
       rownumbers="true" pagination="true" style="height: 100%;width: 100%">
    <thead>
    <tr>
        <th field="ck" checkbox="true"></th>
        <th field="userId" width="100" align="center" hidden="true">用户ID</th>
        <th field="loginName" width="100" align="center">用户名</th>
        <th field="name" width="100" align="center">真实姓名</th>
        <th field="age" width="100" align="center">年龄</th>
        <th field="sex" width="100" align="center" formatter="getSex">性别</th>

        <th field="phone" width="150" align="center">手机号码</th>
        <th field="email" width="200" align="center">邮箱</th>
        <th field="address" width="250" align="center">住址</th>
        <th field="lastLoginTime" width="100" align="center">上次登录时间</th>
        <th field="createUser" width="100" align="center">创建人</th>
        <th field="createTime" width="200" align="center" formatter="fmtDate">创建时间</th>
    </tr>
    </thead>
</table>

<div id="tb" style="padding:3px;">
    <div style="margin-left: 5px;">
        <span>用户名:</span>
        <input id="loginName" style="line-height:26px;border:1px solid #ccc">
        <span>真实姓名:</span>
        <input id="name" style="line-height:26px;border:1px solid #ccc">
        <select id='sex' name='sex' >
            <option value='' >请选择</option>
            <c:forEach items="${enum:getEnumValues('com.soecode.lyf.enums.DrugAttr')}" var="items" >
                <option value="${items.key }">${items.value}</option>
            </c:forEach>
        </select>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="doSearch()">搜索</a>
    </div>

    <div style="margin-bottom:5px;margin-top: 10px;">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">编辑</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
    </div>
</div>

<script>
    function fmtDate(val,row){
        var unixTimestamp = new Date(val);
        return unixTimestamp.toLocaleString();
    }

    function doSearch(){
        $('#tt').datagrid('load',{
            loginName: $('#loginName').val(),
            name: $('#name').val()
        });
    }

    function getSex (val,row) {
        if (val != null) {
            return val == null ? val : ${enum:getEnumJSON('com.soecode.lyf.enums.confirmStatus')}[val];
        }else {
            return "";
        }
    }

</script>
</body>
</html>