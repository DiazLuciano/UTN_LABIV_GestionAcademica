<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="dominio.Usuario"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="/TP_Final/css/Estilos.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

</head>
<body>
<%
	Usuario us = null;
	String nombre = "";
	HttpSession sesion = request.getSession();
	 if(sesion.getAttribute("Usuario_logueado")!=null ){
		System.out.println("HOLA");
		us = (Usuario) sesion.getAttribute("Usuario_logueado");
		nombre = us.getUser_name();
	 }else{
		 response.sendRedirect("/TP_Final/Login.jsp");
		 System.out.println("LA SESON ES: " + sesion.getAttribute("Usuario_logueado"));
	 }
%>
<div class="container-fluid navbar-dark bg-dark">
<nav class="navbar navbar-expand-lg container">
  <a class="navbar-brand" href="/TP_Final/Administrador/Inicio.jsp">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/TP_Final/ServletAlumnos?Param=listar">Alumnos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TP_Final/ServletDocentes?Param=listar">Profesores</a>
      </li>
      <li class="nav-item">
         <a class="nav-link" href="/TP_Final/ServletCursos?Param=listar">Cursos</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/TP_Final/Administrador/Reportes.jsp">Reportes</a>
      </li>
    </ul>         
    <div class="form-inline my-2 my-lg-0">
       <label ID="lblBienvenido" style="Font-Size:30px; color:#E4DED9;margin-right:10px"> Bienvenido <%=nombre %></label>
       <a href="/TP_Final/Login.jsp" class="btn btn-secondary my-2 my-sm-0" onclick="salir();"> Cerrar sesión </a>      
    </div>
  </div>
</nav>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>