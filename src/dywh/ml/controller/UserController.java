package dywh.ml.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dywh.ml.entity.News;
import dywh.ml.entity.Resource;
import dywh.ml.service.IAdminService;
import dywh.ml.service.IUserService;
import dywh.ml.util.FileTools;

/**
 * 用户控制Controller
 * 
 * @author ml
 *
 */
@Controller
/* @RequestMapping(value="/User") */
public class UserController {
	// 用来保存版块信息，传送给前段显示
	private static Map<String, Object> map = new HashMap<String, Object>();
	/**
	 * 配置了html和jsp两种视图解析器，自动扫描跳转，jsp与html命名不可重复。
	 */
	private IUserService userService;

	@Autowired
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	private IAdminService adminService;
	@Autowired
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	/**
	 * 跳转至top.jsp
	 */
	@RequestMapping(value = "/toTop")
	public String TopJsp() {
		return "top";
	}

	

	/**
	 * 跳转至header.jsp
	 */
	@RequestMapping(value = "/toHeader")
	public String HeadHtml() {
		return "head";
	}
	/**
	 * 跳转至newsAdmin.jsp
	 */
	@RequestMapping(value = "/toNewsAdmin")
	public String NewsAdmin() {
		return "newsAdmin";
	}
	/**
	 * 跳转至resourceAdmin.jsp
	 */
	@RequestMapping(value = "/toResourceAdmin")
	public String ResourceAdmin() {
		return "resourceAdmin";
	}
	/**
	 * 跳转至toMore.jsp
	 */
	@RequestMapping(value = "/toMore")
	public ModelAndView More(HttpServletRequest request,News news) {
		ModelAndView mav = new ModelAndView("more");
		
		
		return mav;
	}

	/**
	 * 跳转至bottom.jsp
	 */
	@RequestMapping(value = "/toBottom")
	public String BottomJsp() {
		return "bottom";
	}

	/**
	 * 跳转至preview.jsp
	 */
	@RequestMapping(value = "/toPreview")
	public String PreviewJsp() {
		return "preview";
	}

	/**
	 * 跳转至index.jsp,首页
	 */
	@RequestMapping(value = "/toIndex")
	public Object IndexJsp() {
		
		ModelAndView mav = new ModelAndView("index");
		
		News news = new News();
		News news_01 = new News();
		News news_03 = new News();
		
		Resource resource = new Resource();//八大怪
		Resource resource12 = new Resource();//新闻资讯
		Resource resource13 = new Resource();//关中印象
		Resource resource14 = new Resource();//语言
		Resource resource15 = new Resource();//建筑
		Resource resource16 = new Resource();//饮食
		Resource resource17 = new Resource();//戏曲
		Resource resource18 = new Resource();//首页轮播图
		
		List<News> list_index = new ArrayList<>();
		List<News> list_index_01 = new ArrayList<>();
		List<News> list_index_03 = new ArrayList<>();
		
		List<Resource> list_index_resource11 = new ArrayList<>();
		List<Resource> list_index_resource12 = new ArrayList<>();
		List<Resource> list_index_resource13 = new ArrayList<>();
		List<Resource> list_index_resource14 = new ArrayList<>();
		List<Resource> list_index_resource15 = new ArrayList<>();
		List<Resource> list_index_resource16 = new ArrayList<>();
		List<Resource> list_index_resource17 = new ArrayList<>();
		List<Resource> list_index_resource18 = new ArrayList<>();
		
		//资讯栏目
		news.setModule_id(1);
		news.setPage_id(12);
		list_index = userService.queryNews(news);
		
		//System.out.println("list_index_size:"+list_index.size());
		
		//八大怪固定栏目
		news_01.setModule_id(1);
		news_01.setPage_id(11);
		list_index_01 = userService.queryNews(news_01);
		
		
		//System.out.println("list_index01_size:"+list_index_01.size());
		
		//关中印象
		news_03.setModule_id(1);
		news_03.setPage_id(13);
		list_index_03 = userService.queryNews(news_03);
		news_03 = list_index_03.get(0);
		
		//资源信息
		//11
		resource.setModule_id(1);
		resource.setPage_id(11);
		list_index_resource11 = adminService.queryResource(resource);
		resource=list_index_resource11.get(0);
		
		//12
		resource12.setModule_id(1);
		resource12.setPage_id(12);
		list_index_resource12 = adminService.queryResource(resource12);
		resource12=list_index_resource12.get(0);
		
		//13
		resource13.setModule_id(1);
		resource13.setPage_id(13);
		list_index_resource13 = adminService.queryResource(resource13);
		resource13=list_index_resource13.get(0);
		
		//14
		resource14.setModule_id(1);
		resource14.setPage_id(14);
		list_index_resource14 = adminService.queryResource(resource14);
		
		//15
		resource15.setModule_id(1);
		resource15.setPage_id(15);
		list_index_resource15 = adminService.queryResource(resource15);
		
		//16
		resource16.setModule_id(1);
		resource16.setPage_id(16);
		list_index_resource16 = adminService.queryResource(resource16);
		
		//17
		resource17.setModule_id(1);
		resource17.setPage_id(17);
		list_index_resource17 = adminService.queryResource(resource17);
		
		//18
		resource18.setModule_id(1);
		resource18.setPage_id(18);
		list_index_resource18 = adminService.queryResource(resource18);
		
		mav.addObject("list_index", list_index);//资讯
		mav.addObject("list_index_01", list_index_01);//第一栏目，八大怪
		mav.addObject("news_03",news_03);//关中印象特别栏目
		
		mav.addObject("index_resource_11", resource);//资源11
		mav.addObject("index_resource_12", resource12);//资源12
		mav.addObject("index_resource_13", resource13);//资源13
		mav.addObject("list_index_resource14", list_index_resource14);//资源14
		mav.addObject("list_index_resource15", list_index_resource15);//资源15
		mav.addObject("list_index_resource16", list_index_resource16);//资源16
		mav.addObject("list_index_resource17", list_index_resource17);//资源17
		mav.addObject("list_index_resource18", list_index_resource18);//资源18
		
		return mav;
	}

