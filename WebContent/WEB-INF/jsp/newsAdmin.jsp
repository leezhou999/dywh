<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>内容管理</title>
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
<script type="text/javascript" src="/dywh/js/newsAdmin.js"></script>
<link rel="stylesheet" type="text/css"
	href="/dywh/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/style.css">
<script src="/dywh/ueditor/ueditor.config.js"></script>
<script src="/dywh/ueditor/ueditor.all.min.js"></script>
<script src="/dywh/ueditor/lang/zh-cn/zh-cn.js"></script>
<!-- 表头颜色 -->
<style>
    .datagrid-header-row td{background-color:#e0ecff;color:black}
</style>
<script type="text/javascript">
	//定义一个二维数组
		var city=[
			["陕西八大怪","新闻资讯","关中印象"],
			["关中方言发展史","关中方言影视剧","关中方言音乐","每日一笑"],
			["华盛顿","纽约","旧金山","西雅图"],
			["剑桥","伦敦","苏格兰地区","北爱尔兰地区"],
			["罗马","米兰","威尼斯","都灵"]
		];
		var cityValue=[
			["11","12","13"],
			["21","22","23","24"],
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
		
	</script>
</head>
<body style="background-color: #e4eef9;">
<div id="cc" class="easyui-layout" style="width:98% !important;height:563">
	
   <div data-options="region:'center'" style="width:95%;height:100%;padding:5px;background:#eee;">  
	<center>
		<table id="dg"></table>
	</center>
	</div>
</div>
<div id="edit" class="easyui-dialog" style="width: 75%; height: 95%; left: 1%; top: 0;">
<!-- 这里是页面内容 -->
<div >
	<div
		style="width: 960px; height: auto; margin-top: 1%; border: 1px solid #e0e0e0;"
		class="banner">
		<input type="text" class="form-control" id="title" placeholder="请输入标题">
		<input type="hidden" id="id">
		<input type="hidden" id="type">
		<input type="hidden" id="page_id">
	</div>
	<form name="form1">
	
	</form>
	<div style="width: 960px; height: auto; margin-top:20px;border: 1px solid #e0e0e0;"
		class="banner">
		<div style="margin-top: 8px; width: 300px; height: 20px;">

			<span class="label label-danger" style="width: 200px;">请添加摘要：</span><br>
		</div>
		<textarea class="form-control" rows="3" id="summary" placeholder="请添加摘要信息"></textarea>
	</div>
	<div
		style="margin-top: 1%; width: 960px; height: auto; border: 1px solid #e0e0e0;"
		class="banner">

		<script id="editor1" type="text/plain"></script>


		<script>
			$(function() {
				//实例化编辑器
				var ue = UE.getEditor('editor1', {
					initialFrameWidth : "100%", //初始化宽度
					initialFrameHeight : "450px", //初始化高度 */
				});

				$('#submit').click(function() {
					//获取ueditor编辑框中的html文本内容
					var id=$("#id").val();
					var content = UE.getEditor('editor1').getContent();
					var title = $("#title").val();
					var author = '${sessionScope.loginInfo.name}';
					var summary = $("#summary").val();
					var type1 = $("#type").val();
					var page_id=$("#page_id").val();
					var r = confirm("确认编辑该消息吗？");
					if (r == true) {
						$.ajax({
							url : '/dywh/Admin/edit',
							type : 'POST',
							data : {
								id:id,
								news_title : title,
								news_author : author,
								news_summary : summary,
								news_content : content,
								module_id : type1,
								page_id:page_id
							},
							dataType : 'json',
							success : function(flag) {
								alert("编辑成功");
								/* window.location = "/dywh/toManageNews"; */
								$("#edit").dialog('close');
							},
							error : function(flag) {
								alert("编辑成功！");
								
							}
						});
						
					} else {
						alert("你取消了发布！");
					}
				})
			})
		</script>

	</div>
	</div>
	<div style="widht:100%;height:auto;margin-top: 8px !important; text-align: center;">
		<button class="btn btn-primary btn-lg" id="submit">提 交</button>

	</div>
</div>
</body>

</html>
