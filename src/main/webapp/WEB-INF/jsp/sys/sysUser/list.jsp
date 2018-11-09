<%@ taglib prefix="enum" uri="http://www.medstgmini.com/enum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<html>
<head>
    <%@include file="/WEB-INF/jsp/common/easyUi.jsp" %>
    <style>
        a.operation {
            display: inline-block;
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>

<table id="tt" class="easyui-datagrid"
       url="/sysUser/getListVal" method="POST" data-options="fitColumns:true,singleSelect:true"
       toolbar="#tb" fitConlumns="true" singleSelect="false"
       rownumbers="true" pagination="true" style="height: 100%;width: 100%">
    <thead>
    <tr>
        <th field="ck" checkbox="true"></th>
        <th field="operation" width="100" align="center" formatter="operation">操作</th>
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

<div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px;">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true">删除</a>
    </div>

    <div>
        <span>用户名:</span>
        <input id="loginName" >
        <span>真实姓名:</span>
        <input id="name" >
        <span>性别:</span>
        <select id="sex" name="sex" class="easyui-combobox" style="width:100px;">
            <option value='' >请选择</option>
            <c:forEach items="${enum:getEnumValues('com.soecode.lyf.enums.SexEnum')}" var="items" >
                <option value="${items.key }">${items.value}</option>
            </c:forEach>
        </select>
        <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'" onclick="doSearch()">搜索</a>
    </div>

</div>
<div id="dlg" ></div>
<script>
    function operation(val,row) {
        var str = "";
        str += "<a href=\"#\" class=\"easyui-linkbutton operation\" iconCls=\"icon-edit\" plain=\"true\" onclick=\"toEdit("+ row.userId +")\">编辑</a>";
        return str;
    }

    function fmtDate(val,row){
        var unixTimestamp = new Date(val);
        return unixTimestamp.toLocaleString();
    }

    function doSearch(){
        $('#tt').datagrid('load',{
            loginName: $('#loginName').val(),
            name: $('#name').val(),
            sex: $("#sex").combobox('getValue')
        });
    }

    function getSex (val,row) {
        if (val != null) {
            return val == null ? val : ${enum:getEnumJSON('com.soecode.lyf.enums.SexEnum')}[val];
        }else {
            return "";
        }
    }

    function toEdit(userId) {
        window.location.href = "<%=basePath%>sysUser/toEdit?userId="+userId;
    }

    //url：窗口调用地址，title：窗口标题，width：宽度，height：高度，shadow：是否显示背景阴影罩层
    function showMessageDialog() {
        var $addEvent = $("#dlg");
        // 初始化对话框
        $addEvent.dialog({
            title: '新增待办工作',
            width: 800,
            height: 500,
            closed: false,
            cache: false,
            href: "http://localhost:8080/test/easyui",
            buttons: [{
                text: '  确认  ',
                handler: function () {
                    var val = test();
                    alert(val);
                    $addEvent.window("close");
                }
            },
            {
                text: '  取消  ',
                handler: function () {
                    $addEvent.window("close");
                }
            }
            ]
        });
        $addEvent.dialog('open');
    }

</script>
</body>
</html>