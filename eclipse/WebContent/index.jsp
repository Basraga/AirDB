<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AirDB</title>
<script src="./res/js/jquery-1.11.1.js"></script>
<link href="./res/css/bootstrap.css" rel="stylesheet">
<link href="./res/css/style.css" rel="stylesheet">
<script type="text/javascript" src="./res/js/bootstrap.js"></script>

<script type="text/javascript">
  
$(function()
		{
			loadallmanufacturers();	
			
			
			var manufacturerID;
			var manufacturerName;
			
			$(document).on("click", ".bManufacturers", function()
					{
						var id = $(this).attr("id");
						var name = $(".bManufacturerID" + id).html();
						
						manufacturerID = id;
						manufacturerName = name;
						
						$(".buttonareamanufacturer").fadeOut(350,function(){
							$(".infobar").slideDown(350);
							$(".backtypes").slideDown(350, function(){
								$(".buttonareatype").fadeIn(350);

								$(".infobarcontentmanufacturer").html(name);
								$(".infobarcontentmanufacturer").css({"display": "inline"});
								$(".backtypes").css({"display": "inline"});
							});
						});
						
						loadalltypes(id);
					});
			
			$(document).on("click", ".bTypes", function()
					{
						var id = $(this).attr("id");
						var name = $(".bTypeID" + id).html();

						$(".buttonareatype").fadeOut(500, function() {
							$(".backtypes").slideUp(0);
							$(".backmodels").slideDown(0);
							$(".infobarcontentmanufacturers").slideUp(0);

							$(".infobarcontenttype").html(manufacturerName + " " + name);
							$(".infobarcontenttype").css({"display": "inline"});
							$(".backmodels").css({"display": "inline"});
						});
						
						
						$.ajax({
							headers:{
								Accept:'application/json'
							},
							type: 'GET',
							url: 'http://localhost:8080/AirDB/rest/types/'+id,
							
							success: function(data)
							{
								loadallmodels(manufacturerID,id);
							},
							
							error: function(e)
							{
								console.log(e);
							}
						});
					});
			
			$(document).on("click", ".backtypes", function()
					{
						$(".infobar").slideUp(500);
						$(".backtypes").slideUp(500);
						$(".buttonareatype").fadeOut(500);
						$(".buttonareamanufacturer").fadeIn(500);
					});
			
			$(document).on("click", ".backmodels", function()
					{
						$(".backmodels").slideUp(0);
						$(".backtypes").slideDown(0);
						$(".buttonareatype").fadeIn(500);
					});
		}
)

function loadallmanufacturers()
{
	$.ajax({
		headers:{
			Accept:'application/json'
		},
		type: 'GET',
		url: 'http://localhost:8080/AirDB/rest/manufacturers',
		
		success: function(data)
		{
			//var data = {"Manufacturer": [{"id":"1","name":"Boeing"},{"id":"2","name":"Bombardier"},{"id":"3","name":"Embraer"},{"id":"4","name":"Airbus"},{"id":"5","name":"ATR"},{"id":"6","name":"Douglas"},{"id":"7","name":"McDonnell Douglas"},{"id":"8","name":"Lockheed"},{"id":"9","name":"Antonov"},{"id":"10","name":"Tupolev"}]};
			
			var code = "";
			code = "<div class='row-fluid'><div class='span12'>";
			
			for (i=0; i<data.manufacturer.length;i++)
			{
				code = code + "<button type='button' class='btn btn-primary bManufacturers bManufacturerID"+data.manufacturer[i].id+"' id='"+data.manufacturer[i].id+"''>"+data.manufacturer[i].name+"</button>";	
			}
			
			code = code + "</div></div>";
			
			$(".buttonareamanufacturer").html(code);
		},
		
		error: function(e)
		{
			console.log(e);
		}
	});
}

function loadalltypes(id)
{
	$.ajax({
		headers:{
			Accept:'application/json'
		},
		type: 'GET',
		url: 'http://localhost:8080/AirDB/rest/manufacturers/'+id+'/types',
		
		success: function(data)
		{
			var code = "";
			code = "<div class='row-fluid'><div class='span12'>";
			
			for (i=0; i<data.type.length;i++)
			{
				code = code + "<button type='button' class='btn btn-primary bTypes bTypeID"+data.type[i].id+"' id='"+data.type[i].id+"''>"+data.type[i].name+"</button>";	
			}
			
			code = code + "</div></div>";
			
			$(".buttonareatype").html(code);
		},
		
		error: function(e)
		{
			console.log(e);
		}
	});
}
	
function loadallmodels(manufacturerID, typeID)
{
	$.ajax({
		headers:{
			Accept:'application/json'
		},
		type: 'GET',
		url: 'http://localhost:8080/AirDB/rest/manufacturers/'+id+'/types',
		
		success: function(data)
		{
			var code = "";
			code = "<div class='row-fluid'><div class='span12'>";
			
			for (i=0; i<data.type.length;i++)
			{
				code = code + "<button type='button' class='btn btn-primary bTypes bTypeID"+data.type[i].id+"' id='"+data.type[i].id+"''>"+data.type[i].name+"</button>";	
			}
			
			code = code + "</div></div>";
				
			$(".buttonareatype").html(code);
		},
			
		error: function(e)
		{
			console.log(e);
		}
	});
}

</script>


</head>

<body>
<div id="header">
	</br>
	</br>
	<img src="./res/img/Logo.png" alt="AirDB" width="1105" height="200">
</div>

<div class="row infobarrow">
	<div class="col-md-3">
		<div class="backdiv">
			<button type='button' class='btn btn-default back backtypes'><span class="glyphicon glyphicon-arrow-left backarrow" aria-hidden="true"> </span>back</button>
			<button type='button' class='btn btn-default back backmodels'><span class="glyphicon glyphicon-arrow-left backarrow" aria-hidden="true"> </span>back</button>
		</div>
	</div>
	<div class="col-md-6">	
		<div class="infobar">
			<div class="infobarcontentmanufacturer infobarcontent"></div>
			<div class="infobarcontenttype infobarcontent"></div>
		</div>
	</div>
	<div class="col-md-3"></div>
</div>

<div class="container-fluid">
	<div class="row"></br></div>
	
	<div class="buttonareamanufacturer contentarea"></div>
	<div class="buttonareatype contentarea"></div>
	<div class="modeldataarea contentarea"></div>
	
</div>

</body>
</html>