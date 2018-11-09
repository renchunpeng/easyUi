<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<html>
<head>
<%@include file="/WEB-INF/jsp/common/easyUi.jsp" %>
</head>
<body>

<table id="rcp" class="easyui-datagrid"
       url="getTestValue" type="GET" data-options="fitColumns:true,singleSelect:true"
       toolbar="#wq" fitConlumns="true"
       rownumbers="true" pagination="true" style="height: 100%;width: 100%">
    <thead>
    <tr>
        <th field="ck" checkbox="true"></th>
        <th field="itemid" width="100">序号</th>
        <th field="productid" width="100">产品编码</th>
        <th field="listprice" width="100" align="right">价格</th>
        <th field="unitcost" width="100" align="right">单位</th>
        <th field="attr1" width="100">规格</th>
        <th field="status" width="100" align="center">状态</th>
    </tr>
    <tr>
        <th field="itemid">123</th>
        <th field="productid">123</th>
        <th field="listprice">123</th>
    </tr>
    </thead>
</table>
<div id="wq" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true"></a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
    </div>
    <div>
        Date From: <input id="red"  class="easyui-datebox" style="width:80px">
        To: <input class="easyui-datebox" style="width:80px">
        Language:
        <select class="easyui-combobox" panelHeight="auto" style="width:100px">
            <option value="java">Java</option>
            <option value="c">C</option>
            <option value="basic">Basic</option>
            <option value="perl">Perl</option>
            <option value="python">Python</option>
        </select>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
    </div>
</div>
<script>

    function test(){
        return "123";
    }
</script>
</body>
</html>