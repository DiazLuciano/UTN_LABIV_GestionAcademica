<%@page import="jdk.management.resource.internal.TotalResourceContext"%>
<%@page import="com.sun.javafx.collections.ListListenerHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dominio.Docente" %>
<%@ page import="dominio.AlumnoXcurso" %>
<%@ page import="dominio.Curso" %>
<%@ page import="Conecciones.MateriasDao" %>
<%@ page import="Conecciones.AlumnoDao" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>TusCursos</title>
	<div>
		<%@include file="MenuProfesor.jsp" %>
	</div>
   	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
  
  	<script type="text/javascript">
	    $(document).ready( function () {
	        $('#tabla_TusCursos').DataTable();
	    } );
    </script>
    
    <style type="text/css">
    	<jsp:include page="../css/Estilos.css"></jsp:include>
	</style>

</head>	
<body >
<%
	int legajoDoc=0;
/*	if(request.getAttribute("legajoDoc")!=null)
	{
		legajoDoc = (int)request.getAttribute("legajoDoc");		
	}
*/
	if(sesion.getAttribute("legajoDoc") != null){
		legajoDoc = (int)sesion.getAttribute("legajoDoc");
	}
	
	ArrayList<AlumnoXcurso> listaAlumnos = null;
	if(request.getAttribute("listaAlumnos")!=null)
	{
		listaAlumnos = (ArrayList <AlumnoXcurso> ) request.getAttribute("listaAlumnos");
	}
	String btnGuardarOk = "disabled";
	
	int alumnosXcurso = 0;
	if(request.getAttribute("totalalumnosxcurso") != null){
		alumnosXcurso = (int)request.getAttribute("totalalumnosxcurso");
	}
	int totalAlumnos= 0;
	if(request.getAttribute("totalalumnos") != null){
		totalAlumnos = (int)request.getAttribute("totalalumnos");
	}

%>
		<div class="container">
			<h1 style="color:#F0F2F4;margin-top: 20px">Cargar Notas</h1>
		</div>
		
		<div class="container" style="margin-top:20px">
			<div class="card" style="background:#F0F2F4">
				<div class="card-body">
					<form class="needs-validation" action="/TP_Final/ServletNotas" method="post" novalidate>
						<div class="row">
		
						 	<div class="col-md-6 mb-3">	
							    <label> Tus Materias</label>
							    <div class="container" >
							     		<select style="margin-left:-15px" class="form-control" name="tusmaterias" >
										<%
											ArrayList<Curso> lista = MateriasDao.obtenerMateriasUno(legajoDoc);
											for(Curso mat : lista){
										%>		
										<option value="<%= mat.getId()%>">Curso <%=mat.getId()%> - <%= mat.getMateria() %> - <%= mat.getAño()%> - Semestre <%= mat.getSemestre()%></option>
										<%}%>	
									</select>
								</div>
							</div>
							
						  	<div class="col-sm-2" style="margin-top:30px">
						  		<input type="submit" class="btn btn-success" name="btnListar" value="Listar Alumnos"/>
						  	</div>
						  	
						</div>
						<div class="row">
							<div class="form-group ml-4 mr-5">
			  					Tu legajo:  
			  					<input type="text" class="form-control" style="width:60px; margin-left: 10px " readonly="readonly" name="tulegajo" value="<%=legajoDoc%>"/>
			  				</div>
							<div class="form-group mr-5">
		      					Total de tus Alumnos:
		      					<input readonly="readonly" type="text" value="<%= totalAlumnos %>" class="form-control" style="width:50px">
		    				</div>
		    				
		    				<div class="form-group mr-5">
		      					Total Alumnos del curso:
		      					<input readonly="readonly" type="text" value="<%= alumnosXcurso %>" class="form-control" style="width:50px">
							</div>
						</div>
				
    				
		<h2 style="color:#F0F2F4">Alumnos</h2>
			<div class="container" style="margin-top:20px">
	
        <%
			if(listaAlumnos!=null){
				if(listaAlumnos.size() > 0)
					btnGuardarOk = "";
		%>
		<table id="tabla_TusCursos" name="alumnos_x_curso" class="table table-bordered table-dark" style="color:black">
		    <thead class="thead-dark">
		        <tr>
		            <th scope="col">Legajo</th>	
		            <th scope="col">Nombre y Apellido</th>
		            <th scope="col">1°Parcial</th>
		            <th scope="col">2°Parcial</th>
		            <th scope="col">1°Recuperatorio</th>
		            <th scope="col">2°Recuperatorio</th>  
		            <th scope="col">Estado</th>   
		        </tr>
		    </thead>
    	<tbody>
	        <%
	        		
					String listaLegajos = "";
		 			for (AlumnoXcurso alu : listaAlumnos)
		 				{
		 					listaLegajos += alu.getLegajo() + ",";
			%>
	        <tr>
	        
				<td><%= alu.getLegajo()%></td>	
				<td><%= alu.getNombreApe()%></td>	
				<td><input maxlength="2" min="1" max="10" name="nota1<%=alu.getLegajo() %>" type="number" style="width:40px" value="<%= alu.getNota1()%>" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" /></td>
	            <td><input maxlength="2" min="1" max="10" name="nota2<%=alu.getLegajo() %>" type="number" style="width:40px" value="<%= alu.getNota2()%>" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></td>
	            <td><input maxlength="2" min="1" max="10" name="recu1<%=alu.getLegajo() %>" type="number" style="width:40px" value="<%= alu.getRecu1()%>" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></td>
	            <td><input maxlength="2" min="1" max="10" name="recu2<%=alu.getLegajo() %>" type="number" style="width:40px" value="<%= alu.getRecu2()%>" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></td>
	            <td><select  name="Situacion<%=alu.getLegajo() %>" style="width:100px">
					<option 
					<% if (alu.getSituacion().equals("REGULAR")) %>selected
					>REGULAR</option>
					<option 
					<% if (alu.getSituacion().equals("LIBRE")) %>selected
					>LIBRE</option>
			    </select></td>			
			</tr>        
	        <% }
		 		if(listaLegajos.length() >= 1)
		 			listaLegajos = listaLegajos.substring(0, listaLegajos.length() - 1);
		 		System.out.println(listaLegajos);
		 	%>
    	</tbody>
	</table>
 	<input type="hidden" name="hListaLegajos" value="<%=listaLegajos %>"/>
 	<%
 	}else
 	{
 		btnGuardarOk = "disabled";
 	}
 	%>
	<input type="submit" <%=btnGuardarOk %> class="btn btn-primary" name="btnGuardarNotas" value="Guardar" style="text-align:right">
</div>
</form>
</div>
</div>
</div>
<%
if(request.getAttribute("estadoNotas")!=null)
	{
		boolean estadoM = (Boolean)request.getAttribute("estadoNotas");
		
		if (estadoM != false) 
		{
%>
		<script>
			swal("Agregado correctamente", "", "success").then((value) => {
				window.location.href = "/TP_Final/Profesores/TusCursos.jsp";
			});
		</script><%
			}
			else
		{
			%><script>swal("No se pudo agregar", "", "error");</script><%
		}
	}
%>
</body>
</html>