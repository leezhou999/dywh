package dywh.ml.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dywh.ml.entity.AdminAccount;
import dywh.ml.entity.News;
import dywh.ml.entity.Resource;
import dywh.ml.service.IAdminService;
import dywh.ml.service.IUserService;
import dywh.ml.util.FileTools;
import dywh.ml.util.MD5Utils;

/**
 * 管理员Controller
 * 
 * @author ml
 *
 */
@Controller
@RequestMapping(value = "/Admin")
public class AdminController {
	private Logger log = LoggerFactory.getLogger(getClass());

	private IAdminService adminService;

	@Autowired
	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	private IUserService userService;
	@Autowired
    public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	/**
	 * 登录验证 登录时通过user_id匹配密码
	 * 
	 * @param u
	 * @param session
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(AdminAccount admin, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		admin.setPassword(MD5Utils.md5Password(admin.getPassword()));
		log.info("admin/login:页面传递的对象admin:" + admin.toString());
		AdminAccount adminLoginInfo = adminService.adminLogin(admin);

		if (admin != null && adminLoginInfo != null) {
			mav = new ModelAndView("admin");
			session.setAttribute("loginInfo", adminLoginInfo);
			return mav;
		}
		mav = new ModelAndView("login");
		return mav;
	}

	/**
	 * 退出登录
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/exitLogin")
	public String exitLogin(HttpSession session) {
		session.invalidate();
		return "login";
	}

	/**
	 * 管理员发布新闻
	 * 
	 * @param news
	 * @return
	 */
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String add(News news) {
		boolean flag = adminService.add(news);
		if (flag) {
			return "{\"flag\":true}";
		} else {
			return "{\"flag\":false}";
		}
	}

	/**
	 * 管理员编辑新闻，同时编辑资源
	 * 
	 * @param news
	 * @return
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	@ResponseBody
	public String edit(News news) {
		System.out.println("news:"+news.toString());
		boolean flag = adminService.edit(news);

		Resource resource = new Resource();
		resource.setId(news.getId());
		resource.setResource_name(news.getNews_title());
		if (flag) {
			adminService.editResource(resource);
			return "{\"flag\":true}";
		} else {
			return "{\"flag\":false}";
		}
	}

	/**
	 * 管理员发布资源，同时添加内容
	 * 
	 * @param news
	 * @return
	 */
	@RequestMapping(value = "/insertResource", method = RequestMethod.POST)
	@ResponseBody
	public String insertResource(Resource resource) {
		boolean flag = adminService.insertResource(resource);
		
		resource.setId(adminService.selectId(resource).getId());
		
		News news = new News();
		news.setId(resource.getId());
		news.setNews_title(resource.getResource_name());
		news.setModule_id(resource.getModule_id());
		news.setPage_id(resource.getPage_id());
		news.setNews_author(resource.getResource_author());
		
		if (flag) {
			adminService.add2(news);// 同时添加内容
			return "{\"flag\":true}";
		} else {
			return "{\"flag\":false}";
		}
	}

	/**
	 * 管理员修改资源，同时修改内容
	 * 
	 * @param news
	 * @return
	 */
	@RequestMapping(value = "/editResource", method = RequestMethod.POST)
	@ResponseBody
	public String editResource(Resource resource) {
		boolean flag = adminService.editResource(resource);

		News news = new News();
		news.setId(resource.getId());
		news.setNews_title(resource.getResource_name());
		if (flag) {
			adminService.edit(news);// 同时修改内容
			return "{\"flag\":true}";
		} else {
			return "{\"flag\":false}";
		}
	}

	/**
	 * 管理端查询资源
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryResource")
	@ResponseBody
	public Object queryResource(HttpServletRequest request, Resource resource) {
		// 与首页不同，显示全部，设置end为0
		// news.setEnd(0);
		// System.out.println(news.toString());
		List<Resource> li = adminService.queryResource(resource);
		// 记录本页页码
		// log.info(("li.size:"+li.size()));
		// log.info("requestPage:"+request.getParameter("page"));
		int page = Integer.parseInt(request.getParameter("page"));
		// log.info("page"+page);
		// 记录本页大小
		int rows = Integer.parseInt(request.getParameter("rows"));
		// log.info("rows"+rows);

		// 新建存储本页数据的list
		List<Resource> list = new ArrayList<Resource>();
		// 定义开始位置
		int start = (page - 1) * rows;
		// 定义结束位置
		int end = start + rows;
		if (end > li.size()) {
			end = li.size();
		}
		// 对本页进行赋值
		for (int i = start; i < end; i++) {
			list.add(li.get(i));
			// System.out.println(list.toString());
		}
		// 设置数据包
		Map<String, Object> map = new HashMap<String, Object>();
		// 对数据包中添加数据，total：表示数据总数（从数据库中查出来的）
		map.put("total", li.size());
		// 本页数据
		map.put("rows", list);
		return map;
	}
	/**
	 * 删除新闻
	 */
	@RequestMapping(value="/delNews")
	@ResponseBody
	public  Object delNews(HttpServletRequest request,HttpServletResponse response,News news) {
	
		String ids = request.getParameter("strid");
		String []str = ids.split(","); 
		System.out.println("ids:"+ids);
		class Message{
			private String info;
			public String getInfo() {
				return info;
			}
			public void setInfo(String info) {
				this.info = info;
			}
		}
		Message info = new Message();
		// 只要有一个删除失败，则退出
		for (int i = 0; i < str.length; i++) {
			news.setId(Integer.parseInt(str[i]));
			//获取src
			try {
			String src =FileTools.getFileSrc(userService.queryNews(news).get(0).getNews_content());
			System.out.println("str[i]:"+str[i]+"src:"+src);
			if (!(userService.delNews(str[i])&&FileTools.delFile(src))) {
				info.setInfo("删除失败");
				break;
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			info.setInfo("删除成功！");
		}
		return info;
	}
	/**
	 * 删除资源
	 */
	@RequestMapping(value="/delResource")
	@ResponseBody
	public  Object delResource(HttpServletRequest request,HttpServletResponse response,Resource resource) {
	
		String ids = request.getParameter("strid");
		String []str = ids.split(","); 
		System.out.println("ids:"+ids);
		class Message{
			private String info;
			public String getInfo() {
				return info;
			}
			public void setInfo(String info) {
				this.info = info;
			}
		}
		Message info = new Message();
		// 只要有一个删除失败，则退出
		for (int i = 0; i < str.length; i++) {
			resource.setId(Integer.parseInt(str[i]));
			//获取src
			try {
			String src =FileTools.getFileSrc(adminService.queryResource(resource).get(0).getResource_location());
			System.out.println("str[i]:"+str[i]+"src:"+src);
			if (!(adminService.delResource(str[i])&&FileTools.delFile(src))) {
				info.setInfo("删除失败");
				break;
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			info.setInfo("删除成功！");
		}
		return info;
	}
}
