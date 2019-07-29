package dywh.ml.entity;
/**
 * 栏目实体
 * @author ml
 *
 */
public class Module {
	
	private int id;//栏目ID,int(10),主键
	private String module_name;//栏目名称,varchar(50)
	private String module_info;//栏目介绍(信息),text
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getModule_name() {
		return module_name;
	}
	public void setModule_name(String module_name) {
		this.module_name = module_name;
	}
	public String getModule_info() {
		return module_info;
	}
	public void setModule_info(String module_info) {
		this.module_info = module_info;
	}
	@Override
	public String toString() {
		return "Module [id=" + id + ", module_name=" + module_name + ", module_info=" + module_info + "]";
	}
	
	
	
	
}
