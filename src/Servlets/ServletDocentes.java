package Servlets;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Conecciones.DocenteDao;
import Conecciones.UsuarioDao;
import dominio.Docente;
import dominio.Usuario;

/**
 * Servlet implementation class ServletDocentes
 */
@WebServlet("/ServletDocentes")
public class ServletDocentes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DocenteDao docD = new DocenteDao();
	UsuarioDao usD = new UsuarioDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDocentes() {
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
				request.setAttribute("listaP", docD.obtenerProfesores());
				RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Profesores.jsp");
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
			request.setAttribute("legajoAgregar",docD.obtenerLegajo());
			RequestDispatcher miDispacher1 = request.getRequestDispatcher("Administrador/AltaProfesor.jsp");
		    miDispacher1.forward(request, response);
		}
		
		if(request.getParameter("btnAgregarDocente")!=null)
		{
			Docente x = new Docente();
			Usuario a = new Usuario();
			x.setLegajo(Integer.parseInt(request.getParameter("txtLegajo")));
			x.setDni(request.getParameter("txtDNI"));
			x.setNombre_apellido(request.getParameter("txtNombreApellido"));
			x.setFecha_nac(LocalDate.parse(request.getParameter("txtFnac")));
			x.setDireccion(request.getParameter("txtDireccion"));
			x.setLocalidad(request.getParameter("localidad"));
			x.setProvincia(request.getParameter("provincia"));
			x.setEmail(request.getParameter("txtEmail"));
			x.setTelefono(request.getParameter("txtTelefono"));
			a.setNum_usuario(Integer.parseInt(request.getParameter("txtLegajo")));
			a.setTipo_usuario(2);
			a.setUser_name(request.getParameter("txtusuario"));
			a.setPassword(request.getParameter("txtcontraseña"));
			

			boolean estado=true;
		    estado = docD.agregar(x);
		    estado = usD.agregarUsuarioDocente(a);

		    request.setAttribute("estadoAgregar", estado);
		    request.setAttribute("legajoAgregar",docD.obtenerLegajo());
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/AltaProfesor.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnEliminar")!=null)
		{
			int leg = Integer.parseInt(request.getParameter("legajo"));
			boolean estado=true;
		    estado = docD.eliminarDocente(leg);
		    estado = usD.eliminarUsuario(leg);
		    request.setAttribute("estadoEliminar",estado);
			request.setAttribute("listaP", docD.obtenerProfesores());
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Profesores.jsp");
			dispatcher.forward(request, response);
		}
		if(request.getParameter("btnModificar")!=null)
		{
			System.out.println("legajo" + request.getParameter("legajo"));
			int leg = Integer.parseInt(request.getParameter("legajo"));
			request.setAttribute("docente",docD.obtenerUno(leg));
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/ModificarProfesor.jsp");
			dispatcher.forward(request, response);
		}
		if(request.getParameter("btnModificarRegistro")!=null)
		{
			Docente x = new Docente();
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
		    estado = docD.modificar(x);
		    if(Integer.parseInt(request.getParameter("Estados"))==1)
		    {
		    	 estado = usD.darAlta(Integer.parseInt(request.getParameter("txtLegajo")));
		    }
		    else
		    {
		    	 estado = usD.eliminarUsuario(Integer.parseInt(request.getParameter("txtLegajo")));
		    }

		    request.setAttribute("docente",docD.obtenerUno(x.getLegajo()));
		    request.setAttribute("estadoModificacion", estado);
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/ModificarProfesor.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	

}
