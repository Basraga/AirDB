package at.airdb.vo;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement 
public class Type {

	
	private int id;
	private String name;
	private Manufacturer manufacturer;
	
	public Type(){}
	
	public Type(int id, String name, Manufacturer manufacturer){
		this.id = id;
		this.name =name;
		this.manufacturer = manufacturer;
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

	public Manufacturer getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(Manufacturer manufacturer) {
		this.manufacturer = manufacturer;
	}
	
}
