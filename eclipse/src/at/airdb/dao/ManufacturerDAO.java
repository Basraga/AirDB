package at.airdb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import at.airdb.exceptions.AirDBServiceException;
import at.airdb.vo.Manufacturer;

public class ManufacturerDAO {
	public List<Manufacturer> getAllManufacturers() throws AirDBServiceException{
		try{
		List<Manufacturer> manufacturerList = new ArrayList<Manufacturer>();
		
		String sql = "SELECT * FROM manufacturers";
		PreparedStatement ps = getConnection().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if (!rs.first()){
			return manufacturerList;
		}
		
		while (!rs.isAfterLast()){
			Manufacturer manufacturer = new Manufacturer(rs.getString(2), rs.getInt(1));
			manufacturerList.add(manufacturer);
			rs.next();
		}
		
		return manufacturerList;
		}
		catch(Exception e){
			e.printStackTrace();
			throw new AirDBServiceException("ManufacturerDAO.getAllManufacturers() failed: " + e.getMessage());
		}
 	}
	
	private Connection getConnection() throws SQLException {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/airdb?user=AirDBuser&password=AirDBuser");
			return con;
		}
		catch(Exception e){
			e.printStackTrace();
			throw new SQLException(e);
		}
	}
}
