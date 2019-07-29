<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width; 
			initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">

<title></title>
<script type="text/javascript" src="/dywh/js/js_z.js"></script>
<script type="text/javascript" src="/dywh/js/jquery-1.8.3.min.js"></script>

<link rel="stylesheet" type="text/css" href="/dywh/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/dywh/css/thems.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/responsive.css">
<link rel="stylesheet" type="text/css"
	href="/dywh/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/style.css">
<style type="text/css">
			.header1{
				background:#012231;
				width:auto;
				height:50 !important;
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
	<%-- <%@include file="top.jsp" %> --%>
	<div class="header1">
			
				<!---start-logo---->
				<div class="logo">
					<a href="toIndex"><img  src="images/logo.png"/></a>
				</div>
				<!---End-logo---->
				<!---start-top-nav---->
				<div class="top-nav1">
					
						<a class="active1" href="toIndex">首页</a>
						<a class="active1" href="toLanguage">语言文化</a>
						<a class="active1" href="toBuilding">建筑文化</a>
						<a class="active1" href="toDiet">饮食文化</a>
						<a class="active1" href="toOpera">戏曲文化</a>
					
				</div>
				<div class="clear"> </div>
				<!---End-top-nav---->
			
			<!---End-header---->
		</div>
	<!---End-header---->
	<!--内容-->
	<div
		style="width: 100%; min-height:168%;height:auto; border: 1px solid #ccc; border-width: 0 1px; background: white; overflow: auto;"
		class="banner">
		<center>
			<div  style="margin-top: 1%;width:70%;">
				<!-- 第一种内容板块 -->
				<c:if test="${not empty news}">
				<div>
				<p style="text-align: center" class="title_Info">
				${news.news_title}</p>
				<p style="width:100%;height=:30px;text-align: center; 
				color: gray;padding-top:17px">作者：${news.news_author}
				&nbsp;&nbsp;&nbsp;&nbsp;
				发表时间：<fmt:parseDate value="${news.news_time}" var="parstTime" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${parstTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</p>
				</div>
				<div style="text-align:left;height:auto;min-height:152%;text-indent:2em;margin-top:15px;
				border:1px solid #ebebeb;
				box-shadow: 0 5px 10px -5px rgba(0,0,0,0.5)">
				<p>${news.news_content}
				</p>
				</div>
				</c:if>
				<!-- end -->
				
				<c:if test="${not empty resource}">
					<tr>
						<td colspan="2" style="text-align: center"><h2>${resource.title}</h2></td>
					</tr>
					<tr>
						<td width="50%" height="20" style="text-align: right; color: gray">作者：</td>
						<td style="text-align: left; color: gray">${resource.author}</td>
					</tr>
					<tr>
						<td width="50%" style="text-align: right; color: gray">发表时间：</td>
						<td style="text-align: left; color: gray">${resource.time}</td>
					</tr>
					<tr>
						<td colspan="2">${resource.content}</td>
					</tr>
				</c:if>
				<c:if test="${not empty post}">
				<tr>
					<td colspan="2" style="text-align: center"><h2>${post.title}</h2></td>
				</tr>
				<tr>
					<td width="50%" style="text-align: right; color: gray">作者：</td>
					<td style="text-align: left; color: gray">${post.author}</td>
				</tr>
				<tr>
					<td width="50%" style="text-align: right; color: gray">发表时间：</td>
					<td style="text-align: left; color: gray">${post.datetime}</td>
				<tr>
					<td colspan="2">${post.content}</td>
				</tr>
			</c:if>
			</div>
		</center>

	</div>
	<!---start-footer---->
	<!-- <div style="background:#012231;">
		<div style="width:100% !important">
			<div>
				<div class="footer-grid" style="margin-left:25">
					<h3>社交媒体</h3>
					<div class="footer-grid-address">
					<p>
						<a href="#">新浪微博</a><br>
						<a href="#">腾讯微博</a><br>
						<a href="#">微信公众号</a>
						</p>
					</div>
				</div>
				<div class="footer-grid">
					<h3>旅游帮助</h3>
					<div class="footer-grid-address">
					<p>
						<a href="#">在线投诉</a><br>
						<a href="#">投诉电话：12301</a><br>
						<a href="#">旅游咨询：18691565390</a>
						</p>
					</div>
				</div>
				<div class="footer-grid">
					<h3>网站导航</h3>
					<div class="footer-grid-address">
					<p>
						<a href="#">陕西省文化和旅游厅</a><br>
						<a href="#">丝绸之路起点旅游走廊</a><br>
						<a href="#">秦岭人文生态旅游度假圈</a>
					</p>
					</div>
				</div>
				<div class="footer-grid footer-lastgrid">
					<h3>关于我们</h3>
					<p>版权所有：XXX</p>
					<div class="footer-grid-address">
						<p style="font-size:12 !important"><a href="toLogin">后台管理</a></p>
						<p style="font-size:12 !important">
							Email:<a class="email-link" href="#">XXX@qq.com</a>
						</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div> -->
	<!-- end footer -->
</body>

</html>
