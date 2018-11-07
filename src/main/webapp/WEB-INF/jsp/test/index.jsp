<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html>
<head id="Head1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Angel工作室</title>
    <link href="<%=basePath %>resources/easyUi/css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/easyUi/js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>resources/easyUi/js/themes/icon.css" />
    <script type="text/javascript" src="<%=basePath %>resources/easyUi/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>resources/easyUi/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src='<%=basePath %>resources/easyUi/js/Angel_main.js'> </script>

    <script type="text/javascript">

    var _menus = ${menus};

    //设置登录窗口
    function openPwd() {
        $('#w').window({
            title: '修改密码',
            width: 300,
            modal: true,
            shadow: true,
            closed: true,
            height: 160,
            resizable:false
        });
    }
    //关闭登录窗口
    function closePwd() {
        $('#w').window('close');
    }

    //修改密码
    function serverLogin() {
        var $newpass = $('#txtNewPass');
        var $rePass = $('#txtRePass');

        if ($newpass.val() == '') {
            msgShow('系统提示', '请输入密码！', 'warning');
            return false;
        }
        if ($rePass.val() == '') {
            msgShow('系统提示', '请在一次输入密码！', 'warning');
            return false;
        }

        if ($newpass.val() != $rePass.val()) {
            msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
            return false;
        }

        $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
            msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
            $newpass.val('');
            $rePass.val('');
            close();
        })

    }

    $(function() {

        openPwd();

        $('#editpass').click(function() {
            $('#w').window('open');
        });

        $('#btnEp').click(function() {
            serverLogin();
        })

        $('#btnCancel').click(function(){closePwd();})

        $('#loginOut').click(function() {
            $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                if (r) {
                    location.href = '/ajax/loginout.ashx';
                }
            });
        })
    });

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  fit="true"   scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="<%=basePath %>resources/easyUi/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>

<div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
<div id="pageloading" style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;"> 
    <img src="<%=basePath %>resources/easyUi/images/loading.gif" align="absmiddle" /> 正在加载中,请稍候...</div>
</div>
<!--
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(<%=basePath %>resources/easyUi/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">欢迎 Admin <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="<%=basePath %>resources/easyUi/images/blocks.gif" width="20" height="20" align="absmiddle" /> Angel工作室系统管理平台</span>
    </div>
-->




    <div region="north" split="true" border="false" style="overflow: hidden; height: 107px;
        line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="qy_toplrk">
            <tr>
                <td width="401" height="73" align="left" valign="middle" class="qy_top2bg"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c2.jpg" width="401" height="73" /></td>
                <td align="right" valign="middle" class="qy_top2bg">
                    <table width="350" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td><a href="Index.aspx" target="_parent"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c21.jpg" width="72" height="73" border="0" alt="" /></a></td>
                            <td><a href="javascript:void(0)" id="editpass"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c221.jpg" width="67" height="73" border="0" alt="" /></a></td>
                            <td><a href="Login.aspx" target="_parent" onclick="return confirm('你确认要重新登陆吗?');"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c23.jpg" width="65" height="73" border="0" alt="你确认要重新登陆吗" /></a></td>
                            <td><a href="Login.aspx" target="_parent" onclick="return confirm('你确认要退出吗?');"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c24.jpg" width="67" height="73" border="0" alt="你确认要退出吗" /></a></td>
                            <td><a href="javascript:void(0)" onclick="javascript:AddFavorite('#','Angel工作室软件制作');"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c22.jpg" width="67" height="73" border="0" alt="" /></a></td>
                            <td><a href="#" target="_parent"><img src="<%=basePath %>resources/easyUi/images/qyxx_r3_c25.jpg" width="79" height="73" border="0" alt="" /></a></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="27" colspan="2" class="qy_topmenubor">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#F0F5F9">
                        <tr>
                            <td height="27" align="left" valign="middle" class="qy_menuleftbg" style="width: 880px">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="26" align="right" valign="middle">
                                            <img src="<%=basePath %>resources/easyUi/images/340.gif" width="16" height="16" />
                                        </td>
                                        <td class="qy_topk2px" colspan="2">
                                            &nbsp;用户名：<span class="qy_lsfont">admin</span>
                                            &nbsp;&nbsp;姓名：<span class="qy_lsfont">系统管理员</span>&nbsp;&nbsp;登陆时间：2013-11-9 18:24:36&nbsp;&nbsp;今日天气：<iframe
                                                src="http://m.weather.com.cn/m/pn4/weather.htm " width="150" height="16" marginwidth="0"
                                                marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" allowtransparency="true"></iframe>
                                            <span style="color: red"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" valign="middle" class="qy_menurighbg">
                                <table width="266" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="21" align="left" valign="middle">
                                            <img src="<%=basePath %>resources/easyUi/images/320.gif" width="16" height="16" alt="" />
                                        </td>
                                        <td align="left" valign="middle" class="qy_date">
                                            今天是：<span class="heise" id="liveclock"></span>
                                            <script language="javascript">
                                                function timeprint() {
                                                    var week; var date;
                                                    var today = new Date()
                                                    var year = today.getYear()
                                                    var month = today.getMonth() + 1
                                                    var day = today.getDate()
                                                    var ss = today.getDay()
                                                    var hours = today.getHours()
                                                    var minutes = today.getMinutes()
                                                    var seconds = today.getSeconds()
                                                    date = year + "年" + month + "月" + day + "日 "
                                                    if (ss == 0) week = "星期日"
                                                    if (ss == 1) week = "星期一"
                                                    if (ss == 2) week = "星期二"
                                                    if (ss == 3) week = "星期三"
                                                    if (ss == 4) week = "星期四"
                                                    if (ss == 5) week = "星期五"
                                                    if (ss == 6) week = "星期六"
                                                    if (minutes <= 9)
                                                        minutes = "0" + minutes
                                                    if (seconds <= 9)
                                                        seconds = "0" + seconds
                                                    myclock = date + week + "" + hours + ":" + minutes + ":" + seconds
                                                    if (document.layers) {
                                                        document.layers.liveclock.document.write(myclock)
                                                        document.layers.liveclock.document.close()
                                                    } else if (document.all)
                                                        liveclock.innerHTML = myclock
                                                    setTimeout("timeprint()", 1000)
                                                }
                                                timeprint();
                                                //-->
                                            </script>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>






    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">Angel工作室-版权所有<a href="http://www.angelasp.com/" style="color:#125eb2">www.angelasp.com</a></div>
    </div>
    <div region="west" split="true"  title="导航菜单" style="width:180px;" id="west">
			<div id="nav">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; " >
<h1 style="font-size:24px;">* BLOG: <a style="font-size:24px;color:green;" href="http://hi.baidu.com/angelcms">Angel工作室的博客</a></h1>
<h1 style="font-size:24px;">* 官方地址：<a href="http://www.angelasp.com/" style="color:#125eb2">www.angelasp.com</a></h1>
<h1 style="font-size:24px;">* 讨论群：191376471 QQ：709047174</h1>
				<h1 style="font-size:24px;">* 广告：本人承接各类大中小型管理系统的软件的设计与开发，有需要的朋友可以联系我啦~~~~</h1>
			
			</div>
		</div>
    </div>

    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="close">关闭</div>
		<div id="closeall">全部关闭</div>
		<div id="closeother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="closeright">当前页右侧全部关闭</div>
		<div id="closeleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="exit">退出</div>
	</div>


</body>
</html>