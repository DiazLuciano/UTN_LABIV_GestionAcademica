package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Conecciones.CursoDao;

/**
 * Servlet implementation class ServletReporte
 */
@WebServlet("/ServletReporte")
public class ServletReporte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	CursoDao curD = new CursoDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReporte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("btnListar")!=null)
		{
			int semestre = Integer.parseInt(request.getParameter("semestre"));
			int año = Integer.parseInt(request.getParameter("anio"));
			request.setAttribute("listaReporte", curD.obtenerCursosReporte(año,semestre));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Administrador/Reportes.jsp");
			dispatcher.forward(request, response);
		}
	}

}
