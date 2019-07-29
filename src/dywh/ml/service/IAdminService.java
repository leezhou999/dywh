package dywh.ml.service;

import java.util.List;

import dywh.ml.entity.AdminAccount;
import dywh.ml.entity.News;
import dywh.ml.entity.Resource;

/**
 * 管理员service
 * @author ml
 *
 */
public interface IAdminService {
	/**
	 * 管理员登录
	 */
	public AdminAccount adminLogin(AdminAccount admin);
	/**
	 * 
	 * @param news
	 * @return
	 */
	public boolean add(News news);
	/**
	 * 
	 * @param news
	 * @return
	 */
	public boolean add2(News news);
	/**
	 * 添加资源
	 * @param resource
	 * @return
	 */
	
	public boolean insertResource(Resource resource);
	/**
	 * 查询资源
	 * @param resource
	 * @return
	 */
	public List<Resource> queryResource(Resource resource);
	/**
	 * 编辑资源
	 * @param resource
	 * @return
	 */
	public boolean editResource(Resource resource);
	/**
	 * 编辑新闻
	 * @param news
	 * @return
	 */
	public boolean edit(News news);
	/**
	 * 删除新闻
	 * @param string
	 * @return
	 */
	public boolean delResource(String string);
	/**
	 * id回显
	 */
	public Resource selectId(Resource resource);
}
