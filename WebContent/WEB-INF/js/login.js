
//登陆的js验证，只是验证非空
$(function(){
	$("#id").textbox({
		width:380,
		height:48,
		iconWidth:60,
		iconAlign:"left"
	});
	$("#password").passwordbox({
		width:380,
		height:48,
		iconWidth:60,
		iconAlign:"left"
	});
	
	$("#ok").linkbutton({
		width:380,
		height:48,
		
	});
	$("#ok").click(function(event){
		//获取用户输入的值
		var id = $("#id").textbox('getValue');
		var pw = $("#password").passwordbox('getValue');
		//判空
		if(id==""||pw==""){
			$.messager.show({
				title:'提示',
				msg:'请输入您的账号或密码',
				timeout:1000
			});
			return false;
		}
		else{
			return true;
		}
	});
 }
)