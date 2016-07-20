package bean;

import java.io.Serializable;

public class Person implements Serializable{

	private static final long serialVersionUID = 1L;
	private String name = "unknow name";
	private String sex = "unknow sex";
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

}