	/**
	 * 跳转至language.jsp
	 */
	@RequestMapping(value = "/toLanguage")
	public Object LanguageJsp() {
		
		ModelAndView mav = new ModelAndView("language");
		
		News news21 = new News();
		Resource resource22 = new Resource();
		Resource resource23 = new Resource();
		News news24 = new News();
		
		List<News> list_language21 = new ArrayList<>();//发展史
		List<Resource> list_language22 = new ArrayList<>();//影视剧
		List<Resource> list_language23 = new ArrayList<>();//音乐
		List<News> list_language24 = new ArrayList<>();//发展史
		
		//发展史
		news21.setModule_id(2);
		news21.setPage_id(21);
		list_language21 = userService.queryNews(news21);
		news21 = list_language21.get(0);
		
		//影视剧
		resource22.setModule_id(2);
		resource22.setPage_id(22);
		list_language22 = adminService.queryResource(resource22);
		
		//音乐
		resource23.setModule_id(2);
		resource23.setPage_id(23);
		list_language23 = adminService.queryResource(resource23);
		
		//每日一笑
		news24.setModule_id(2);
		news24.setPage_id(24);
		list_language24 = userService.queryNews(news24);
		news24 = list_language24.get(0);
		
		mav.addObject("news21", news21);//发展史
		mav.addObject("list_language22", list_language22);//影视
		mav.addObject("list_language23", list_language23);//音乐
		mav.addObject("news24", news24);//每日一笑

		return mav;
	}

	/**
	 * 跳转至building.jsp,建筑文化
	 */
	@RequestMapping(value = "/toBuilding")
	public Object BuildingJsp() {
		
		ModelAndView mav = new ModelAndView("building");
		
		Resource resource31 = new Resource();
		Resource resource32 = new Resource();
		Resource resource33 = new Resource();
		Resource resource34 = new Resource();
		Resource resource35 = new Resource();
		Resource resource36 = new Resource();
		
		List<Resource> list_building31 = new ArrayList<>();//轮播图
		List<Resource> list_building32 = new ArrayList<>();//西安
		List<Resource> list_building33 = new ArrayList<>();//咸阳
		List<Resource> list_building34 = new ArrayList<>();//渭南
		List<Resource> list_building35 = new ArrayList<>();//铜川
		List<Resource> list_building36 = new ArrayList<>();//宝鸡
		
		//轮播图
		resource31.setModule_id(3);
		resource31.setPage_id(31);
		list_building31 = adminService.queryResource(resource31);
		
		//西安
		resource32.setModule_id(3);
		resource32.setPage_id(32);
		list_building32 = adminService.queryResource(resource32);
		
		//咸阳
		resource33.setModule_id(3);
		resource33.setPage_id(33);
		list_building33 = adminService.queryResource(resource33);
		
		//渭南
		resource34.setModule_id(3);
		resource34.setPage_id(34);
		list_building34 = adminService.queryResource(resource34);
				
		//铜川
		resource35.setModule_id(3);
		resource35.setPage_id(35);
		list_building35 = adminService.queryResource(resource35);
				
		//宝鸡
		resource36.setModule_id(3);
		resource36.setPage_id(36);
		list_building36 = adminService.queryResource(resource36);
				
		
		mav.addObject("list_building31", list_building31);//轮播图
		mav.addObject("list_building32", list_building32);//西安
		mav.addObject("list_building33", list_building33);//咸阳
		mav.addObject("list_building34", list_building34);//渭南
		mav.addObject("list_building35", list_building35);//铜川
		mav.addObject("list_building36", list_building36);//宝鸡
		
		return mav;
	}

