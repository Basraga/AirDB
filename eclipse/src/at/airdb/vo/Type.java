package at.airdb.vo;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement 
public class Type {

	
	private int id;
	private String name;
	
	public Type(){}
	
	public Type(int id, String name){
		this.id = id;
		this.name =name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
