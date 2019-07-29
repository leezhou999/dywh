<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>关中地域文化网</title>
<!-- 引入easyui（样式）的包，还有jqery的包 -->
<link type="text/css" rel="stylesheet"
	href="js/jquery-easyui-1.5.2/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="js/jquery-easyui-1.5.2/themes/default/easyui.css" />
<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入js文件（login.js） -->
<script type="text/javascript" src="js/login.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}
.l-btn:hover {
    background: #3260ad;
    color: #fff;
    border: 1px solid #b7d2ff;
    filter: none;
}
</style>

</head>

<body>
	<div id="top" style="width: 100%; height: 100%; ">
		<div id="logo"
			style="width: 358; height: 96px; float: left; margin-left: 39%;margin-top:78px; background-image: url('images/logo.png')">
		</div>
		<div id="login"
			style="width: 50%; height: 200px; float: left; margin-left: 26%;margin-top:15px">
			<center>
				<form  action="Admin/login" class="user_login" method="post">
					<div>
						<br><input id="id" name="id"  value="admin"
							class="easyui-textbox"
							data-options="iconCls:'icon-man',required:true"
							
							style="width: 200px"> 
						<br><br>
						<input
							id="password"  name="password" value="111111" class="easyui-passwordbox"
			
							data-options="required:true"
							style="width: 200px">
						<br><br>
						<span id="msg" style="color: red; width: 80px;font-size: 20px;"></span>
						<br>
							<input type="submit" class="easyui-linkbutton" value="登录"
								style="width: 80px;" id="ok">
						
					</div>
				</form>
			</center>
		</div>
		
	</div>
</body>
</html>

