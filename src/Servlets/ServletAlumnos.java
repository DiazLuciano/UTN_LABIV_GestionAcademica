package Servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Conecciones.AlumnoDao;
import Interfaces.IAlumno;
import dominio.Alumno;



/**
 * Servlet implementation class ServletAlumnos
 */
@WebServlet("/ServletAlumnos")
public class ServletAlumnos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IAlumno aluD = new AlumnoDao();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlumnos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Param")!=null)
		{
			String opcion = request.getParameter("Param").toString();
			
			switch (opcion) {
			case "listar":
			{
				request.setAttribute("listaA", aluD.obtenerAlumnos());
				//request.setAttribute("listaP", aluD.obtenerAlumnos());
				RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Alumnos.jsp");
				dispatcher.forward(request, response);
				break;
			}
			default:
				break;
			}
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		if(request.getParameter("btnAgregar")!=null)
		{
			request.setAttribute("legajoAgregar",aluD.obtenerLegajo());
			RequestDispatcher miDispacher1 = request.getRequestDispatcher("Administrador/AltaAlumno.jsp");
		    miDispacher1.forward(request, response);
		}
		
		if(request.getParameter("btnAgregarAlumno")!=null)
		{
			Alumno x = new Alumno();
			x.setLegajo(Integer.parseInt(request.getParameter("txtLegajo")));
			x.setDni(request.getParameter("txtDNI"));
			x.setNombre_apellido(request.getParameter("txtNombreApellido"));
			x.setFecha_nac(LocalDate.parse(request.getParameter("txtFnac")));
			x.setDireccion(request.getParameter("txtDireccion"));
			x.setLocalidad(request.getParameter("localidad"));
			x.setProvincia(request.getParameter("provincia"));
			x.setEmail(request.getParameter("txtEmail"));
			x.setTelefono(request.getParameter("txtTelefono"));
			

			boolean estado=true;
		    estado = aluD.agregar(x);

		    request.setAttribute("estadoAgregar", estado);
		    request.setAttribute("legajoAgregar",aluD.obtenerLegajo());
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/AltaAlumno.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnEliminar")!=null)
		{
			int leg = Integer.parseInt(request.getParameter("legajo"));
			boolean estado=true;
		    estado = aluD.eliminarAlumno(leg);
		    request.setAttribute("estadoEliminar", estado);
			request.setAttribute("listaA", aluD.obtenerAlumnos());
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Alumnos.jsp");
			dispatcher.forward(request, response);
		}
		if(request.getParameter("btnModificar")!=null)
		{
			System.out.println("legajo" + request.getParameter("legajo"));
			int leg = Integer.parseInt(request.getParameter("legajo"));
			request.setAttribute("alumno",aluD.obtenerUno(leg));
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/ModificarAlumno.jsp");
			dispatcher.forward(request, response);
		}
		if(request.getParameter("btnModificarRegistro")!=null)
		{
			Alumno x = new Alumno();
			x.setLegajo(Integer.parseInt(request.getParameter("txtLegajo")));
			x.setDni(request.getParameter("txtDNI"));
			x.setNombre_apellido(request.getParameter("txtNombreApellido"));
			x.setFecha_nac(LocalDate.parse(request.getParameter("txtFnac")));
			x.setDireccion(request.getParameter("txtDireccion"));
			x.setLocalidad(request.getParameter("localidad"));
			x.setProvincia(request.getParameter("provincia"));
			x.setEmail(request.getParameter("txtEmail"));
			x.setTelefono(request.getParameter("txtTelefono"));
			x.setEstado(Integer.parseInt(request.getParameter("Estados")));

			boolean estado=true;
		    estado = aluD.modificar(x);
		    
		    request.setAttribute("alumno",aluD.obtenerUno(x.getLegajo()));
		    request.setAttribute("estadoModificacion", estado);
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/ModificarAlumno.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnInfo")!=null)
		{
			System.out.println("legajo" + request.getParameter("legajo"));
			int leg = Integer.parseInt(request.getParameter("legajo"));
			request.setAttribute("alumno",aluD.obtenerUno(leg));
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/MasInfoAlumno.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
