package at.airdb.vo;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement 
public class Model {

	private String name;
	private int id;
	private int crew_count;
	private int seat_count;
	private double length;
	private double weight;
	private double wingspan;
	private double cruisingspeed;
	private double maxspeed;
	private int maxrange;
	private String engines;
	private Type type;
	
	
	public Model(){}
	
	public Model(String name, int id, int crew_count, int seat_count, double length, double weight, double wingspan, double cruisingspeed, double maxspeed, int maxrange, String engines, Type type){
		this.name =name;
		this.id = id;
		this.crew_count =crew_count;
		this.seat_count = seat_count;
		this.length = length;
		this.weight = length;
		this.wingspan = wingspan;
		this.cruisingspeed = cruisingspeed;
		this.maxspeed = maxspeed;
		this.maxrange = maxrange;
		this.engines = engines;
		this.type = type;
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

	public int getCrew_count() {
		return crew_count;
	}

	public void setCrew_count(int crew_count) {
		this.crew_count = crew_count;
	}

	public int getSeat_count() {
		return seat_count;
	}

	public void setSeat_count(int seat_count) {
		this.seat_count = seat_count;
	}

	public double getLength() {
		return length;
	}

	public void setLength(double length) {
		this.length = length;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getWingspan() {
		return wingspan;
	}

	public void setWingspan(double wingspan) {
		this.wingspan = wingspan;
	}

	public double getCruisingspeed() {
		return cruisingspeed;
	}

	public void setCruisingspeed(double cruisingspeed) {
		this.cruisingspeed = cruisingspeed;
	}

	public double getMaxspeed() {
		return maxspeed;
	}

	public void setMaxspeed(double maxspeed) {
		this.maxspeed = maxspeed;
	}

	public int getMaxrange() {
		return maxrange;
	}

	public void setMaxrange(int maxrange) {
		this.maxrange = maxrange;
	}

	public String getEngines() {
		return engines;
	}

	public void setEngines(String engines) {
		this.engines = engines;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}
	
}
