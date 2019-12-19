package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Conecciones.AlumnoDao;
import Conecciones.CursoDao;
import dominio.AlumnoXcurso;

/**
 * Servlet implementation class ServletNotas
 */
@WebServlet("/ServletNotas")
public class ServletNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	AlumnoDao aluD = new AlumnoDao();
	CursoDao curD = new CursoDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNotas() {
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
		
		if(request.getParameter("btnListar")!=null)
		{
			int idcurso = Integer.parseInt(request.getParameter("tusmaterias"));
			request.setAttribute("listaAlumnos", aluD.obtenerAlumnosPorCurso(idcurso));
			request.setAttribute("legajoDoc", Integer.parseInt(request.getParameter("tulegajo")));
			
			request.setAttribute("totalalumnos", curD.totalalumnos(Integer.parseInt(request.getParameter("tulegajo"))));
			request.setAttribute("totalalumnosxcurso", curD.totalalumnosdelcurso(idcurso));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Profesores/TusCursos.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnGuardarNotas")!=null)
		{
			String hListaLegajos = request.getParameter("hListaLegajos");
			System.out.println(hListaLegajos);
			String[] listLegajos = hListaLegajos.split(",");
			boolean estadoNotas = true;
			for(String legajo : listLegajos) {
				AlumnoXcurso a = new AlumnoXcurso();
				a.setIdcurso(Integer.parseInt(request.getParameter("tusmaterias")));
				a.setLegajo(Integer.parseInt(legajo));
				a.setNota1(Integer.parseInt(request.getParameter("nota1" + legajo)));
				a.setNota2(Integer.parseInt(request.getParameter("nota2" + legajo)));
				a.setRecu1(Integer.parseInt(request.getParameter("recu1" + legajo)));
				a.setRecu2(Integer.parseInt(request.getParameter("recu2" + legajo)));
				a.setSituacion(request.getParameter("Situacion" + legajo));
				if(!aluD.guardarNotas(a))
					estadoNotas = false;
			}
			
			int idcurso = Integer.parseInt(request.getParameter("tusmaterias"));
			request.setAttribute("listaAlumnos", aluD.obtenerAlumnosPorCurso(idcurso));
			request.setAttribute("legajoDoc", Integer.parseInt(request.getParameter("tulegajo")));
			request.setAttribute("estadoNotas", estadoNotas);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Profesores/TusCursos.jsp");
			dispatcher.forward(request, response);
		}
	}

}
