<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Task Service</title>
<script src="./res/js/jquery-1.11.1.js"></script>
<link href="./res/css/bootstrap.css" rel="stylesheet">
<link href="./res/css/style.css" rel="stylesheet">
<script type="text/javascript" src="./res/js/bootstrap.js"></script>
<script type="text/javascript">

	$(function()
			{
				loadalltasks();	
				
						
				$(document).on("click", ".updatebutton", function()
				{
					var id = $(this).attr("id");
					var name = $("#input" + id).val();
					
					var task = {};
					task.id = id;
					task.name = name;
					
					$.ajax({
						headers:{
							Accept:'application/json'
						},
						contentType: 'application/json',
						type: 'PUT',
						url: 'http://localhost:8080/REST_tasks_TC/rest/tasks/'+id,
						data: JSON.stringify(task),
						
						success: function(data)
						{
							loadalltasks();
							$("updatechecked"+id).css("display: block");
						},
						
						error: function(e)
						{
							console.log(e);
						}
					});
				});
				
				$(document).on("click", ".deletebutton", function()
				{
					var id = $(this).attr("id");
					
					$.ajax({
						headers:{
							Accept:'application/json'
						},
						type: 'DELETE',
						url: 'http://localhost:8080/REST_tasks_TC/rest/tasks/'+id,
						
						success: function(data)
						{
							loadalltasks();
						},
						
						error: function(e)
						{
							console.log(e);
						}
					});
				});
				
				$(document).on("click", ".insertbutton", function()
				{
					var id = $(this).attr("id");
					var name = $("#insert").val();
					
					var task = {};
					task.id = id;
					task.name = name;
					
					$.ajax({
						headers:{
							Accept:'application/json'
						},
						contentType: 'application/json',
						type: 'POST',
						url: 'http://localhost:8080/REST_tasks_TC/rest/tasks',
						data: JSON.stringify(task),
						
						success: function(data)
						{
							loadalltasks();							
						},
						
						error: function(e)
						{
							console.log(e);
						}
					});
				});
		}
	)
	
	function loadalltasks()
	{
		$.ajax({
			headers:{
				Accept:'application/json'
			},
			type: 'GET',
			url: 'http://localhost:8080/REST_tasks_TC/rest/tasks',
			
			success: function(data)
			{
				var code = "";
				for (i=0; i<data.task.length;i++)
				{
					code = code + "<tr><td><div class='input-group'><input type='text' class='form-control' id='input" + data.task[i].id +
					"' value='"+ data.task[i].name +"'><span class='input-group-addon'><span class='glyphicon glyphicon-ok'  id='updatechecked"+data.task[i].id+"'></span></span></div></td><td><button type='button' id="+data.task[i].id+
					" class='btn btn-primary updatebutton'>Update</button></td><td><button type='button' id="+data.task[i].id+
					" class='btn btn-danger deletebutton'>Delete</button></td></tr>";	
				}
				code = code + "<tr><td><input type='text' class='form-control' id='insert'></td><td><button type='button' class='btn btn-success insertbutton'>Add Task</button></td><td></td></tr>";
				
				$("#tasktablerow").html(code);
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
	</br>
	<div id="header-text"><b>Task-Service</b></div>
</div>

<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-5 centered">
		<table class="table table-hover">
  			<thead>
  				<tr>
  					<th id="tableheader">Task-Name</th>
  				</tr>
  			</thead>
  			<tbody id="tasktablerow">
  			</tbody>
		</table>
	</div>
	<div class="col-md-3"></div>
</div>
	
</body>
</html>