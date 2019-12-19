package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Conecciones.AlumnoDao;
import Conecciones.CursoDao;
import Conecciones.DocenteDao;
import dominio.Curso;

/**
 * Servlet implementation class ServletCursos
 */
@WebServlet("/ServletCursos")
public class ServletCursos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AlumnoDao aluD = new AlumnoDao();
	DocenteDao docD = new DocenteDao();
	CursoDao curD = new CursoDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCursos() {
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
				request.setAttribute("listaC", curD.obtenerCursos());
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Cursos.jsp");
				dispatcher.forward(request, response);
				break;
			}
			
			default:
				break;
			}
		}
		
		if(request.getParameter("btnAgregar")!=null)
		{
			request.setAttribute("listaA", aluD.obtenerAlumnos());
			request.setAttribute("listaD", docD.obtenerProfesores());
			request.setAttribute("idCurso",curD.obtenerID());
				
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/AltaCurso.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnGuardar")!=null)
		{
			Curso x = new Curso();
			x.setId(Integer.parseInt(request.getParameter("txtID")));
			x.setLegajoDoc(Integer.parseInt(request.getParameter("legajoDoc")));
			x.setMateria(request.getParameter("Materias"));
			x.setSemestre(Integer.parseInt(request.getParameter("Semestre")));
			x.setAño(Integer.parseInt(request.getParameter("txtAno")));
			String hfAlumnos = request.getParameter("hfAlumnos");
			String[] arrAlumnos = hfAlumnos.split(",");
			x.setAlumnos(arrAlumnos);
			
			boolean estado=true;
			boolean estado2 = true;
			
		    estado = curD.agregar(x);
		    
		    for(String legajo : arrAlumnos) {
		    	if(!curD.agregarAlumnos(x.getId(), legajo))
		    		estado2 = false;
		    }
		  
		    if(estado == true && estado2 == true)
		    {
		    	request.setAttribute("estadoAgregarCurso", true);
		    }
		    	 		    
		    else
		    {
		    	request.setAttribute("estadoAgregarCurso", false);
		    }
		   
		    request.setAttribute("idCurso",curD.obtenerID());
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/AltaCurso.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnEliminar")!=null)
		{
			int leg = Integer.parseInt(request.getParameter("legajo"));
			boolean estado=true;
		    //estado = curD(leg);
		    request.setAttribute("estadoEliminar", estado);
			request.setAttribute("listaA", aluD.obtenerAlumnos());
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Cursos.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
