<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title></title>

</head>
<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />	
<script src="/dywh/js/page.js"></script>
<script type="text/javascript" src="/dywh/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	var news;
	function toNews(id) {
		var id = id;
		window.location.href = "showById?id=" + id;
	}
	$(function () {
		
        //分页参数（参数名固定不可变）
        var pageConfig = {
            pageSize: 10,                //每页条数（不设置时，默认为10）
            prevPage: '上一页',             //上一页（不设置时，默认为：<）
            nextPage: '下一页',             //下一页（不设置时，默认为：>）
            firstPage: '首页',            //首页（不设置时，默认为：<<）
            lastPage: '末页',             //末页（不设置时，默认为：>>）
            degeCount: 4,                //当前页前后两边可显示的页码个数（不设置时，默认为3）
            ellipsis: true               //是否显示省略号按钮(不可点击)（true:显示，false:不显示，不设置时，默认为显示）
        }
        getList();  //初始加载就查询


        //查询列表数据
        function getList() {
            //初始化Paging实例(pageConfig参数也可以为空对象，此时就是默认设置)
            var pageIng = new Paging(pageConfig, function (pageIndex, pageSize) {
                //var userName = $('#user_name').val();
                $.ajax({
                    url:'getIndexList', //这里就不显示接口地址
                    type:'get',
                    data:{
                        pageIndex: pageIndex,
                        pageSize: pageSize,
                    },
                    success: function (data,status) {
                    	 $("#father").empty();
                    	
                    	  $.each(data.rows, function(index, item) {
                    		 
                             $("#father").append(  //此处向select中循环绑定数据
                            		 '<div style="margin-left: 15px; width: 95%;">'+
        							 '<h2><a class="aTarget"  href="javascript:void(0);" onclick="toNews('+item.id+');">'+item.news_title+'</a></br>'+
        							 '</h2>'+
        							 '<p class="meta">'+
        								'<span class="smallInfoForA"> ' + item.news_time +
        								'&nbsp;&nbsp;&nbsp; </span> <span class="smallInfoForA">'+
        								'作者：' + item.news_author + '&nbsp;&nbsp; </span>'+
        									'</p>'+
        								'<p class="note">'+item.news_summary+'</p>'+
        								'<hr>'+
        							'</div>'
									 );
                             
                         }); 
                    	 var totalCount = data.total;   //接口返回的总条数
                         var totalPage = Math.ceil(totalCount/pageSize);//根据总条数和每页条数计算总页码数

                         // 调用Paging实例的 initPage()方法生成分页DOM结构
                         pageIng.initPage(totalCount, totalPage, pageIndex);
                         $('.page').show();
                    }
                })
            });
        }
    })
</script>
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
	<!-- 这里是页面内容 -->
	<div
		style="width: 100%; height: 800px; margin: 0px; padding: 0px; background: #e6e6e6">
		<div id="father"
			style="width: 50%; height: 760px; border: 1px solid #ccc;margin-left:27%; border-width: 0 1px; background: white"
			class="banner"></div>
		<div id="pageS" class="page">
			<div class="page-r">
				<span>总共 <span id="total_count"></span>条
				</span>
				<ul id="page_ul" class="page-ul"></ul>
			</div>
		</div>
	</div>
	<!---start-footer---->
	<div class="footer">
		<div class="wrap">
			<div class="footer-grids">
				<div class="footer-grid">
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
						<p style="font-size:12 !important">Tel：800-123-123</p>
						<p style="font-size:12 !important">
							Email:<a class="email-link" href="#">XXX@qq.com</a>
						</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	
</body>
</html>