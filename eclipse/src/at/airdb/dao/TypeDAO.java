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
import at.airdb.vo.Type;

public class TypeDAO {
	public List<Type> getAllTypes() throws AirDBServiceException{
		try{
		List<Type> typeList = new ArrayList<Type>();
		
		String sql = "SELECT * FROM types";
		PreparedStatement ps = getConnection().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if (!rs.first()){
			return typeList;
		}
		
		ManufacturerDAO manufacturerDAO = new ManufacturerDAO();
		while (!rs.isAfterLast()){
			Type type = new Type(rs.getString("name"), rs.getInt("id"), manufacturerDAO.getManufacturerById(rs.getInt("manufacturer"))); //use right column in right spot
			typeList.add(type);
			rs.next();
		}
		
		return typeList;
		}
		catch(Exception e){
			e.printStackTrace();
			throw new AirDBServiceException("TypeDAO.getAllTypes() failed: " + e.getMessage());
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