	/**
	 * 跳转至diet.jsp,饮食文化
	 */
	@RequestMapping(value = "/toDiet")
	public Object DietJsp() {
		ModelAndView mav = new ModelAndView("diet");
		
		Resource resource41 = new Resource();
		Resource resource42 = new Resource();
		Resource resource43 = new Resource();
		Resource resource44 = new Resource();
		Resource resource45 = new Resource();
		Resource resource46 = new Resource();
		
		List<Resource> list_diet41 = new ArrayList<>();//轮播图
		List<Resource> list_diet42 = new ArrayList<>();//西安
		List<Resource> list_diet43 = new ArrayList<>();//咸阳
		List<Resource> list_diet44 = new ArrayList<>();//渭南
		List<Resource> list_diet45 = new ArrayList<>();//铜川
		List<Resource> list_diet46 = new ArrayList<>();//宝鸡
		
		//轮播图
		resource41.setModule_id(4);
		resource41.setPage_id(41);
		list_diet41 = adminService.queryResource(resource41);
		
		//西安
		resource42.setModule_id(4);
		resource42.setPage_id(42);
		list_diet42 = adminService.queryResource(resource42);
		
		//咸阳
		resource43.setModule_id(4);
		resource43.setPage_id(43);
		list_diet43 = adminService.queryResource(resource43);
		
		//渭南
		resource44.setModule_id(4);
		resource44.setPage_id(44);
		list_diet44 = adminService.queryResource(resource44);
				
		//铜川
		resource45.setModule_id(4);
		resource45.setPage_id(45);
		list_diet45 = adminService.queryResource(resource45);
				
		//宝鸡
		resource46.setModule_id(4);
		resource46.setPage_id(46);
		list_diet46 = adminService.queryResource(resource46);
				
		
		mav.addObject("list_diet41", list_diet41);//轮播图
		mav.addObject("list_diet42", list_diet42);//西安
		mav.addObject("list_diet43", list_diet43);//咸阳
		mav.addObject("list_diet44", list_diet44);//渭南
		mav.addObject("list_diet45", list_diet45);//铜川
		mav.addObject("list_diet46", list_diet46);//宝鸡
		
		return mav;
	}

	/**
	 * 跳转至opera.jsp,戏曲文化
	 */
	@RequestMapping(value = "/toOpera")
	public Object OperaJsp() {
ModelAndView mav = new ModelAndView("opera");
		
		News resource51 = new News();
		Resource resource52 = new Resource();
		
		
		List<News> list_opera51 = new ArrayList<>();//静态块
		List<Resource> list_opera52 = new ArrayList<>();//戏曲
		
		
		//静态内容
		resource51.setModule_id(5);
		resource51.setPage_id(51);
		list_opera51 = userService.queryNews(resource51);
		resource51 = list_opera51.get(0);
		
		//戏曲
		resource52.setModule_id(5);
		resource52.setPage_id(52);
		list_opera52 = adminService.queryResource(resource52);
		
		mav.addObject("resource51", resource51);//静态内容
		mav.addObject("list_opera52", list_opera52);//戏曲
		
		return mav;
	}

	/**
	 * 跳转至登录页
	 */
	@RequestMapping(value = "/toLogin")
	public String LoginJsp() {
		return "login";
	}

	/**
	 * 跳转至管理员后台
	 */
	@RequestMapping(value = "/toAdmin")
	public String AdminJsp() {
		return "admin";
	}

