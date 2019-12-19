<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dominio.CursoReporte" %>
<%@ page import="Conecciones.CursoDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
  
  	<script type="text/javascript">
	    $(document).ready( function () {
	        $('#tabla_reporte').DataTable();
	    } );
    </script>
    <style type="text/css">
    	<jsp:include page="../css/Estilos.css"></jsp:include>
	</style>
</head>
<body>
<%
	ArrayList<CursoReporte> lista = null;
	if(request.getAttribute("listaReporte")!=null)
	{
		lista = (ArrayList <CursoReporte>)request.getAttribute("listaReporte");
	}
%>
 <div>
		<%@include file="Menu.jsp" %>
	</div>
	<div class="container">
			<h1 style="color:#F0F2F4;margin-top: 20px">Reporte</h1>
		</div>
		<div class="container" style="margin-top:20px">
		<div class="card" style="background:#F0F2F4">
		<div class="card-body">
			<form class="needs-validation" action="/TP_Final/ServletReporte" method="post" novalidate>
				 <div class="form-row">
				<div class="col-md-6 mb-3">	
							    <label> Semestre</label>
							    <div class="container" >
							     		<select style="margin-left:-15px" class="form-control" name="semestre" >
										<option value="1">1</option>
										<option value="2">2</option>
									</select>
								</div>
							</div>
			    <div class="col-md-6 mb-3">
			      <label>Año</label>
			      <input name="anio" maxlength="4" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number" class="form-control" placeholder="Año" required style="width:120px">
			      <div class="invalid-feedback">
			        Año inválido
			      </div>
			    </div>
			    <input type="submit" value="listar" name="btnListar" class="btn btn-success">
			    </div>
    		<div>
    <h2>Reporte</h2>
    <table id="tabla_reporte" class="table table-bordered table-sm" style="margin-top:20px;color:black">
		    <thead class="thead-dark">
		        <tr>
		        	<th scope="col">ID Curso</th>
		            <th scope="col">Materia</th>
		            <th scope="col">Legajo</th>
		            <th scope="col">Docente</th>
		            <th scope="col">Regular</th>
		            <th scope="col">Libre</th>  
		            <th scope="col">Total</th>  
		        </tr>
		    </thead>
    	<tbody>
    	<%
		 if(lista!=null)
		 	for (CursoReporte cur : lista)
		 	{
		%>
	         <tr>    
	            <td><%= cur.getIdcurso() %></td>	
				<td><%= cur.getCurso( )%></td>
				<td><%= cur.getLegajo_docente() %></td>
				<td><%= cur.getNombreApellidoDoc() %></td>
				<td><%= cur.getRegulares() %></td>
				<td><%= cur.getLibres() %></td>
				<td><%= cur.getTotal()%></td>
	        </tr>
	        <% } %>
    	</tbody>
</table>
</div>
   </form>
  </div>
</div>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>

</html>