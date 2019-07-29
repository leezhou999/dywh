<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<link rel="stylesheet" href="css/responsiveslides.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/flexslider.css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script type="text/javascript" src="/dywh/js/jquery.flexslider.js"></script>

<script>
	
	function toNews(id) {
		var id = id;
		window.location.href = "showById?id=" + id;
	}
</script>
<style type="text/css">
.last-grid span{
width:auto !important;
}

</style>
</head>
<body>

	<!---start-header---->
	<%@include file="header.jsp"%>
	<!---End-header---->

	<div class="clear"></div>

	<!--轮播图-->
	<div style="width: 70%; height: 340px;" class="banner">
		<div class="box">
			<div class="list">
				<ul>
					<li class="p7">
					<a href="#">${list_index_resource18.get(0).resource_location}</a>
					</li>
					<li class="p6">
					<a href="#">${list_index_resource18.get(1).resource_location}</a>
					</li>
					<li class="p5">
					<a href="#">${list_index_resource18.get(2).resource_location}</a>
					</li>
					<li class="p4">
					<a href="#">${list_index_resource18.get(3).resource_location}</a>
					</li>
					<li class="p3">
					<a href="#">${list_index_resource18.get(4).resource_location}</a>
					</li>
					<li class="p2">
					<a href="#">${list_index_resource18.get(5).resource_location}</a>
					</li>	
					<li class="p1">
					<a href="#">${list_index_resource18.get(6).resource_location}</a>
					</li>	
				</ul>
			</div>
			<a href="javascript:;" class="prev btn"></a> <a href="javascript:;"
				class="next btn"></a>
			<div class="buttons">
				<a href="javascript:;"><span class="blue"></span></a> 
				<a href="javascript:;"><span></span></a> 
				<a href="javascript:;"><span></span></a>
				<a href="javascript:;"><span></span></a> 
				<a href="javascript:;"><span></span></a>
				<a href="javascript:;"><span></span></a> 
				<a href="javascript:;"><span></span></a>
			</div>
		</div>
	</div>
	<!---End-轮播图---->

	<div class="clear"></div>

	<!---start-content---->
	<div class="content">
		<div class="wrap">
			<div class="content-grids">

				<!-- 第一栏 陕西八大怪 -->
				<div class="grid">
					<div class="myImg" style="width:374px;height:177px;">
						${index_resource_11.resource_location}
					</div>
					<h3>${index_resource_11.resource_name}</h3>
					<div class="box_m">
						<ul class="SmallInfo">
							<c:forEach var="news01" items="${list_index_01}">
								<li class="Style_li">
								<a href="javascript:void(0);"
									onclick="toNews('${news01.id}');">${news01.news_title} 
									</a>
									</li>
							</c:forEach>
						</ul>
						<!-- <a class="button" href="#">+MORE</a> -->
					</div>
				</div>
				<!-- 第二栏 新闻资讯 -->
				<div class="grid ">
					<div class="myImg" style="width:374px;height:177px;">
						${index_resource_12.resource_location}
					</div>
					<h3>${index_resource_12.resource_name}</h3>

					<div class="box_m">
						<ul class="SmallInfo">
							<c:forEach var="news" items="${list_index}">
								<li class="Style_li"><a href="javascript:void(0);"
									onclick="toNews('${news.id}');">${news.news_title} </a></li>
							</c:forEach>
						</ul>
						<a class="button" href="toMore">+MORE</a>
					</div>
				</div>
				<!-- 第三栏 关中印象-->
				<div class="grid last-grid">
					<div class="myImg" style="width:374px;height:177px;">
						${index_resource_13.resource_location}
					</div>
					<h3>${news_03.news_title}</h3>
					<div style="text-align:left;text-indent:2em;width:auto">
					<p><a  href="javascript:void(0);"onclick="toNews('${news_03.id}');">
					${news_03.news_summary}</a></p>
					
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<div class="clear"></div>
			<!-- div分隔 -->
			<div class="specials">

				<div class="clear"></div>
				<!-- 语言 -->
				<div class="specials-heading">
					<h5></h5>
					<h3 style="color:grey">探寻关中语言魅力</h3>
					<h5></h5>
					<div style="float:right;margin-top:12;margin-right:-62">
					<a style="color:grey" href="toLanguage">+MORE</a>
					</div>	
					<div class="clear"></div>
				</div>

				<div class="clear"></div>
				
				<div class="specials-grids">
				
					<div class="special-grid">
					<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource14.get(0).id}');">
						${list_index_resource14.get(0).resource_location}
						</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource14.get(0).id}');">
					${list_index_resource14.get(0).resource_name}</a>
					</div>
					<div class="special-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource14.get(1).id}');">
						${list_index_resource14.get(1).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource14.get(1).id}');">
					${list_index_resource14.get(1).resource_name}</a>
					</div>
					<div class="special-grid spe-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource14.get(2).id}');">
						${list_index_resource14.get(2).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource14.get(2).id}');">
					${list_index_resource14.get(2).resource_name}</a>
						
					</div>

					<div class="clear"></div>
				</div>
				<div class="clear"></div>
					<!-- 建筑-->
				<div class="specials-heading">
					<h5></h5>
					<h3 style="color:grey">领略关中建筑风采</h3>
					<h5></h5>
					<div style="float:right;margin-top:12;margin-right:-62">
					<a style="color:grey" href="toBuilding">+MORE</a>
					</div>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>

				<div class="specials-grids">
					<div class="special-grid">
					<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource15.get(0).id}');">
						${list_index_resource15.get(0).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource15.get(0).id}');">
					${list_index_resource15.get(0).resource_name}</a>
					</div>
					<div class="special-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource15.get(1).id}');">
						${list_index_resource15.get(1).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource15.get(1).id}');">
					${list_index_resource15.get(1).resource_name}</a>
					</div>
					<div class="special-grid spe-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource15.get(2).id}');">
						${list_index_resource15.get(2).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource15.get(2).id}');">
					${list_index_resource15.get(2).resource_name}</a>
					<div class="clear"></div>
				</div>
				<!-- 美食-->
				<div class="specials-heading">
					<h5></h5>
					<h3 style="color:grey">品尝特色地方美食</h3>
					<h5></h5>
					<div style="float:right;margin-top:12;margin-right:-62">
					<a style="color:grey" href="toDiet">+MORE</a>
					</div>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>

				<div class="specials-grids">
					<div class="special-grid">
					<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource16.get(0).id}');">
						${list_index_resource16.get(0).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource16.get(0).id}');">
					${list_index_resource16.get(0).resource_name}</a>
					</div>
					<div class="special-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource16.get(1).id}');">
						${list_index_resource16.get(1).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource16.get(1).id}');">
					${list_index_resource16.get(1).resource_name}</a>
					</div>
					<div class="special-grid spe-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource16.get(2).id}');">
						${list_index_resource16.get(2).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource16.get(2).id}');">
					${list_index_resource16.get(2).resource_name}</a>

					<div class="clear"></div>
				</div>
				<!-- 戏曲-->
				<div class="specials-heading">
					<h5></h5>
					<h3 style="color:grey">欣赏关中戏曲文化</h3>
					<h5></h5>
					<div style="float:right;margin-top:12;margin-right:-62">
					<a style="color:grey" href="toOpera">+MORE</a>
					</div>
					<div class="clear"></div>
				</div>

				<div class="clear"></div>

				<div class="specials-grids">
					<div class="special-grid">
					<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource17.get(0).id}');">
						${list_index_resource17.get(0).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource17.get(0).id}');">
					${list_index_resource17.get(0).resource_name}</a>
					</div>
					<div class="special-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource17.get(1).id}');">
						${list_index_resource17.get(1).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource17.get(1).id}');">
					${list_index_resource17.get(1).resource_name}</a>
					</div>
					<div class="special-grid spe-grid">
						<div class="myImg1" style="width:406px;height:208px;">
						<a href="javascript:void(0);" onclick="toNews('${list_index_resource17.get(2).id}');">
						${list_index_resource17.get(2).resource_location}</a>
					</div> 
					<a href="javascript:void(0);" onclick="toNews('${list_index_resource17.get(2).id}');">
					${list_index_resource17.get(2).resource_name}</a>

					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- 结束分隔 -->
		<div class="clear"></div>
	</div>
	</div>
	</div>
	</div>
	<!---End-content---->
	<div class="clear"></div>
	<!---start-footer---->
	<div style="background:#012231;">
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
	</div>
	<!-- end footer -->
</body>
</html>

