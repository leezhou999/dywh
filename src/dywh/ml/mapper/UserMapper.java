package dywh.ml.mapper;

import java.util.List;

import javax.jws.soap.SOAPBinding.Use;

import dywh.ml.entity.News;

public interface UserMapper {
	/**查询资源
	 * 
	 * @param news
	 * @return
	 */
	public List<News> queryNews(News news);
	/**
	 * 获取记录数
	 **/
	public int getCount(News news);
	/**
	 * 删除新闻
	 * @param string
	 * @return
	 */
	public boolean delNews(String string);
}
