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
import at.airdb.dao.TypeDAO;
import at.airdb.exceptions.AirDBServiceException;
import at.airdb.vo.Manufacturer;
import at.airdb.vo.Type;

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
	@Path("/{manufacturerId}")
	public Response getManufacturerById(@PathParam("manufacturerId") int manufacturerId) {
		try {
			ManufacturerDAO dao = new ManufacturerDAO();
			Manufacturer manufacturer = dao.getManufacturerById(manufacturerId);
			return Response.ok().entity(manufacturer).build();
		} catch (Exception e) {
			System.out.println(e.toString());
			return Response.status(404).build();
		}
	}
	
	
	@GET
	@Path("/{manufacturerId}/types")
	public List<Type> getAllTypes(@PathParam("manufacturerId") int manufacturerId) throws AirDBServiceException{
		TypeDAO dao = new TypeDAO();
		try{
			return dao.getAllTypesByManufacturerId(manufacturerId);
		} catch (AirDBServiceException e){
			System.out.println(e.toString());
			return null;
		}
	}
	
	@GET
	@Path("/{manufacturerId}/types/{typeId}")
	public Response getTypeById(@PathParam("manufacturerId") int manufacturerId, @PathParam("typeId") int typeId){
		try{
			TypeDAO dao = new TypeDAO();
			Type type = dao.getTypeById(typeId);
			return Response.ok().entity(type).build();
		} catch (Exception e){
			System.out.println(e.toString());
			return Response.status(404).build();
		}
	}
	
	
}