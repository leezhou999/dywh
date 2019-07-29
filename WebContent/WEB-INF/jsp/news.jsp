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
<script type="text/javascript" src="/dywh/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/dywh/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/dywh/js/js_z.js"></script>
<link rel="stylesheet" type="text/css" href="/dywh/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/dywh/css/thems.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/responsive.css">
<link rel="stylesheet" type="text/css"
	href="/dywh/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/dywh/css/style.css">

<!-- 这里是加载UE的js文件 -->
<script src="/dywh/ueditor/ueditor.config.js"></script>
<script src="/dywh/ueditor/ueditor.all.min.js"></script>
<script src="/dywh/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
	//定义一个二维数组
		var city=[
			["陕西八大怪","新闻资讯","关中印象"],
			["关中方言发展史","关中方言影视剧","关中方言音乐","每日一笑"],
			["华盛顿","纽约","旧金山","西雅图"],
			["剑桥","伦敦","苏格兰地区","北爱尔兰地区"],
			["戏曲文化静态内容","米兰","威尼斯","都灵"]
		];
		var cityValue=[
			["11","12","13"],
			["21","22","23","24"],
			["华盛顿","纽约","旧金山","西雅图"],
			["剑桥","伦敦","苏格兰地区","北爱尔兰地区"],
			["51","米兰","威尼斯","都灵"]
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

<body>
	<!-- 这里是页面内容 -->
	<div
		style="width: 900px; height: auto; margin-top: 1%;margin-right:83%; border: 1px solid #e0e0e0;"
		class="banner">
		<input type="text" class="form-control" id="title" placeholder="请输入标题">

	</div>
	<form name="form1" style="margin-right:83%;">
	<div
		style="width: 900px; height: 43px; margin-top: 10px;">
		<div style="margin-top: 8px; width: 300px; height: 20px;">
			<span class="label label-danger" style="width: 200px;margin-left:0">栏目选择：</span><br>
		</div>

		<select id="type" name="country" onChange="getCity()" class="form-control">
			<option value="1" selected="selected">===请选择页面===</option>
			<option value="1">首页</option>
			<option value="2">语言文化</option>
			<option value="3">建筑文化</option>
			<option value="4">饮食文化</option>
			<option value="5">戏曲文化</option>
		</select>
	</div>
	<div
		style="width: 900px; height: 43px; margin-top: 10px;">
		<div style="margin-top: 8px; width: 300px; height: 20px;">
			<span class="label label-danger" style="width: 200px;margin-left:0">位置选择：</span><br>
		</div>

		<select id="page_id" name="city" class="form-control">
			<option value="12" id="cValue" selected="selected">===请选择位置===</option>
			
		</select>
	</div>
	</form>
	<div style="width: 900px; height: auto; margin-top:20px;margin-right:83%;border: 1px solid #e0e0e0;"
		class="banner">
		<div style="margin-top: 8px; width: 300px; height: 20px;">

			<span class="label label-danger" style="width: 200px;">请添加摘要：</span><br>
		</div>
		<textarea class="form-control" rows="3" id="summary"placeholder="请添加摘要信息"></textarea>
	</div>
	<div
		style="margin-top: 1%; width: 900px; margin-right:83%;height: 500px; border: 1px solid #e0e0e0;"
		class="banner">

		<script id="editor" type="text/plain"></script>


		<script>
			$(function() {
				//实例化编辑器
				var ue = UE.getEditor('editor', {
					initialFrameWidth : "100%", //初始化宽度
					initialFrameHeight : "100%", //初始化高度 */
				});

				$('#submit').click(function() {
					//获取ueditor编辑框中的html文本内容
					var content = UE.getEditor('editor').getContent();
					var title = $("#title").val();
					var author = '${sessionScope.loginInfo.name}';
					var summary = $("#summary").val();
					var type1 = $("#type").val();
					var page_id=$("#page_id").val();
					var r = confirm("确认发布该消息吗？");
					if (r == true) {
						$.ajax({
							url : '/dywh/Admin/insert',
							type : 'POST',
							data : {
								news_title : title,
								news_author : author,
								news_summary : summary,
								news_content : content,
								module_id : type1,
								page_id:page_id
							},
							dataType : 'json',
							success : function(flag) {
								alert("发布成功，即将跳转新的编辑界面");
								window.location = "/dywh/toManageNews";
							},
							error : function(flag) {
								alert("保存失败");
							}
						});
						
					} else {
						alert("你取消了发布！");
					}
				})
			})
		</script>

	</div>
	
	<div style="margin-top: 10px; width:900;margin-right:83%;text-align: center;">
		<button class="btn btn-primary btn-lg" id="submit">提 交</button>

	</div>
</body>

</html>
