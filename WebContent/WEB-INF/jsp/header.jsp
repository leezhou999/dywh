<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			.header1{
				background:#012231;
				width:auto;
				height:50;
			}
			.top-nav1 a{
			padding:18 25;
			
			}
			.top-nav1 a:visited{
			background:#289cd8;color:#fff;margin-right:-4;
			}
			.top-nav1{
			    margin-top:13px;
    			margin-right:117px;
    			}
			.my-ul{
				width: 502;
				display: block;
				margin: 0;
				position:relative;
			}
			.my-li{
			display: inline-block;
			float: left;	
			}
			.my-li a{
				padding: 40px 20px;
				display: block;
				text-decoration: none;
				}
			.active1:visited {
			
			}
			.active1:hover{
    		background: #289cd8;
    		color: #FFF;
			}
			.active2:{
			background:#289cd8}
		</style>
	</head>
	<body>
		<div class="header1">
			
				<!---start-logo---->
				<div class="logo">
					<a href="toIndex"><img  src="images/logo.png"/></a>
				</div>
				<!---End-logo---->
				<!---start-top-nav---->
				<div class="top-nav1">
					
						<a style="background:#289cd8;color:#fff;margin-right:-4;" href="toIndex">首页</a>
						<a class="active1" href="toLanguage">语言文化</a>
						<a class="active1" href="toBuilding">建筑文化</a>
						<a class="active1" href="toDiet">饮食文化</a>
						<a class="active1" href="toOpera">戏曲文化</a>
					
				</div>
				<div class="clear"> </div>
				<!---End-top-nav---->
			
			<!---End-header---->
		</div>
	</body>
</html>
