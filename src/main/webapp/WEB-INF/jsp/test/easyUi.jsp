<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title>Add search functionality in DataGrid - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/demo/demo.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function doSearch(){
            $('#tt').datagrid('load',{
                itemid: $('#itemid').val(),
                productid: $('#productid').val()
            });
        }
    </script>
</head>
<body>

<table id="tt" class="easyui-datagrid"
       url="getTestValue" type="GET" data-options="fitColumns:true,singleSelect:true"
       toolbar="#tb"
       rownumbers="true" pagination="true" style="height: 100%;width: 100%">
    <thead>
    <tr>
        <th field="itemid" >序号</th>
        <th field="productid" >产品编码</th>
        <th field="listprice"  align="right">价格</th>
        <th field="unitcost"  align="right">单位</th>
        <th field="attr1" >规格</th>
        <th field="status"  align="center">状态</th>
    </tr>
    </thead>
</table>
<div id="tb" style="padding:3px">
    <span>序号:</span>
    <input id="itemid" style="line-height:26px;border:1px solid #ccc">
    <span>产品编码:</span>
    <input id="productid" style="line-height:26px;border:1px solid #ccc">
    <a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">查询</a>
</div>
</body>
</html>