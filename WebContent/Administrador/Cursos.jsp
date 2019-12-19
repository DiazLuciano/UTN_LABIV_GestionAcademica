<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dominio.Curso"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cursos</title>
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
	
	function eliminarCurso(legajo)
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
	ArrayList<Curso> listaCursos = null;
	if(request.getAttribute("listaC")!=null)
	{
		listaCursos = (ArrayList <Curso> ) request.getAttribute("listaC");
	}
	
%>

<form action="ServletCursos" method="get">
	<div class="container" style="margin-top:50px">
	<div class="card" style="background:#F0F2F4">
		<div class="card-body">
		<div class="form-inline">
			<button type="submit" name="btnAgregar" class="btn btn-success" onclick="location='AltaCurso.jsp'">+ Agregar curso</button>
		</div>
	</div>
		
	<div class="container " style="margin-top:20px">
	<h2>Cursos</h2>
		<table id="tabla_alumnos" class="table table-bordered table-dark" style="margin-top:20px;color:black;text-align:center">
		    <thead class="thead-dark">
		        <tr>
		            <th scope="col">ID</th>
		            <th scope="col">Materia</th>
		            <th scope="col">Semestre</th>
		            <th scope="col">Año</th>
		            <th scope="col">Legajo Docente</th>
		            <th scope="col">Estado</th>
		            <th scope="col">Acciones</th>   
		        </tr>   
		    </thead>
    	<tbody>
    	
    	<%
		 if(listaCursos!=null)
		 	for (Curso cur : listaCursos)
		 	{
		%>
		
		<tr>
				
				<td><%= cur.getId()%> <input type="hidden" name="legajo" value="<%= cur.getId() %>"></td>	
				<td><%= cur.getMateria() %></td>	
				<td><%= cur.getSemestre() %></td>	
				<td><%= cur.getAño() %></td>
				<td><%= cur.getLegajoDoc() %></td>
				<td><%if(cur.getEstado()==1)
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
						if(cur.getEstado()==0)
							ver = "disabled";
						%>
					<input class="btn btn-danger btn-sm" type="submit" id="btnEliminar<%=cur.getId()%>" name="btnEliminar" value="Eliminar" style="display:none"> 
					<input <%= ver %> class="btn btn-danger btn-sm" type="button" name="btnEliminar2" value="Eliminar" onclick="eliminarCurso(<%=cur.getId()%>);"> 
				</td>
			
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