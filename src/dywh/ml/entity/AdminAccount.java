package dywh.ml.entity;
/**
 * 管理员用户实体
 * @author ml
 *
 */
public class AdminAccount {

	private String id;//管理员ID,varchar(32)，主键
	private String password;//密码，varchar(32)
	private String name;//姓名,varchar(10)
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "AdminAccount [id=" + id + ", password=" + password + ", name=" + name + "]";
	}
	
	
}
