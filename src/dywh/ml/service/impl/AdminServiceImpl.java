package dywh.ml.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dywh.ml.entity.AdminAccount;
import dywh.ml.entity.News;
import dywh.ml.entity.Resource;
import dywh.ml.mapper.AdminMapper;
import dywh.ml.service.IAdminService;
@Service
public class AdminServiceImpl implements IAdminService {
	Logger log =LoggerFactory.getLogger(getClass());
	private AdminMapper adminMapper;
	@Autowired
	public void setAdminMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
	/**
	 * 管理员登录
	 */
	@Override
	public AdminAccount adminLogin(AdminAccount admin) {
		return adminMapper.adminLogin(admin);
	}
	/**
	 * 发布新闻
	 */
	@Override
	public boolean add(News news) {
		return adminMapper.add(news);
	}
	/**
	 * 发布资源
	 */
	@Override
	public boolean insertResource(Resource resource) {
		return adminMapper.insertResource(resource);
	}
	/**
	 *查询资源
	 */
	@Override
	public List<Resource> queryResource(Resource resource) {
		return adminMapper.queryResource(resource);
	}
	/**
	 * 编辑资源
	 * @param resource
	 * @return
	 */
	
	@Override
	public boolean editResource(Resource resource) {
		return adminMapper.editResource(resource);
	}
	/**
	 * 编辑新闻
	 */
	@Override
	public boolean edit(News news) {
		return adminMapper.edit(news);
	}
	/**
	 * 删除新闻
	 */
	@Override
	public boolean delResource(String string) {
		return adminMapper.delResource(string);
	}
	
	@Override
	public boolean add2(News news) {
		return adminMapper.add2(news);
	}
	@Override
	public Resource selectId(Resource resource) {
		return adminMapper.selectId(resource);
	}
	
	
	
}
