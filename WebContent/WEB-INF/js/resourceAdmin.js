//显示资源信息
var flag;//全局变量，标记'确定'按钮的含义，是增加还是更新
var arr;
var param;
$(function(){
	
	$("#edit").dialog('close');
	$("#dg").datagrid({
		/*width:1330,*/
		height:520,
		fitColumns:true,
		url:"Admin/queryResource",
		method:'post',
		columns:[[
			{field:'opera',title:'',width:50,checkbox:'true'},
			{field:'id',title:'资源编号',width:150,align:'center',hidden:'true'},
			{field:'resource_content',hidden:'true'},
			{field:'resource_name',title:'资源名称',width:100,align:'center'},
			{field:'resource_author',title:'资源作者',width:150,align:'center'},
			{field:'resource_time',title:'发布时间',width:150,align:'center',
			formatter : function(value){
				var unixTimestamp = new Date(value);  
	            return unixTimestamp.toLocaleString();  
            }},
			{field:'module_id',title:'所属栏目',width:150,align:'center',
			formatter : function(value){
				if(value=='1') 
					return '首页';
				else if(value=="2"){
					return '语言文化';
				}else if(value=="3"){
					return '建筑文化';
				}else if(value=="4"){
					return '饮食文化';
				}else if(value=="5"){
					return '戏曲文化';
				}
				
            }},
            {field:'resource_type',title:'资源类型',width:150,align:'center',
    			formatter : function(value){
    				if(value=='1') 
    					return '图片';
    				else if(value=="3"){
    					return '视频';
    				}
    				
                }},
            {field:'page_id',title:'页面位置',width:150,align:'center',
    			formatter : function(value){
    				if(value=='11') 
    					return '陕西八大怪特别栏目';
    				else if(value=="12"){
    					return '新闻资讯';
    				}else if(value=="13"){
    					return '关中印象';
    				}else if(value=="14"){
    					return '首页语言栏目特别推荐';
    				}else if(value=="15"){
    					return '首页建筑栏目特别推荐';
    				}else if(value=="16"){
    					return '首页美食栏目特别推荐';
    				}else if(value=="17"){
    					return '首页戏曲栏目特别推荐';
    				}else if(value=="22"){
    					return '关中方言影视剧';
    				}else if(value=="23"){
    					return '关中方言音乐';
    				}
    				
                }},
			
		]],
		toolbar:[{
    		text:'删除',
    		iconCls:'icon-remove',
    		handler:function(){
    		//1.判断用户是否进行了选择,返回一个数组
    	  arr=$("#dg").datagrid('getSelections');
    		//2.当用户未选择时进行提示
    		if(arr.length<=0){
    			/*$.messager.show({
    				title:'提示',
    				msg:'请选择要删除的记录',
    				timeout:3000,
    			});*/
    			alert("请选择要删除的记录!");
    		}else{
    			//当用户选择时，弹出确认窗口
    			$.messager.confirm('提示','确定删除吗?',function(r){
    				if(r){
    					//1.获取用户要删除记录的id
    					var ids="";
    					for(var i=0;i<arr.length;i++){
    						ids=ids+arr[i].id+",";
    					}
    					ids=ids.substring(0,ids.length-1);//处理逗号
    					//console.log(ids);
    					//2.将id传给服务器，完成删除
    					$.ajax({
    						url:'Admin/delResource',
    						method:'post',
    						data:{strid:ids},
    						dataType:'json',
    						success:function(result){
    							$.messager.show({
    								title:'操作结果',
    								msg:result.info,
    								timeout:3000,
    							});
    						},
    					});
    					
    					$("#dg").datagrid('reload');
    				}
    			});
    		}
    		}
    	},'-',{
    		text:'编辑资源信息',
    		iconCls:'icon-edit',
    		handler:function(){
    		//1.获取用户的选择
    		  arr=$("#dg").datagrid('getSelections');
    		//2.如果用户的选择多于一行，提示只能针对一行进行更新
    		if(arr.length != 1){
    			alert("请选择一条记录更新！");
    		}else{
    		
    			$("#edit").dialog({
					title:'编辑资源信息',
					minimizable:'true',
					maximizable:'true'
			});
    			$("#title").attr('value',arr[0].resource_name);
    			$("#resource_id").attr('value',arr[0].id);
    			$("#resource_type").attr('value',arr[0].resource_type);
    			$("#type").attr('value',arr[0].module_id);
    			$("#page_id").attr('value',arr[0].page_id);
    			var ue = UE.getEditor('editor');
    			ue.setContent(arr[0].resource_location);
    		}
    		}
    	}
    	],
    	striped:'true',//斑马条纹
        pagination:true,//显示分页工具栏
        pageSize:10,
        pageList:[10,15,20],
	});
	$("#btn-find").click(function(){
		//1.获取查询文本框中的信息
		 param =$("#findstr").val();
		
		$("#dg").datagrid('load',{
			news_title:param
		});
	});
	$(document).keyup(function(event){
		if(event.which==13){//添加搜索框，键盘响应事件
		//1.获取查询文本框中的信息
		 param =$("#findstr").val();
		
		$("#dg").datagrid('load',{
			news_title:param
		});
		}
	});
	//重置搜索框
	$("#btn-reset").click(function(){
		document.getElementById("findstr").value="";
	});

 });