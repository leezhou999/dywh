<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	
	
		<link rel="stylesheet" href="css/responsiveslides.css">
		<script src="js/jquery-1.8.3.min.js"></script>
		<script src="js/responsiveslides.min.js"></script>
		  <script>
		    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 2500,
			        speed: 600
			      });
			});
			    function toNews(id) {
					var id = id;
					window.location.href = "showById?id=" + id;
				}
				
		  </script>
</head>
<body>
		
		<!---start-footer---->
		<div class="footer">
			<div class="wrap">
			<div class="footer-grids">
				<div class="footer-grid">
					<h3>社交媒体</h3>
					<ul>
						<li><a href="#">新浪微博</a></li>
						<li><a href="#">腾讯微博</a></li>
						<li><a href="#">微信公众号</a></li>
					</ul>
				</div>
				<div class="footer-grid">
					<h3>旅游帮助</h3>
					<ul>
						<li><a href="#">在线投诉</a></li>
						<li><a href="#">投诉电话：12301</a></li>
						<li><a href="#">旅游咨询：18691565390</a></li>
					</ul>
				</div>
				<div class="footer-grid">
					<h3>网站导航</h3>
					<ul>
						<li><a href="#">陕西省文化和旅游厅</a></li>
						<li><a href="#">丝绸之路起点旅游走廊</a></li>
						<li><a href="#">秦岭人文生态旅游度假圈</a></li>
					</ul>
				</div>
				<div class="footer-grid footer-lastgrid">
					<h3>关于我们</h3>
					<p>版权所有：XXX</p>
					<div class="footer-grid-address">
						<p>Tel：800-123-123</p>
						<p>Email:<a class="email-link" href="#">XXX@qq.com</a></p>
					</div>
				</div>
				<div class="clear"> </div>
			</div>
			</div>
		</div>

</body>
</html>

