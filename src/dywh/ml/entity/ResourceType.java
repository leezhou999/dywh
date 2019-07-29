package dywh.ml.entity;
/**
 * 资源类型表，包括图片、音频、视频等。
 * 
 * @author ml
 *
 */
public class ResourceType {

	private int id;//资源类型ID,主键,int(10)
	private String type_name;//资源类型名称,varchar(10)
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	@Override
	public String toString() {
		return "ResourceType [id=" + id + ", type_name=" + type_name + "]";
	}
	
}
