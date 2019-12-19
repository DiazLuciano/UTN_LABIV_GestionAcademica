<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dominio.Alumno"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Alumnos</title>
	<div>
		<%@include file="Menu.jsp" %>
	</div>
   	

  
  	<script type="text/javascript">
	    $(document).ready( function () {
	        $('#tabla_alumnos').DataTable();
	    } );
    </script>

</head>
<script>
	function ConfirmarBaja()
	{
		var result = confirm("¿Esta seguro que desea eliminar este registro?");
		if(respuesta == true)
			{
			return true;
			}
		else
			{
			return false;
			}
	}
	
	function eliminarAlumno(legajo)
	{
		swal({
			  title: "Estás seguro que desea dar de baja este alumno?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				 var btn = document.getElementById("btnEliminar" + legajo);
				 btn.click();
			  } else {
			    swal("Cancelado");
			  }
			});
	}
	
</script>
<body>

<%
	ArrayList<Alumno> listaAlumnos = null;
	if(request.getAttribute("listaA")!=null)
	{
		listaAlumnos = (ArrayList <Alumno> ) request.getAttribute("listaA");
	}
	
%>

<form action="ServletAlumnos" method="post">
	<div class="container" style="margin-top:50px">
	<div class="card" style="background:#F0F2F4">
		<div class="card-body">
		<div class="form-inline">
			<button type="submit" name="btnAgregar" class="btn btn-success" onclick="location='AltaAlumno.jsp'">+ Agregar alumno</button>
		</div>
	</div>
		
	<div class="container " style="margin-top:20px">
	<h2>Alumnos</h2>
		<table id="tabla_alumnos" class="table table-bordered table-dark" style="margin-top:20px;color:black;text-align:center">
		    <thead class="thead-dark">
		        <tr>
		            <th scope="col">Legajo</th>
		            <th scope="col">Nombre y Apellido</th>
		            <th scope="col">Email</th>
		            <th scope="col">Estado</th>
		            <th scope="col">Acciones</th>   
		        </tr>   
		    </thead>
    	<tbody>
    	
    	<%
		 if(listaAlumnos!=null)
		 	for (Alumno alu : listaAlumnos)
		 	{
		%>
		
		<tr>
				<form action="ServletAlumnos" method="post">
				<td><%= alu.getLegajo()%> <input type="hidden" name="legajo" value="<%= alu.getLegajo() %>"></td>	
				<td><%= alu.getNombre_apellido()%></td>	
				<td><%= alu.getEmail()%></td>	
				<td><%if(alu.getEstado()==1)
					{
						%>ALTA<%
					}
					else
					{
						%>BAJA<%
					}
					%>
				</td>
				<td> <% 
						String ver = "";
						if(alu.getEstado()==0)
							ver = "disabled";
						%>
					<input class="btn btn-danger btn-sm" type="submit" id="btnEliminar<%=alu.getLegajo()%>" name="btnEliminar" value="Eliminar" style="display:none"> 
					<input <%= ver %> class="btn btn-danger btn-sm" type="button" name="btnEliminar2" value="Eliminar" onclick="eliminarAlumno(<%=alu.getLegajo()%>);"> 
					<input class="btn btn-secondary btn-sm" type="submit" name="btnModificar" value="Modificar" >
					<input class="btn btn-info btn-sm" type="submit" name="btnInfo" value="+Info"/>
				</td>
			</form>
		</tr>
		<% } %>
    	</tbody>
</table>
</div>
</div>
</div>
</form>


</body>
</html>