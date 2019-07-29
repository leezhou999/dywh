<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>饮食文化</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

<!-- <script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=NkI76CDuFBIkGO53ulg9jj9Av01VDnSi"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script> -->

<script src="js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/dywh/css/flexslider.css">
<script type="text/javascript" src="/dywh/js/jquery.flexslider.js"></script>
<script>
	// You can also use "$(window).load(function() {"
	/* $(function() {
		// Slideshow 1
		$("#slider1").responsiveSlides({
			maxwidth : 2500,
			speed : 600
		});
	}); */
	function toNews(id) {
		var id = id;
		window.location.href = "showById?id=" + id;
	}
	function toXian() {
		document.getElementById("a1").style.backgroundColor = "#289cd8";
		document.getElementById("a1").style.color = "#fff";

		document.getElementById("a2").style.backgroundColor = "";
		document.getElementById("a2").style.color = "";
		document.getElementById("a3").style.backgroundColor = "";
		document.getElementById("a3").style.color = "";
		document.getElementById("a4").style.backgroundColor = "";
		document.getElementById("a4").style.color = "";
		document.getElementById("a5").style.backgroundColor = "";
		document.getElementById("a5").style.color = "";

		document.getElementById("city_xian").style.visibility = "visible";//显示div
		document.getElementById("city_xian").style.display = "";//显示空间

		document.getElementById("city_xianyang").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xianyang").style.display = "none";//隐藏空间
		document.getElementById("city_weinan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_weinan").style.display = "none";//隐藏空间
		document.getElementById("city_tongchuan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_tongchuan").style.display = "none";//隐藏空间
		document.getElementById("city_baoji").style.visibility = "hidden";//隐藏div
		document.getElementById("city_baoji").style.display = "none";//隐藏空间

	}
	function toXianyang() {
		document.getElementById("a2").style.backgroundColor = "#289cd8";
		document.getElementById("a2").style.color = "#fff";

		document.getElementById("a1").style.backgroundColor = "";
		document.getElementById("a1").style.color = "";
		document.getElementById("a3").style.backgroundColor = "";
		document.getElementById("a3").style.color = "";
		document.getElementById("a4").style.backgroundColor = "";
		document.getElementById("a4").style.color = "";
		document.getElementById("a5").style.backgroundColor = "";
		document.getElementById("a5").style.color = "";

		document.getElementById("city_xianyang").style.visibility = "visible";//显示div
		document.getElementById("city_xianyang").style.display = "";//显示空间

		document.getElementById("city_xian").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xian").style.display = "none";//隐藏空间
		document.getElementById("city_weinan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_weinan").style.display = "none";//隐藏空间
		document.getElementById("city_tongchuan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_tongchuan").style.display = "none";//隐藏空间
		document.getElementById("city_baoji").style.visibility = "hidden";//隐藏div
		document.getElementById("city_baoji").style.display = "none";//隐藏空间

	}
	function toWeinan() {
		document.getElementById("a3").style.backgroundColor = "#289cd8";
		document.getElementById("a3").style.color = "#fff";

		document.getElementById("a1").style.backgroundColor = "";
		document.getElementById("a1").style.color = "";
		document.getElementById("a2").style.backgroundColor = "";
		document.getElementById("a2").style.color = "";
		document.getElementById("a4").style.backgroundColor = "";
		document.getElementById("a4").style.color = "";
		document.getElementById("a5").style.backgroundColor = "";
		document.getElementById("a5").style.color = "";

		document.getElementById("city_weinan").style.visibility = "visible";//显示div
		document.getElementById("city_weinan").style.display = "";//显示空间

		document.getElementById("city_xian").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xian").style.display = "none";//隐藏空间
		document.getElementById("city_xianyang").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xianyang").style.display = "none";//隐藏空间
		document.getElementById("city_tongchuan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_tongchuan").style.display = "none";//隐藏空间
		document.getElementById("city_baoji").style.visibility = "hidden";//隐藏div
		document.getElementById("city_baoji").style.display = "none";//隐藏空间
	}
	function toTongchuan() {
		document.getElementById("a4").style.backgroundColor = "#289cd8";
		document.getElementById("a4").style.color = "#fff";

		document.getElementById("a1").style.backgroundColor = "";
		document.getElementById("a1").style.color = "";
		document.getElementById("a2").style.backgroundColor = "";
		document.getElementById("a2").style.color = "";
		document.getElementById("a3").style.backgroundColor = "";
		document.getElementById("a3").style.color = "";
		document.getElementById("a5").style.backgroundColor = "";
		document.getElementById("a5").style.color = "";

		document.getElementById("city_tongchuan").style.visibility = "visible";//显示div
		document.getElementById("city_tongchuan").style.display = "";//显示空间

		document.getElementById("city_xian").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xian").style.display = "none";//隐藏空间
		document.getElementById("city_xianyang").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xianyang").style.display = "none";//隐藏空间
		document.getElementById("city_weinan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_weinan").style.display = "none";//隐藏空间
		document.getElementById("city_baoji").style.visibility = "hidden";//隐藏div
		document.getElementById("city_baoji").style.display = "none";//隐藏空间
	}
	function toBaoji() {
		document.getElementById("a5").style.backgroundColor = "#289cd8";
		document.getElementById("a5").style.color = "#fff";

		document.getElementById("a1").style.backgroundColor = "";
		document.getElementById("a1").style.color = "";
		document.getElementById("a2").style.backgroundColor = "";
		document.getElementById("a2").style.color = "";
		document.getElementById("a3").style.backgroundColor = "";
		document.getElementById("a3").style.color = "";
		document.getElementById("a4").style.backgroundColor = "";
		document.getElementById("a4").style.color = "";

		document.getElementById("city_baoji").style.visibility = "visible";//显示div
		document.getElementById("city_baoji").style.display = "";//显示空间

		document.getElementById("city_xian").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xian").style.display = "none";//隐藏空间
		document.getElementById("city_xianyang").style.visibility = "hidden";//隐藏div
		document.getElementById("city_xianyang").style.display = "none";//隐藏空间
		document.getElementById("city_weinan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_weinan").style.display = "none";//隐藏空间
		document.getElementById("city_tongchuan").style.visibility = "hidden";//隐藏div
		document.getElementById("city_tongchuan").style.display = "none";//隐藏空间
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
	
}

