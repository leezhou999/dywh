package dywh.ml.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dywh.ml.entity.News;
import dywh.ml.mapper.AdminMapper;
import dywh.ml.mapper.UserMapper;

public class AdminUnitTest extends BaseTest {
	Logger log = LoggerFactory.getLogger(getClass());
	@Resource
	private AdminMapper adminMapper;
	@Resource
	private UserMapper userMapper;
	
	/**
	 * 增、删、改、查 测试
	 */
	
	@Test
	public void test() {
		String ids="22,22,21,";
		String []id = ids.split(",");
		for(int i=0;i<id.length;i++) {
			System.out.println(id[i]);
		}
	}
	@Test
	public void genRandomNum(){  
	      int  maxNum = 36;  
	      int i;  
	      int count = 0;  
	      char[] str = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',  
	        'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',  
	        'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };      
	      StringBuffer pwd = new StringBuffer("");  
	      Random r = new Random();  
	      while(count < 8){  
	       i = Math.abs(r.nextInt(maxNum));     
	       if (i >= 0 && i < str.length) {  
	        pwd.append(str[i]);  
	        count ++;  
	       }  
	      }  
	      System.out.println(pwd.toString());  
	    } 
	@Test
	public void addNews() {
		News new1 = new News();
		new1.setId(1);
		//new1.setModule_id(1);
		
		List<News> list =new ArrayList<>();
		list = userMapper.queryNews(new1);
		for(News n:list) {
			System.out.println(n.toString());
		}
	}
	@Test
	public void queryResource() {
		dywh.ml.entity.Resource resource =new dywh.ml.entity.Resource();
		List<dywh.ml.entity.Resource> list = new ArrayList<>();
/*		resource.setModule_id(1);
*/		list = adminMapper.queryResource(resource);
		for(dywh.ml.entity.Resource r:list) {
			System.out.println(r.toString());
		}
		
	}
}

