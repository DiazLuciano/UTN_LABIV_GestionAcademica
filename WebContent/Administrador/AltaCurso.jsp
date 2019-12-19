<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dominio.Alumno"%>
    <%@page import="dominio.Docente"%>
    <%@ page import="Conecciones.MateriasDao" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Cursos</title>
</head>
	
<%

	int id=0;
	if(request.getAttribute("idCurso")!=null)
	{
		id = (int)request.getAttribute("idCurso");
	}


	ArrayList<Alumno> listaAlumnos = null;
	if(request.getAttribute("listaA")!=null)
	{
		listaAlumnos = (ArrayList <Alumno> ) request.getAttribute("listaA");
	}
	
	ArrayList<Docente> listaDocentes = null;
	if(request.getAttribute("listaD")!=null)
	{
		listaDocentes = (ArrayList <Docente> ) request.getAttribute("listaD");
	}
%>
<body>
	<div>
		<%@include file="Menu.jsp" %>
	</div>
	
	<div class="container">
			<h1 style="color:#F0F2F4;margin-top: 20px">Cursos</h1>
		</div>
		
		<div class="container" style="margin-top:20px">
		<div class="card" style="background:#F0F2F4">
		<div class="card-body">
			<form class="needs-validation" action="ServletCursos" method="get" novalidate>
				<div class="form-row">
				<div class="col-md-6 mb-3">
	 				<div class="form-group">
	 				
      					<label for="disabledTextInput">ID Curso</label>
      					<input  name="txtID" readonly="readonly" type="text" value="<%= id %>" class="form-control" style="width:70px">
      			
    				</div>
    			</div> 	
	
		
				 <div class="col-md-6 mb-3">	
				      <label>Materias</label>
				      	<div class="container" >
				     		<select style="margin-left:-15px" class="form-control" name="Materias" >
							<%
								ArrayList<String> lista = MateriasDao.obtenerMaterias();
								for(String mat : lista){
							%>		
							<option><%= mat %></option>
							<%}%>	
						</select>
						</div>
				    </div>
				
				</div>
				 <div class="form-row">
				<div class="col-md-6 mb-3">
				<div class="form-group">
			    <label for="Semestre">Semestre</label>
			    <select class="form-control" id="Semestre" name="Semestre" style="width:70px">
			      <option>1</option>
			      <option>2</option>
			    </select>
			  </div>
			  </div>
			 
    <div class="col-md-6 mb-3">
      <label for="validationCustom04">Año</label>
      <input type="number" class="form-control" name="txtAno" id="validationCustom04" placeholder="Año" required style="width:120px">
      <div class="invalid-feedback">
        Año inválido
      </div>
    </div>
    <div class="col-md-6 mb-3">
<div class="container " style="margin-top:20px">
	<h2>Alumnos</h2>
		<table id="tabla_alumnos" class="table table-bordered table-dark" style="margin-top:20px;color:black;text-align:center">
		    <thead class="thead-dark">
		        <tr>
		            <th scope="col">Legajo</th>
		            <th scope="col">Nombre y Apellido</th>
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
				
				<td><%= alu.getLegajo()%> <input type="hidden" name="legajo" value="<%= alu.getLegajo() %>"></td>	
				<td><%= alu.getNombre_apellido()%></td>	
				<td><input name="rb<%= alu.getLegajo() %>" type="radio" class="<%=alu.getLegajo()%>"/></td>
				
		</tr>
		<% } %>
    	</tbody>
</table>
</div>
</div>
<div class="col-md-6 mb-3">
<div class="container " style="margin-top:20px">
	<h2>Profesores</h2>
		<table id="tabla_docentes" class="table table-bordered table-dark" style="margin-top:20px;color:black;text-align:center">
		    <thead class="thead-dark">
		        <tr>
		            <th scope="col">Legajo</th>
		            <th scope="col">Nombre y Apellido</th>
		            <th scope="col">Acciones</th>   
		        </tr>   
		    </thead>
    	<tbody>
    	
    	<%
		 if(listaDocentes!=null)
		 	for (Docente doc : listaDocentes)
		 	{
		%>
		
		<tr>
				
				<td><%= doc.getLegajo()%></td>	
				<td><%= doc.getNombre_apellido()%></td>	
				<td><input name="legajoDoc" type="radio" value="<%= doc.getLegajo() %>" /></td>
				
		</tr>
		<% } %>
    	</tbody>
</table>
</div>
</div>
    </div>
    <input type="hidden" name="hfAlumnos" id="hfAlumnos">
    <input class="btn btn-primary" name="btnGuardar" type="submit" onclick="obtenerAlumnos()" value="Guardar">
   </form>
  </div>
  
</div>
</div>



<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();

$(document).ready( function () {
    $('#tabla_alumnos').DataTable();
} );

$(document).ready( function () {
    $('#tabla_docentes').DataTable();
} );

function obtenerAlumnos(){
	var lista = '';
	$('#tabla_alumnos')
		.find('tr input:radio')
		.each(function(){
				if($(this).prop("checked")){
					lista += $(this).attr("class") + ',';
				}
			}
		);
	lista = lista.substring(0, lista.length -1); 
	$('#hfAlumnos').val(lista);
}
</script>		
<%
		
	if(request.getAttribute("estadoAgregarCurso")!=null)
	{
		boolean estadoM = (Boolean)request.getAttribute("estadoAgregarCurso");
		
		if (estadoM != false) 
		{
%>
		<script>
			swal("Agregado correctamente", "", "success").then((value) => {
				window.location.href = "/TP_Final/ServletCursos?Param=listar";
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