package at.airdb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import at.airdb.exceptions.AirDBServiceException;
import at.airdb.vo.Model;

public class ModelDAO {
	
	public List<Model> getAllModels() throws AirDBServiceException{
		try{
		List<Model> modelList = new ArrayList<Model>();
		
		String sql = "SELECT * FROM models";
		PreparedStatement ps = getConnection().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if (!rs.first()){
			return modelList;
		}

		while (!rs.isAfterLast()){
			Model model = new Model(rs.getInt("id"), rs.getString("name"), rs.getInt("crew_count"), rs.getInt("seat_count"), rs.getDouble("length"), rs.getDouble("height"), rs.getDouble("wingspan"), rs.getDouble("cruisingspeed"), rs.getDouble("maxspeed"), rs.getInt("maxrange"), rs.getString("engines"));
			modelList.add(model);
			rs.next();
		}
		
		return modelList;
		}
		catch(Exception e){
			e.printStackTrace();
			throw new AirDBServiceException("ModelDAO.getAllModels() failed: " + e.getMessage());
		}
 	}
	
	
	public Model getModelById(int modelId) throws AirDBServiceException {
		try{
			String sql = "Select * from models where id=" + modelId;
			PreparedStatement ps = getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (!rs.first()) {
				return null;
			}
			return new Model(rs.getInt("id"), rs.getString("name"), rs.getInt("crew_count"), rs.getInt("seat_count"), rs.getDouble("length"), rs.getDouble("height"), rs.getDouble("wingspan"), rs.getDouble("cruisingspeed"), rs.getDouble("maxspeed"), rs.getInt("maxrange"), rs.getString("engines"));
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new AirDBServiceException("ModelDAO.getModelById(int modelId) failed: " + e.getMessage());
		}
	}
	
	
	public List<Model> getAllModelsByTypeId(int typeId) throws AirDBServiceException {
		try{
			List<Model> modelList = new ArrayList<Model>();
			String sql = "Select * from models where type=" + typeId;
			PreparedStatement ps = getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (!rs.first()) {
				return null;
			}
			
			while (!rs.isAfterLast()){
				Model model = new Model(rs.getInt("id"), rs.getString("name"), rs.getInt("crew_count"), rs.getInt("seat_count"), rs.getDouble("length"), rs.getDouble("height"), rs.getDouble("wingspan"), rs.getDouble("cruisingspeed"), rs.getDouble("maxspeed"), rs.getInt("maxrange"), rs.getString("engines"));
				modelList.add(model);
				rs.next();
			}
			return modelList;
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new AirDBServiceException("ModelDAO.getModelByTypeId(int typeId) failed: " + e.getMessage());
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