.active1:hover {
	background: #289cd8;
	color: #FFF;
}

.active2: {
	background: #289cd8
}
</style>

</head>
<body onload="toXian()">
	<!---start-header---->
	<div class="header1">

		<!---start-logo---->
		<div class="logo">
			<a href="toIndex"><img src="images/logo.png" /></a>
		</div>
		<!---End-logo---->
		<!---start-top-nav---->
		<div class="top-nav1">

			<a class="active1" href="toIndex">首页</a> <a class="active1"
				href="toLanguage">语言文化</a> <a class="active1" href="toBuilding">建筑文化</a>
			<a style="background: #289cd8; color: #fff; margin-right: -4;"
				href="toDiet">饮食文化</a> <a class="active1" href="toOpera">戏曲文化</a>

		</div>
		<div class="clear"></div>
		<!---End-top-nav---->

		<!---End-header---->
	</div>
	<!---End-header---->

	<!--轮播图-->
	<div style="width: 70%; height: 340px;" class="banner">
		<div class="box">
			<div class="list">
				<ul>
					<li class="p7"><a href="#">${list_diet41.get(0).resource_location}</a>
					</li>
					<li class="p6"><a href="#">${list_diet41.get(1).resource_location}</a>
					</li>
					<li class="p5"><a href="#">${list_diet41.get(2).resource_location}</a>
					</li>
					<li class="p4"><a href="#">${list_diet41.get(3).resource_location}</a>
					</li>
					<li class="p3"><a href="#">${list_diet41.get(4).resource_location}</a>
					</li>
					<li class="p2"><a href="#">${list_diet41.get(5).resource_location}</a>
					</li>
					<li class="p1"><a href="#">${list_diet41.get(6).resource_location}</a>
					</li>
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
	</div>
	<!---End-轮播图---->
	<!---End-wrap---->
	<div class="clear"></div>
	<!---start-content---->
	<div class="content">
		<div class="wrap">

			<div class="clear"></div>

		</div>
		<div class="top-nav2" style="margin-left:11%;">

			<a style="margin-right: -4;" id="a1" class="active2"
				href="javascript:void(0);" onclick="toXian();">西安</a> 
			<a class="active2" href="javascript:void(0);" id="a2"
				onclick="toXianyang();">咸阳</a>
			<a class="active2" href="javascript:void(0);" id="a3"
				onclick="toWeinan();">渭南</a>
			<a class="active2" href="javascript:void(0);" id="a4"
				onclick="toTongchuan();">铜川</a>
			<a class="active2" href="javascript:void(0);" id="a5"
				onclick="toBaoji();">宝鸡</a>

		</div>
		<div class="clear"></div>
	</div>
	<!---End-content---->
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
					<div id="city" style="margin-left:1%;">
					<div id="city_xian" class="specials-grids" style="width:108%">
				
						<c:forEach var="list_diet" items="${list_diet42}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
								<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
								${list_diet.resource_location}</a></div>
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
							${list_diet.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div>
					<div id="city_xianyang" class="specials-grids" style="width:108%">
				
						<c:forEach var="list_diet" items="${list_diet43}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
								<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
								${list_diet.resource_location}</a></div>
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
							${list_diet.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div>
					<div id="city_weinan" class="specials-grids" style="width:108%">
				
						<c:forEach var="list_diet" items="${list_diet44}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
								${list_diet.resource_location}</a></div>
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
							${list_diet.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div>
					<div id="city_tongchuan" class="specials-grids" style="width:108%">
				
						<c:forEach var="list_diet" items="${list_diet45}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
								${list_diet.resource_location}</a></div>
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
							${list_diet.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div>
					<div id="city_baoji" class="specials-grids" style="width:108%">
				
						<c:forEach var="list_diet" items="${list_diet46}">
						<div class="special-grid spe-grid">
							<div class="myImg2" style="width: 406px; height: 208px;">
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
								${list_diet.resource_location}</a></div>
							<a href="javascript:void(0);" onclick="toNews('${list_diet.id}');">
							${list_diet.resource_name}</a>
						</div>
						</c:forEach>
						<div class="clear"></div>
					</div>
					</div>
					<!-- city -->
					<div class="clear"></div>
				</div>
				<!-- 音乐 -->
			
			</div>
		</div>
	</div>
	<!-- end content -->
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

