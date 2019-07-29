package dywh.ml.entity;
/**
 * 资源实体
 * @author ml
 *
 */
public class Resource {

	private int id;//资源ID,int(10),主键
	private String resource_name;//资源名称,varchar(50)
	private String resource_author;//发布作者,varchar(10)
	private String resource_summary;//资源概要,varchar(200)
	private String resource_location;//资源地址,varchar(200)
	private String resource_time;//时间,timestamp
	private int module_id;//资源所属栏目,int(10),module表外键
	private int resource_type;//资源类型,int(10),resource_type表外键
	private int page_id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getResource_name() {
		return resource_name;
	}
	public void setResource_name(String resource_name) {
		this.resource_name = resource_name;
	}
	public String getResource_author() {
		return resource_author;
	}
	public void setResource_author(String resource_author) {
		this.resource_author = resource_author;
	}
	public String getResource_summary() {
		return resource_summary;
	}
	public void setResource_summary(String resource_summary) {
		this.resource_summary = resource_summary;
	}
	public String getResource_location() {
		return resource_location;
	}
	public void setResource_location(String resource_location) {
		this.resource_location = resource_location;
	}
	public String getResource_time() {
		return resource_time;
	}
	public void setResource_time(String resource_time) {
		this.resource_time = resource_time;
	}
	public int getModule_id() {
		return module_id;
	}
	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}
	public int getResource_type() {
		return resource_type;
	}
	public void setResource_type(int resource_type) {
		this.resource_type = resource_type;
	}
	public int getPage_id() {
		return page_id;
	}
	public void setPage_id(int page_id) {
		this.page_id = page_id;
	}
	@Override
	public String toString() {
		return "Resource [id=" + id + ", resource_name=" + resource_name + ", resource_author=" + resource_author
				+ ", resource_summary=" + resource_summary + ", resource_location=" + resource_location
				+ ", resource_time=" + resource_time + ", module_id=" + module_id + ", resource_type=" + resource_type
				+ ", page_id=" + page_id + "]";
	}
	
	
	
	
}
