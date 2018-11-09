<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="jquery,ui,easy,easyui,web">
<meta name="description" content="easyui help you build your web page easily!">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/icon.css">
<%--<link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/demo/demo.css">--%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="http://www.jeasyui.net/Public/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="http://www.java1234.com/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<%--项目地址--%>
<%
    String path2 = request.getContextPath();
    String basePath2 = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path2 + "/";
    pageContext.setAttribute("basePath",basePath2);
%>

<%--form表单验证和提交框架--%>
<script src="<%=basePath2 %>resources/scripts/jquery.validate.js"></script>
<script src="<%=basePath2 %>resources/scripts/jquery-form.js"></script>

<link rel="stylesheet" href="<%=basePath2 %>resources/css/commonCss.css" type="text/css">
<script src="<%=basePath2 %>resources/scripts/commonJs.js"></script>

<style>
    .editinput {
        width:150px;
        height: 30px;
    }

</style>