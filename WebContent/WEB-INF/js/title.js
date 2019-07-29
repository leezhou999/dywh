$(function() {
	// 创建新的标签
	$("a[title]")
			.click(
					function() {
						// 1.获取超链接标签<a>的title属性的值
						var src = $(this).attr('title');
						// 2.获取超链接变迁<a>的文本
						var tname = $(this).html();
						// 3.判断选项卡是否已经创建
						if ($("#tt").tabs('exists', tname)) {
							$("#tt").tabs('select', tname);

						} else {
							$("#tt")
									.tabs(
											'add',
											{
												title : tname,
												content : '<iframe frameborder=0 style=width:100%;height:100% src='
														+ src + '></iframe>',
												closable : true,
											});
						}

					});
	// 定义动态菜单的动作
	$("#aa").accordion({
		height : 400,
		weigth : "auto",
		border : false,
		align : 'center'
	});

});
