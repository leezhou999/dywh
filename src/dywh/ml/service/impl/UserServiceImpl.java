package dywh.ml.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dywh.ml.entity.News;
import dywh.ml.mapper.UserMapper;
import dywh.ml.service.IUserService;
@Service
public class UserServiceImpl implements IUserService {
	Logger log =LoggerFactory.getLogger(getClass());
	private UserMapper userMapper;
	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	/**查询资源
	 * 
	 * @param news
	 * @return
	 */
	@Override
	public List<News> queryNews(News news) {
		return userMapper.queryNews(news);
	}
	/**
	 * 获取记录数
	 **/
	@Override
	public int getCount(News news) {
		return userMapper.getCount(news);
	}
	@Override
	/**
	 * 删除新闻
	 */
	public boolean delNews(String string) {
		return userMapper.delNews(string);
	}
	
	
}
