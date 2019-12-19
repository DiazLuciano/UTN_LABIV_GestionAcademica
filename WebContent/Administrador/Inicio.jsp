<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    
<title>Inicio</title>
</head>
<body>

	<%  if(session.getAttribute("Usuario_logueado")!=null )
		{%><jsp:include page="Menu.jsp"></jsp:include>
			<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel" data-pause=false>
			  <div class="carousel-inner" >
			    <div class="carousel-item active" data-interval="500" >
			      <img src="/TP_Final/Administrador/gestion1.jpg" class="d-block w-100"  style="height:550px">
			    </div>
			    <div class="carousel-item" data-interval="500">
			      <img src="/TP_Final/Administrador/gestion2.jpg" class="d-block w-100"  style="height:550px">
			    </div>
			    <div class="carousel-item">
			      <img src="/TP_Final/Administrador/gestion3.jpg" class="d-block w-100"  style="height:550px">
			    </div>
			  </div>
			</div>
		<%}
	else
		{response.sendRedirect("../Login.jsp");}

%>
	
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>