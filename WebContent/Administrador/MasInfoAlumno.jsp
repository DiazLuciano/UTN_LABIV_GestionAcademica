<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dominio.Alumno" %>
<%@ page import="Conecciones.UbicacionDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Informacion Alumno</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	
  	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  
  	<script>
	  $( function() {
	    $( "#Calendario" ).datepicker({
	    	changeMonth:true,
		changeYear:true,
		showButtonPanel:true,
	    })
	  })
  	</script>
</head>
<body>
<%
	Alumno alu = null;
	if(request.getAttribute("alumno")!=null)
	{
		alu = (Alumno)request.getAttribute("alumno");
	}

%>

	<div>
		<%@include file="Menu.jsp" %>
	</div>
		<div class="container">
			<h1 style="color:#F0F2F4;margin-top: 20px">Información Alumno</h1>
		</div>
		
		<div class="container" style="margin-top:20px">
			<div class="card" style="background:#F0F2F4">
				<div class="card-body">
					<form class="needs-validation" action="ServletAlumnos" method="post" novalidate>
						<div class="form-row">
							<div class="col-md-6 mb-3">
	 							<div class="form-group">
      								<label>Legajo</label>
      								<input readonly="readonly" name="txtLegajo" type="number" value="<%= alu.getLegajo() %>" class="form-control">
    							</div>
    						</div>
    			
			  				<div class="col-md-6 mb-3">
			      				<label for="validationCustom00">DNI</label>
			      				<input readonly="readonly" name="txtDNI" type="number" class="form-control" id="validationCustom00" placeholder="DNI" value="<%= alu.getDni() %>" required>
					      	
			    			</div>
    
						    <div class="col-md-6 mb-3">
						    	<label for="validationCustom01">Nombre y apellido</label>
						    	<input readonly="readonly" name="txtNombreApellido" type="text" class="form-control" id="validationCustom01" placeholder="Nombre" value="<%= alu.getNombre_apellido() %>" required>
		
						    </div>
						    
						    <div class="col-md-6 mb-3">
						    	<label for="validationCustom03" >Fecha Nacimiento</label>
								<input readonly="readonly" name="txtFnac" type="date" class="form-control" id="validationCustom03" value="<%= alu.getFecha_nac() %>" required>
						    </div>
						</div>

  					<div class="form-row">
					    <div class="col-md-6 mb-3">
					      <label for="validationCustom04">Dirección</label>
					      <input readonly="readonly" name="txtDireccion" type="text" class="form-control" id="validationCustom04" placeholder="Direccíon" value="<%= alu.getDireccion() %>"  required>
					    </div>

				    <div class="col-md-6 mb-3">	
				      <label>Provincia</label>
				      	<div class="container" >
				      			<input readonly="readonly"  type="text" class="form-control" id="validationCustom07"  value="<%= alu.getProvincia() %>"  required>
				    	</div>
						</div>
				    </div>
    
				    <div class="col-md-6 mb-3">
						<label>Localidades</label>
						<div class="container">
					    	<div class="container" >
				      			<input readonly="readonly"  type="text" class="form-control" id="validationCustom07"  value="<%= alu.getLocalidad() %>"  required>
				    		</div>
						</div>
					</div>
			
				    <div class="col-md-6 mb-3">
				      <label>Email</label>
				      <input readonly="readonly" type="text" class="form-control" id="validationCustom07"  value="<%= alu.getEmail() %>"  required>
				    </div>
				    
				    <div class="col-md-6 mb-3">
				      <label >Teléfono</label>
				      <input readonly="readonly" name="txtTelefono" type="tel" class="form-control" id="validationCustom08" placeholder="Teléfono" value="<%= alu.getTelefono() %>"  required>
				    </div>
				    <%
				     String estado="";
				    if(alu.getEstado()==1)
					{
						estado = "ALTA"; 		
					}
				    else
				    {
				    	estado = "BAJA";
				    }
				    %>
					<div class="col-2">
					  <label>Estado</label> <br>
					  <input readonly="readonly" name="txtEstado" type="tel" class="form-control" id="validationCustom09" placeholder="Teléfono" value="<%= estado %>" required>
					</div>
				</div>
      			
      		</form>
    	</div>
 	</div>
</div>	
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>