<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>资源管理</title>
<link type="text/css" rel="stylesheet"
	href="/dywh/js/jquery-easyui-1.5.2/themes/icon.css" />
<link type="text/css" rel="stylesheet"
	href="/dywh/js/jquery-easyui-1.5.2/themes/default/easyui.css" />
<script type="text/javascript"
	src="/dywh/js/jquery-easyui-1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="/dywh/js/jquery-easyui-1.5.2/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="/dywh/js/jquery-easyui-1.5.2/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/dywh/js/resourceAdmin.js"></script>
<link rel="stylesheet" type="text/css"
	href="/dywh/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/style.css">
<!-- 这里是加载UE的js文件 -->
<script src="/dywh/ueditor/ueditor.config2.js"></script>
<script src="/dywh/ueditor/ueditor.all.min.js"></script>
<script src="/dywh/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	//定义一个二维数组
		var city=[
			["陕西八大怪特别栏目","新闻资讯","陕西印象",
			"首页语言栏目特别推荐","首页建筑栏目特别推荐","首页饮食栏目特别推荐","首页戏曲栏目特别推荐","首页轮播图"],
			["关中方言发展史","关中方言影视剧","关中方言音乐"],
			["华盛顿","纽约","旧金山","西雅图"],
			["剑桥","伦敦","苏格兰地区","北爱尔兰地区"],
			["罗马","米兰","威尼斯","都灵"]
		];
		var cityValue=[
			["11","12","13","14","15","16","17","18"],
			["21","22","23"],
			["华盛顿","纽约","旧金山","西雅图"],
			["剑桥","伦敦","苏格兰地区","北爱尔兰地区"],
			["罗马","米兰","威尼斯","都灵"]
		];
		function getCity(){
			var sltCountry=document.form1.country;   //获得国家下拉框的对象
			var sltCity=document.form1.city;     //获得城市下拉框的对象
			var country=city[sltCountry.selectedIndex-1];//得到对应国家的城市数组
			var cValue = cityValue[sltCountry.selectedIndex-1];
			sltCity.length=1;    //清空城市下拉框，仅留提示选项。
			//通过for循环，将城市中的值填充到城市下拉框中
			for(var i=0;i<country.length;i++){
				for(var j=0;j<country.length;j++){
					sltCity[i+1]=new Option(country[i],cValue[i]);//双值构造，text，value
					//alert(cValue[i,j]);
				}
			}
		}
		$(function(){
			$("#page_id").change(function(){
				var opt=$("#page_id").val();
				//alert(opt);
			});
		})
		
	</script>
</head>
<body style="background-color: #e4eef9;">
<div id="cc" class="easyui-layout" style="width:98% !important;height:563">
	
   <div data-options="region:'center'" style="width:100%;padding:5px;background:#eee;">  
	<center>
		<table id="dg"></table>
	</center>
	</div>
</div>
<div id="edit" class="easyui-dialog"style="width: 75%; height: 95%; left: 1%; top: 0;">
<!-- 这里是页面内容 -->
	<div
		style="width: 960px; height: auto; margin-top: 1%; border: 1px solid #e0e0e0;"
		class="banner">
		<input type="text" class="form-control" id="title" placeholder="请输入资源名称">
		<input type="hidden" id="resource_id">
	</div>
	<input type="hidden" id="resource_type">
	
	<form name="form1">
	<input type="hidden" id="type">
	<input type="hidden" id="page_id">
	
	
	</form>
	
	<div
		style="margin-top: 1%; width: 960px; height: 500px; border: 1px solid #e0e0e0;"
		class="banner">

		<script id="editor" type="text/plain"></script>


		<script>
			$(function() {
				//实例化编辑器
				var ue = UE.getEditor('editor', {
					initialFrameWidth : "100%", //初始化宽度
					initialFrameHeight : "300px", //初始化高度 */
				});

				$('#submit').click(function() {
					//获取ueditor编辑框中的html文本内容
					var content = UE.getEditor('editor').getContent();
					var title = $("#title").val();
					var id=$("#resource_id").val();
					var author = '${sessionScope.loginInfo.name}';
					var summary = $("#summary").val();
					var resource_type = $("#resource_type").val();
					var type1 = $("#type").val();
					var page_id=$("#page_id").val();
					var r = confirm("确认发布该消息吗？");
					if (r == true) {
						$.ajax({
							url : '/dywh/Admin/editResource',
							type : 'POST',
							data : {
								id:id,
								resource_name : title,
								resource_author : author,
								resource_location : content,
								module_id : type1,
								page_id:page_id,
								resource_type:resource_type
							},
							dataType : 'json',
							success : function(flag) {
								alert("资源编辑成功");
								//window.location = "/dywh/toManageResource";
								$("#edit").dialog('close');
							},
							error : function(flag) {
								alert("资源编辑成功！");
								
							}
						});
						//alert("id:"+id+"title:"+title+"resource_type:"+resource_type+"type:"+type1+"page_id:"+page_id);
						
					} else {
						alert("你取消了发布！");
					}
				})
			})
		</script>

	</div>
	
	<div style="margin-top: 60px; text-align: center;">
		<button class="btn btn-primary btn-lg" id="submit">提 交</button>

	</div>
</div>
</body>

</html>
