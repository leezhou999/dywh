<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>戏曲文化</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/dywh/css/flexslider.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/dywh/js/jquery.flexslider.js"></script>
<script>
	function toNews(id) {
		var id = id;
		window.location.href = "showById?id=" + id;
	}
	function toMovie() {
		document.getElementById("a1").style.backgroundColor="#289cd8";
		document.getElementById("a1").style.color="#fff";
		document.getElementById("a2").style.backgroundColor="";
		document.getElementById("a2").style.color="";
		document.getElementById("music").style.visibility="hidden";//隐藏div
		document.getElementById("music").style.display="none";//隐藏空间
		document.getElementById("movie").style.visibility="visible";//显示div
		document.getElementById("movie").style.display="";//显示空间
	}
	function toMusic() {
		document.getElementById("a2").style.backgroundColor="#289cd8";
		document.getElementById("a2").style.color="#fff";
		document.getElementById("a1").style.backgroundColor="";
		document.getElementById("a1").style.color="";
		document.getElementById("movie").style.visibility="hidden";//隐藏div
		document.getElementById("movie").style.display="none";//隐藏空间
		document.getElementById("music").style.visibility="visible";//显示div
		document.getElementById("music").style.display="";//显示空间
	}
</script>
<style type="text/css">
.header1 {
	background: #012231;
	width: auto;
	height: 50;
}

.top-nav1 a {
	padding: 18 25;
}

.top-nav1 a:visited {
	background: #289cd8;
	color: #fff;
	margin-right: -4;
}

.top-nav2 a:visited {
	background: #289cd8;
	color: #fff;
	margin-right: -4;
}
.top-nav2 a:hover {
	background: #289cd8;
	color: #fff;
	margin-right: -4;
}
.top-nav1 {
	margin-top: 13px;
	margin-right: 117px;
}


.my-ul {
	width: 502;
	display: block;
	margin: 0;
	position: relative;
}

.my-li {
	display: inline-block;
	float: left;
}

.my-li a {
	padding: 40px 20px;
	display: block;
	text-decoration: none;
}

.active1:visited {
	background: #289cd8;
}

.active1:hover {
	background: #289cd8;
	color: #FFF;
}

