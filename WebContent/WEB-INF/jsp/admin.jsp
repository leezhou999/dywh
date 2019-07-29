<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- 引入easyui（样式）的包，还有jqery的包 -->
<link type="text/css" rel="stylesheet"
	href="/dywh/js/jquery-easyui-1.5.2/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="/dywh/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/dywh/css/Main.css" />
<script type="text/javascript"
	src="/dywh/js/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="/dywh/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/dywh/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/dywh/js/title.js"></script>


<title>后台管理</title>
<script type="text/javascript">
  		//显示时间
	   function showRealTime(clock){
			var d = new Date();
			var year = d.getFullYear();
			var month = d.getMonth() + 1;
			var date = d.getDate();
			var days = new Array("日","一","二","三","四","五","六");
			var day = d.getDay();
			var hour = (d.getHours() < 10) ? ("0" + d.getHours()) : d.getHours();
			var min = (d.getMinutes() < 10) ? ("0" + d.getMinutes()) : d.getMinutes();
			var sec = (d.getSeconds() < 10) ? ("0" + d.getSeconds()) : d.getSeconds();
			var now = year + "年" + month + "月" + date + "日&nbsp;&nbsp;星期" + days[day] + "&nbsp;&nbsp;" + hour + ":" + min + ":" + sec;
			clock.innerHTML = "当前时间:" + now;
		}
		function loadClock(){
			window.setInterval('showRealTime(clock)',1000);
		}
			
	</script>

</head>

<body onload="loadClock()">
	<div id="cc" class="easyui-layout"
		style="width: 100%; height: 100%; margin: auto;">
		<div id='north' data-options="region:'north',split:true"
			style="height:6%; width: 100%;">
			<div id="clock" style="float: left; font-size: 15px;"></div>

			<div id="head1"
				style="float: right; margin-right: 19; text-align: right;">
				<span>当前管理员:${loginInfo.getName() }</span> <a href="Admin/exitLogin">退出</a>

			</div>
		</div>

		<div id='south' data-options="region:'south',split:true"
			style="height: 6%; width: 100%;">
			<br>
			<center>
				&copy;2018&nbsp;<a href="#">版权信息</a>&nbsp<a href="#">意见反馈</a>&nbsp;
				<a href="#">联系我们</a>
			</center>
		</div>

		<div data-options="region:'west',split:false,collapsible:false"
			style="width: 150;">
			<div id="aa" class="easyui-accordion" style="height:450px;">
			<div title="内容管理" style="overflow: auto; padding: 10px;">
					<div class="bb">
						<a href="#" title="/dywh/toManageNews">发布内容</a>
					</div>
					<div class="bb">
						<a href="#" title="/dywh/toNewsAdmin">内容管理</a>
					</div>

				</div>
				<div title="资源管理" style="overflow: auto; padding: 10px;height:260px;">
				
					<div class="bb">
						<a href="#" title="/dywh/toManageResource">上传资源</a>
					</div>
					<div class="bb">
						<a href="#" title="/dywh/toResourceAdmin">资源管理</a>
					</div>
				</div>

				<%-- <div title="文章管理" style="overflow: auto; padding: 10px;">
					<div class="bb">
						<a href="#" title="toProduct">${type.get("4").getType()}管理</a>
					</div>
					<div class="bb">
						<a href="#" title="toTResource">${type.get("5").getType() }管理</a>
					</div>
				</div>

				<div title="首页管理" style="overflow: auto; padding: 10px;">
					<div class="bb">
						<a href="#" title="toHotNews">首页新闻管理</a>
					</div>
					<div class="bb">
						<a href="#" title="toHotProduct">首页作品管理</a>
					</div>
					<div class="bb">
						<a href="#" title="toHotResource">首页资源管理</a>
					</div>
				</div>

				<div title="新闻管理" style="overflow: auto; padding: 10px;">
					<div class="bb">
						<a href="#" title="/dywh/toManageNews">发布新闻</a>
					</div>
					<div class="bb">
						<a href="#" title="toNewsInfo">新闻管理</a>
					</div>

				</div> --%>
			
			</div>
		</div>


		<div data-options="region:'center'"
			style="background: #eee; width: 80%;">

			<div id="tt" class="easyui-tabs" data-options="fit:true,pill:true"
				style="width: 100%; height: 60%"></div>

		</div>
	</div>
</body>
</html>
