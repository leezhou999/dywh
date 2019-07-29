package dywh.ml.entity;
/**
 * 新闻实体,网站所有新闻、资讯
 * @author ml
 *
 */
public class News {

	private int id;//新闻ID,int(10),主键
	private String news_title;//标题,varchar(50)
	private String news_author;//作者,varchar(10)
	private String news_summary;//概要,varchar(200)
	private String news_content;//内容,text
	private String news_time;//时间,timestamp
	private int module_id;//所属栏目,int(10),module表外键
	private int page_id;//页面位置
	
	private int start = 0;
	private int end = 8;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_author() {
		return news_author;
	}
	public void setNews_author(String news_author) {
		this.news_author = news_author;
	}
	public String getNews_summary() {
		return news_summary;
	}
	public void setNews_summary(String news_summary) {
		this.news_summary = news_summary;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getNews_time() {
		return news_time;
	}
	public void setNews_time(String news_time) {
		this.news_time = news_time;
	}
	public int getModule_id() {
		return module_id;
	}
	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public int getPage_id() {
		return page_id;
	}
	public void setPage_id(int page_id) {
		this.page_id = page_id;
	}
	@Override
	public String toString() {
		return "News [id=" + id + ", news_title=" + news_title + ", news_author=" + news_author + ", news_summary="
				+ news_summary + ", news_content=" + news_content + ", news_time=" + news_time + ", module_id="
				+ module_id + ", page_id=" + page_id + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
}