.language21 p {
	padding-top: 12px;
}
</style>
</head>
<body>

	<div class="header1">

		<!---start-logo---->
		<div class="logo">
			<a href="toIndex"><img src="images/logo.png" /></a>
		</div>
		<!---End-logo---->
		
		<!---start-top-nav---->
		<div class="top-nav1">

			<a class="active1" href="toIndex">首页</a> 
			<a class="active1" href="toLanguage">语言文化</a> 
			<a class="active1" href="toBuilding">建筑文化</a>
			<a class="active1" href="toDiet">饮食文化</a> 
			<a style="background: #289cd8; color: #fff; margin-right: -4;"
				href="toOpera" href="toOpera">戏曲文化</a>

		</div>
		<div class="clear"></div>
		<!---End-top-nav---->
	</div>
	<!---End-header---->
	<div class="clear"></div>

	<!--轮播图-->
	<!-- <div style="width: 70%; height: 340px;" class="banner">
		<div class="box">
			<div class="list">
				<ul>
					<li class="p7"><a href="#"><img
							src="/dywh/images/slider2.jpg" alt="" /> </a></li>
					<li class="p6"><a href="#"><img
							src="/dywh/images/slider3.jpg" alt="" /> </a></li>
					<li class="p5"><a href="#"><img
							src="/dywh/images/slider1.jpg" alt="" /> </a></li>
					<li class="p4"><a href="#"><img
							src="/dywh/images/slider4.jpg" alt="" /> </a></li>
					<li class="p3"><a href="#"><img
							src="/dywh/images/slider2.jpg" alt="" /> </a></li>
					<li class="p2"><a href="#"><img
							src="/dywh/images/slider3.jpg" alt="" /> </a></li>
					<li class="p1"><a href="#"><img
							src="/dywh/images/slider1.jpg" alt="" /> </a></li>
				</ul>
			</div>
			<a href="javascript:;" class="prev btn"></a> <a href="javascript:;"
				class="next btn"></a>
			<div class="buttons">
				<a href="javascript:;"><span class="blue"></span></a> <a
					href="javascript:;"><span></span></a> <a href="javascript:;"><span></span></a>
				<a href="javascript:;"><span></span></a> <a href="javascript:;"><span></span></a>
				<a href="javascript:;"><span></span></a> <a href="javascript:;"><span></span></a>
			</div>
		</div>
	</div> -->
	<!---End-轮播图---->

	<div class="clear"></div>
	<!---start-content---->
	<div class="content" >
		<div class="wrap" >
			<!-- 分栏 -->
			<div class="content-grids" >

				<!-- 第一栏 -->
				<div class="grid1" style="height: 223; width: 92%;margin-top:4;margin-left:3%">
					<div style="width: 100%; float: left">
						<div class="specials-heading"></div>
						<h3>关中戏曲文化</h3>
						<div class="clear"></div>
						<div >
							<p>
							${resource51.news_summary}</p>
						</div>
					</div>

					<%-- <div style="width: 33%; float: right;">
						<div class="specials-heading"></div>
						<h3>每日一笑</h3>
						<div class="clear"></div>
						<div class="box_m" style="height: 30%">
							<p>${news24.news_summary}</p>
						</div>
					</div> --%>
				</div>
				<!-- 第一栏结束 -->
			</div>
		</div>
		
	
	<div class="clear"></div>
	<!-- <div class="top-nav2" style="margin-left:12%;">

		<a style="margin-right: -4;" id ="a1" class="active2" 
		href="javascript:void(0);" onclick="toMovie();">影视</a> 
		<a class="active2" href="javascript:void(0);" id="a2" onclick="toMusic();">音乐</a>
		
	</div> -->
	</div>
	<div class="content" >
		<div class="wrap">
			<div class="content-grids">
				<!-- 影视剧 -->
				<div class="specials">
					<div class="specials-heading">
						<!-- <h5></h5>
						<h3>关中方言电视剧</h3>
						<h5></h5> -->
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<!-- start city -->
					<div id="city" style="margin-left:3%;">
					
					<div id="movie" class="specials-grids" style="width:104%">
				
						<c:forEach var="list_opera" items="${list_opera52}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
							<a href="javascript:void(0);"
							onclick="toNews('${list_opera.id}');">
							${list_opera.resource_location}
							</a></div>
							<a href="javascript:void(0);"
							onclick="toNews('${list_opera.id}');">${list_opera.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div>
				<%-- 	<div id="music" class="specials-grids" style="width:104%">
				
						<c:forEach var="list_language" items="${list_language23}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
								${list_language.resource_location}</div>
							<a href="#">${list_language.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div> --%>
					</div>
					<!-- end city -->
					<div class="clear"></div>
				</div>
				<!-- 音乐 -->
			
			</div>
		</div>
	</div>
	<!---End-content---->
	<div class="clear"></div>
	<!---start-footer---->
	<div class="footer">
		<div class="wrap">
			<div class="footer-grids">
				<div class="footer-grid">
					<h3>社交媒体</h3>
					<div class="footer-grid-address">
						<p>
							<a href="#">新浪微博</a><br> <a href="#">腾讯微博</a><br> <a
								href="#">微信公众号</a>
						</p>
					</div>
				</div>
				<div class="footer-grid">
					<h3>旅游帮助</h3>
					<div class="footer-grid-address">
						<p>
							<a href="#">在线投诉</a><br> <a href="#">投诉电话：12301</a><br>
							<a href="#">旅游咨询：18691565390</a>
						</p>
					</div>
				</div>
				<div class="footer-grid">
					<h3>网站导航</h3>
					<div class="footer-grid-address">
						<p>
							<a href="#">陕西省文化和旅游厅</a><br> <a href="#">丝绸之路起点旅游走廊</a><br>
							<a href="#">秦岭人文生态旅游度假圈</a>
						</p>
					</div>
				</div>
				<div class="footer-grid footer-lastgrid">
					<h3>关于我们</h3>
					<p>版权所有：XXX</p>
					<div class="footer-grid-address">
						<p style="font-size: 12 !important">
							<a href="toLogin">后台管理</a>
						</p>
						<p style="font-size: 12 !important">
							Email:<a class="email-link" href="#">XXX@qq.com</a>
						</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!-- end footer -->


</body>
</html>

