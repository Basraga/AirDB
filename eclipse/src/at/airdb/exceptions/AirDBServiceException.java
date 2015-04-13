package at.airdb.exceptions;

public class AirDBServiceException extends Exception {

	private String name;
	
	public AirDBServiceException(String name)
	{
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
