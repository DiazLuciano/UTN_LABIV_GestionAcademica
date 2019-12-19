package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Conecciones.CursoDao;
import Conecciones.UsuarioDao;
import dominio.Usuario;



/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UsuarioDao usDao = new UsuarioDao();
	CursoDao cudDao = new CursoDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 	
		if(request.getParameter("btnLogin")!=null)
	    {
	    	String name = request.getParameter("txtNom");
	    	String pass = request.getParameter("txtPass");
	    	HttpSession sesion = request.getSession();
	    	
	    	Usuario us = usDao.ValidarUsuario(name, pass);
	    	if(us!=null)
	    	{
	    		sesion.setAttribute("Usuario_logueado",us);
	    		switch(us.getTipo_usuario())
		    	{
			    	case 1:
			    		RequestDispatcher miDispacher1 = request.getRequestDispatcher("Administrador/Inicio.jsp");
					    miDispacher1.forward(request, response);
			    		break;
			    	case 2:
			    		request.setAttribute("legajoDoc",cudDao.obtenerLeg(name));
			    		sesion.setAttribute("legajoDoc", cudDao.obtenerLeg(name));
			    		RequestDispatcher miDispacher2 = request.getRequestDispatcher("Profesores/TusCursos.jsp");
					    miDispacher2.forward(request, response);
			    		break;
			    	default:
			    		break;
		    	}
	    	}
	    	else
	    	{
	    		sesion.setAttribute("Errorloguear", "error");
	    		RequestDispatcher miDispacher = request.getRequestDispatcher("/Login.jsp");
			    miDispacher.forward(request, response);
	    		
	    	}	    	
	    }
		
	  }
}
