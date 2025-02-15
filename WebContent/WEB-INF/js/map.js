	//提示：下面的代码用jquery，所以如果有不能运行的情况请引用后尝试
	//百度地图api container对应前端div名称 前端要引用2.0版本的百度地图api
	//需引用api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js
	var map = new BMap.Map("container", {
		enableMapClick: false
	}); // 创建地图实例，禁止点击地图底图
	//设置样式
	map.setMapStyle({
		styleJson: [{ //不显示点信息
			"featureType": "poi",
			"elementType": "all",
			"stylers": {
				"color": "#ffffff",
				"visibility": "off"
			}
		}]
	});

	map.disableDragging(); //禁止拖动
	map.disableDoubleClickZoom(); //禁止双击缩放
	var blist = [];
	var districtLoading = 0;

	function getBoundary() {

		addDistrict("西安市");
		addDistrict("咸阳市");
		addDistrict("渭南市");
		addDistrict("铜川市");
		addDistrict("宝鸡市");
	}

	/**
	 * 添加行政区划
	 * @param {} districtName 行政区划名
	 * @returns  无返回值
	 */
	function addDistrict(districtName) {
		//使用计数器来控制加载过程
		districtLoading++;
		var bdary = new BMap.Boundary();
		bdary.get(districtName, function(rs) { //获取行政区域
			var count = rs.boundaries.length; //行政区域的点有多少个
			if(count === 0) {
				alert('未能获取当前输入行政区域');
				return;
			}
			if(districtName == "西安市") {
				blist.push({
					points: rs.boundaries[2],
					name: districtName
				});
			} else if(districtName == "渭南市") {
				blist.push({
					points: rs.boundaries[4],
					name: districtName
				});
			} else {
				for(var i = 0; i < count; i++) {
					blist.push({
						points: rs.boundaries[i],
						name: districtName
					});
				};
			}
			//加载完成区域点后计数器-1
			districtLoading--;
			if(districtLoading == 0) {
				//全加载完成后画端点
				drawBoundary();
			}
		});
	}

	/**
	 * 鼠标事件绑定
	 */
	function click(evt) {
		alert(evt.target.name);
	}

	function drawBoundary() {
		//包含所有区域的点数组
		var pointArray = [];

		/*画遮蔽层的相关方法
		 *思路: 首先在中国地图最外画一圈，圈住理论上所有的中国领土，然后再将每个闭合区域合并进来，并全部连到西北角。
		 *      这样就做出了一个经过多次西北角的闭合多边形*/
		//定义中国东南西北端点，作为第一层
		var pNW = {
			lat: 59.0,
			lng: 73.0
		}
		var pNE = {
			lat: 59.0,
			lng: 136.0
		}
		var pSE = {
			lat: 3.0,
			lng: 136.0
		}
		var pSW = {
			lat: 3.0,
			lng: 73.0
		}
		//向数组中添加一次闭合多边形，并将西北角再加一次作为之后画闭合区域的起点
		var pArray = [];
		pArray.push(pNW);
		pArray.push(pSW);
		pArray.push(pSE);
		pArray.push(pNE);
		pArray.push(pNW);
		//循环添加各闭合区域
		for(var i = 0; i < blist.length; i++) {
			//添加显示用标签层
			var label = new BMap.Label(blist[i].name, {
				offset: new BMap.Size(20, -10)
			});
			label.hide();
			map.addOverlay(label);

			//添加多边形层并显示
			var ply = new BMap.Polygon(blist[i].points, {
				strokeWeight: 5,
				strokeColor: "#FF0000",
				fillOpacity: 0.01,
				fillColor: " #FFFFFF"
			}); //建立多边形覆盖物
			ply.name = blist[i].name;
			ply.label = label;
			ply.addEventListener("click", click);
			map.addOverlay(ply);
			//添加名称标签层
			var centerlabel = new BMap.Label(blist[i].name, {
				offset: new BMap.Size(0, 0)
			});
			centerlabel.setPosition(ply.getBounds().getCenter());
			map.addOverlay(centerlabel);

			//将点增加到视野范围内
			var path = ply.getPath();
			pointArray = pointArray.concat(path);
			//将闭合区域加到遮蔽层上，每次添加完后要再加一次西北角作为下次添加的起点和最后一次的终点
			pArray = pArray.concat(path);
			pArray.push(pArray[0]);
		}

		//限定显示区域，需要引用api库
		var boundply = new BMap.Polygon(pointArray);
		BMapLib.AreaRestriction.setBounds(map, boundply.getBounds());
		map.setViewport(pointArray); //调整视野 

		//添加遮蔽层
		var plyall = new BMap.Polygon(pArray, {
			strokeOpacity: 0.0000001,
			strokeColor: "#000000",
			strokeWeight: 0.00001,
			fillColor: "#000000",
			fillOpacity: 0.4
		}); //建立多边形覆盖物
		map.addOverlay(plyall);
	}

	setTimeout(function() {
		getBoundary();
	}, 100);