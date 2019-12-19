<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="dominio.Alumno" %>
<%@ page import="Conecciones.UbicacionDao" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html >
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Alta Alumno</title>
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
	int leg=0;
	if(request.getAttribute("legajoAgregar")!=null)
	{
		leg = (int)request.getAttribute("legajoAgregar");	
	}

%>
		<div>
			<%@include file="Menu.jsp" %>
		</div>
		<div class="container">
			<h1 style="color:#F0F2F4;margin-top: 20px">Formulario Alumno</h1>
		</div>
		<div class="container" style="margin-top:20px">
			<div class="card" style="background:#F0F2F4">
				<div class="card-body">
					<form class="needs-validation" action="ServletAlumnos" method="post" novalidate>
					
						<div class="form-row">
						
							<div class="col-md-6 mb-3">
	 							<div class="form-group">
      								<label for="disabledTextInput">Legajo</label>
      									<input  name="txtLegajo" readonly="readonly" type="text" id="disabledTextInput" value="<%= leg %>" class="form-control" placeholder="">
					    		</div>
					    	</div>
    			
						    <div class="col-md-6 mb-3">
						      	<label for="validationCustom00">DNI</label>
						     		<input maxlength="8" name="txtDNI" type="number" class="form-control" id="validationCustom00" placeholder="12345678" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
						      	<div class="invalid-feedback">
						        	DNI inv�lido
						      	</div>
						    </div>
    			
						    <div class="col-md-6 mb-3">
						      <label for="validationCustom01">Nombre y apellido</label>
						      	<input name="txtNombreApellido" type="text" class="form-control" id="validationCustom01" placeholder="Nombre" required>
						      	<div class="invalid-feedback">
						        	Nombre/apellido inv�lido
						      	</div>
						    </div>
						    
						    <div class="col-md-6 mb-3">
						    	<label for="validationCustom02" >Fecha Nacimiento</label>
									<input name="txtFnac" type="date" class="form-control" id="validationCustom03" required>
						        <div class="invalid-feedback">
						        Fecha inv�lida
						      	</div>
						   </div>
					</div>

  				<div class="form-row">
				    <div class="col-md-6 mb-3">
				      <label for="validationCustom03">Direcci�n</label>
				      <input name="txtDireccion" type="text" class="form-control" id="validationCustom04" placeholder="Direcc�on" required>
				      <div class="invalid-feedback">
				        Direcci�n inv�lida
				      </div>
				   </div>
    
    				<div class="col-md-6 mb-3">	
				      <label>Provincia</label>
				      	<div class="container" >
				     		<select style="margin-left:-15px" class="form-control" name="provincia" >
							<%
								ArrayList<String> lista = UbicacionDao.obtenerProvincias();
								for(String prov : lista){
							%>		
							<option><%= prov %></option>
							<%}%>	
						</select>
						</div>
				    </div>
    
				    <div class="col-md-6 mb-3">
						<label>Localidades</label>
						<div class="container">
					    	<select  style="margin-left:-15px" class="form-control" name="localidad" >
								<%
									ArrayList<String> lista2 = UbicacionDao.obtenerLocalidades();
									for(String loc : lista2){			
								%>		
										<option><%= loc %></option>
								<%}%>
							</select>
						</div>
					</div>
					
    				<div class="col-md-6 mb-3">
				      <label for="validationCustom07">Email</label>
				      <input name="txtEmail" type="Email" class="form-control" id="validationCustom07" placeholder="Email" required>
				      <div class="invalid-feedback">
				       Email inv�lido
				      </div>
				    </div>
    
				    <div class="col-md-6 mb-3">
				      <label for="validationCustom08">Tel�fono</label>
				      <input maxlength="15" name="txtTelefono" type="number" class="form-control" id="validationCustom08" placeholder="C�d.�rea + N�mero" oninput="if(this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" required>
				      <div class="invalid-feedback">
				        Tel�fono inv�lido
				      </div>
				    </div>
				</div>
  			<input type="submit" class="btn btn-primary" name="btnAgregarAlumno" value="Guardar">
		</form>
	</div>
</div>
</div>
<%
		
	if(request.getAttribute("estadoAgregar")!=null)
	{
		boolean estadoM = (Boolean)request.getAttribute("estadoAgregar");
		
		if (estadoM != false) 
		{
			%><script>swal("Agregado correctamente", "", "success");</script><%
		}
		else
		{
			%><script>swal("No se pudo agregar", "", "error");</script><%
		}
	}
%>
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
</script>		

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>