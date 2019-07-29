package dywh.ml.test;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dywh.ml.entity.News;
import dywh.ml.mapper.UserMapper;
import dywh.ml.util.FileTools;

public class UserUnitTest extends BaseTest {
	Logger log = LoggerFactory.getLogger(getClass());
	@Resource
	private UserMapper userMapper;

	@Test
	public void getText() {
		News news = new News();
		news.setId(6);
		List<News> list = userMapper.queryNews(news);
		news = list.get(0);
		String news_content = news.getNews_content();
		System.out.println("news_content" + news_content);

		if (news_content.length() > 20) {//获取text字段的string值
			String filePath = FileTools.getFileSrc(news_content);//正则表达式匹配text字段中src的值
			System.out.println("length:" + filePath.length());
			FileTools.delFile(filePath);//文件流操作
		} else {
			System.out.println("文件src不存在");
		}

	}
	@Test
	public void getListIndex_01() {
		News news_01 = new News();
		List<News> list_index_01 = new ArrayList<>();
		news_01.setModule_id(1);
		news_01.setNews_title("怪：");
		list_index_01 = userMapper.queryNews(news_01);
		
		for(News n2:list_index_01) {
			System.out.println("list_index_01:"+n2.toString());
		}
	}

}