	/**
	 * 跳转至发布新闻页
	 */
	@RequestMapping(value = "/toManageNews")
	public String ManageNewsJsp() {
		return "news";
	}
	/**
	 * 跳转至资源上传页面
	 */
	@RequestMapping(value = "/toManageResource")
	public String ManageResourceJsp() {
		return "resource";
	}
	// 根据id显示二级新闻页
	@RequestMapping(value = "/showById", method = RequestMethod.GET)
	public ModelAndView showById(@Param("id") int id) {
		ModelAndView mav = new ModelAndView("preview");

		News news = new News();
		news.setId(id);
		List<News> list_index = new ArrayList<>();
		list_index = userService.queryNews(news);
		if (list_index.size() == 1) {
			news = list_index.get(0);
		}
		mav.addObject("news", news);
		return mav;
	}

	// 首页资讯更多数据
	@ResponseBody
	@RequestMapping(value = "/getIndexList", method = RequestMethod.GET)
	public Object getIndexListData(HttpServletRequest request, News news) {
		int page = Integer.parseInt(request.getParameter("pageIndex"));
		// 记录本页大小
		int rows = Integer.parseInt(request.getParameter("pageSize"));
		// 定义开始位置
		int start = (page - 1) * rows;
		// 新建存储本页数据的list
		news.setStart(start);
		news.setEnd(rows);
		news.setModule_id(1);
		news.setPage_id(12);
		List<News> list = new ArrayList<News>();
		list = userService.queryNews(news);
		// 设置数据包
		Map<String, Object> map = new HashMap<String, Object>();
		// 对数据包中添加数据，total：表示数据总数（从数据库中查出来的）
		map.put("total", userService.getCount(news));
		// 本页数据
		map.put("rows", list);
		return map;
	}
	/**
	 * 首页queryNews
	 * @return
	 */
	@RequestMapping(value="/queryNews")
	@ResponseBody
	public Object queryNews(HttpServletRequest request,News news) {
		List<News> li=userService.queryNews(news);
		//记录本页页码
		//log.info(("li.size:"+li.size()));
		//log.info("requestPage:"+request.getParameter("page"));
		int page = Integer.parseInt(request.getParameter("page"));
		//log.info("page"+page);
		//记录本页大小
		int rows = Integer.parseInt(request.getParameter("rows"));
		//log.info("rows"+rows);
		
		//新建存储本页数据的list
		List<News> list = new ArrayList<News>();
		//定义开始位置
		int start = (page-1)*rows;
		//定义结束位置
		int end = start + rows;
		if(end>li.size()) {
			end = li.size();
		}
		//对本页进行赋值
		for(int i = start;i<end;i++) {
			list.add(li.get(i));
			//System.out.println(list.toString());
		}
		//设置数据包
		Map<String, Object> map = new HashMap<String, Object>();
		//对数据包中添加数据，total：表示数据总数（从数据库中查出来的）
		map.put("total", li.size());
		//本页数据
		map.put("rows", list);
		return map;
	}
	/**
	 * 管理端，queryNews
	 * @return
	 */
	@RequestMapping(value="/queryNews2")
	@ResponseBody
	public Object queryNews2(HttpServletRequest request,News news) {
		//与首页不同，显示全部，设置end为0
		news.setEnd(0);
		//System.out.println(news.toString());
		List<News> li=userService.queryNews(news);
		//记录本页页码
		//log.info(("li.size:"+li.size()));
		//log.info("requestPage:"+request.getParameter("page"));
		int page = Integer.parseInt(request.getParameter("page"));
		//log.info("page"+page);
		//记录本页大小
		int rows = Integer.parseInt(request.getParameter("rows"));
		//log.info("rows"+rows);
		
		//新建存储本页数据的list
		List<News> list = new ArrayList<News>();
		//定义开始位置
		int start = (page-1)*rows;
		//定义结束位置
		int end = start + rows;
		if(end>li.size()) {
			end = li.size();
		}
		//对本页进行赋值
		for(int i = start;i<end;i++) {
			list.add(li.get(i));
			//System.out.println(list.toString());
		}
		//设置数据包
		Map<String, Object> map = new HashMap<String, Object>();
		//对数据包中添加数据，total：表示数据总数（从数据库中查出来的）
		map.put("total", li.size());
		//本页数据
		map.put("rows", list);
		return map;
	}
	
	
}