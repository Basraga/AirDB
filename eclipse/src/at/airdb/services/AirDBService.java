package at.airdb.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

import at.airdb.dao.ManufacturerDAO;
import at.airdb.exceptions.AirDBServiceException;
import at.airdb.vo.Manufacturer;

@Path("manufacturers")	
public class AirDBService{

	@GET
	public List<Manufacturer> getAllManufacturers() throws AirDBServiceException{
		ManufacturerDAO dao = new ManufacturerDAO();
		try{
			return dao.getAllManufacturers();
		} catch (AirDBServiceException e){
			System.out.println(e.toString());
			return null;
		}
	}
	
	
	@GET
	@Path("/{id}")
	public Response getTaskById(@PathParam("id") int paramid) {
		try {
			ManufacturerDAO DAO = new ManufacturerDAO();
			Manufacturer manufacturer = DAO.getManufacturerById(paramid);
			return Response.ok().entity(manufacturer).build();
		} catch (Exception e) {
			System.out.println(e.toString());
			return Response.status(404).build();
		}
	}
}