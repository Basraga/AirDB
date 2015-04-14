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
import at.airdb.dao.ModelDAO;
import at.airdb.dao.TypeDAO;
import at.airdb.exceptions.AirDBServiceException;
import at.airdb.vo.Manufacturer;
import at.airdb.vo.Model;
import at.airdb.vo.Type;

@Path("manufacturers")	
public class AirDBService{

	@GET
	public List<Manufacturer> getAllManufacturers() throws AirDBServiceException{
		ManufacturerDAO manufacturerDAO = new ManufacturerDAO();
		try{
			return manufacturerDAO.getAllManufacturers();
		} catch (AirDBServiceException e){
			System.out.println(e.toString());
			return null;
		}
	}
	
	
	@GET
	@Path("/{manufacturerId}")
	public Response getManufacturerByManufacturerId(@PathParam("manufacturerId") int manufacturerId) {
		try {
			ManufacturerDAO manufacturerDAO = new ManufacturerDAO();
			Manufacturer manufacturer = manufacturerDAO.getManufacturerByManufacturerId(manufacturerId);
			return Response.ok().entity(manufacturer).build();
		} catch (Exception e) {
			System.out.println(e.toString());
			return Response.status(404).build();
		}
	}
	
	
	@GET
	@Path("/{manufacturerId}/types")
	public List<Type> getAllTypesByManufacturerId(@PathParam("manufacturerId") int manufacturerId) throws AirDBServiceException{
		TypeDAO typeDAO = new TypeDAO();
		try{
			return typeDAO.getAllTypesByManufacturerId(manufacturerId);
		} catch (AirDBServiceException e){
			System.out.println(e.toString());
			return null;
		}
	}
	
	@GET
	@Path("/{manufacturerId}/types/{typeId}/models")
	public List<Model> getAllModelsByTypeId(@PathParam("typeId") int typeId) throws AirDBServiceException{
		try{
			ModelDAO modelDAO = new ModelDAO();
			return modelDAO.getAllModelsByTypeId(typeId);
		} catch (AirDBServiceException e){
			System.out.println(e.toString());
			return null;
		}
	}
	
	@GET
	@Path("/{manufacturerId}/types/{typeId}/models/{modelId}")
	public Response getModelByModelId(@PathParam("modelId") int modelId) {
		try {
			ModelDAO modelDAO = new ModelDAO();
			Model model = modelDAO.getModelByModelId(modelId);
			return Response.ok().entity(model).build();
		} catch (Exception e) {
			System.out.println(e.toString());
			return Response.status(404).build();
		}
	}
	
	
	@GET
	@Path("/{manufacturerId}/types/{typeId}")
	public Response getTypeByTypeId(@PathParam("typeId") int typeId) {
		try {
			TypeDAO typeDAO = new TypeDAO();
			Type type = typeDAO.getTypeByTypeId(typeId);
			return Response.ok().entity(type).build();
		} catch (Exception e) {
			System.out.println(e.toString());
			return Response.status(404).build();
		}
	}
}