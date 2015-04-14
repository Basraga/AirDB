package at.airdb.vo;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement 
public class Type {

	private String name;
	private int id;
	private Manufacturer manufacturer;
	
	public Type(){}
	
	public Type(String name, int id, Manufacturer manufacturer){
		this.name =name;
		this.id = id;
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
