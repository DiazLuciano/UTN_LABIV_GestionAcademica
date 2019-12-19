
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="css/Estilos.css" type="text/css"/>
<title>Login</title>

</head>
<body >
<div class="user-img"><img src="Images\logo_user.jpg" /></div>
<div class="col-4" style="background-color:#3D3742; opacity:.90; padding:0 20px; box-shadow: 0px 0px 3px #848484; margin:0 auto;margin-top:2%">
<form class="needs-validation" method="post"  action="ServletLogin" novalidate >
<%
session.setAttribute("Usuario_logueado", null); 
%>
<div class="container">
  <div class="form-group">
    <label for="validationCustom01" style="color:#E4DED9 ">User name</label>
    <input type="text" class="form-control" name="txtNom" id="validationCustom01" placeholder="Enter user" required>
     <div class="invalid-feedback">
        Complete el campo
      </div>
    <small id="emailHelp" class="form-text text-muted" style="color:silver ">We'll never share your username with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="validationCustom02" style="color:#E4DED9 ">Password</label>
    <input type="password" class="form-control" name="txtPass" id="validationCustom02" placeholder="Password" required>
    <div class="invalid-feedback">
        Complete el campo
      </div>
  </div>
    <label style="display:none; color: red" id="lblerror">Error: usuario no registrado</label>
  <button name="btnLogin" type="submit" style="margin:10px 120px" class="btn btn-primary col-4">Login</button>
 
  </div>
 
</form>
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

window.onload=function(){
	
	var error = document.getElementById("lblerror");
	<%if(session.getAttribute("Errorloguear")=="error"){%>
		error.style.display="block";
	<%
		session.setAttribute("Errorloguear", null);
	}
	%>
}

</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
