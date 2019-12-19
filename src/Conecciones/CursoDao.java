package Conecciones;

import java.sql.ResultSet;
import java.util.ArrayList;

import Interfaces.ICurso;
import dominio.Alumno;
import dominio.Curso;
import dominio.CursoReporte;

public class CursoDao implements ICurso{
	
	private Conexion cn;
	
	public boolean agregar(Curso c) {		
		
		cn = new Conexion();
		cn.Open();
		
		boolean estado=true;

		cn = new Conexion();
		cn.Open();
		
		String query = "INSERT INTO cursos (semestre,año,legajo_docente,materia,estado) VALUES ("+c.getSemestre()+","+c.getAño()+",'"+c.getLegajoDoc()+"', '"+c.getMateria()+"', 1)";
		System.out.println(query);
		try
		 {
			estado=cn.execute(query);
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		
		return estado;
	}
	
	public boolean agregarAlumnos(int idCurso, String legajo) {
		
		boolean estado=true;

		cn = new Conexion();
		cn.Open();
		
		String query = "INSERT INTO cursos_x_alumnos (legajo_alumno,id_curso,situacion) VALUES ("+legajo+","+idCurso+",'REGULAR')";
		System.out.println(query);
		try
		 {
			estado=cn.execute(query);
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return estado;
	}

	@Override
	public int obtenerID() {
		int id = 0;

		cn = new Conexion();
		cn.Open();

		try
		 {
			ResultSet rs= cn.query("select MAX(id)+1 as id from cursos");
			rs.next();
			id=rs.getInt("id");
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return id;
	}

	@Override
	public ArrayList<Curso> obtenerCursos() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Curso> list = new ArrayList<Curso>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from cursos");
			 while(rs.next())
			 {
				 Curso x = new Curso();
				 x.setId(Integer.parseInt(rs.getString("id")));
				 x.setSemestre(Integer.parseInt(rs.getString("semestre")));
				 x.setAño(Integer.parseInt(rs.getString("año")));
				 x.setLegajoDoc(Integer.parseInt(rs.getString("legajo_docente")));
				 x.setMateria(rs.getString("materia"));
				 x.setEstado(Integer.parseInt(rs.getString("estado")));
				 list.add(x);
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.close();
		 }
		 return list;
	}

	@Override
	public int obtenerLeg(String user) {
		int leg = 0;

		cn = new Conexion();
		cn.Open();
		
		try
		{
			ResultSet rs= cn.query("select num_usuario as legajo from usuarios where name='"+user+"'");
			rs.next();
			leg=rs.getInt("legajo");
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return leg;
		
	}

	@Override
	public int obtenerIDCurso(String materia, int semestre) {
		int id = 0;

		cn = new Conexion();
		cn.Open();
		
		try
		{
			ResultSet rs= cn.query("select * from cursos where materia='"+materia+"' and semestre="+semestre);
			rs.next();
			id=rs.getInt("id");
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return id;
	}

	@Override
	public ArrayList<CursoReporte> obtenerCursosReporte(int año, int semestre) {
		
		cn = new Conexion();
		cn.Open();
		ArrayList<CursoReporte> list = new ArrayList<CursoReporte>();
		 try
		 {
			 ResultSet rs= cn.query("select c.id as id, c.legajo_docente as legajo_docente, d.nombre_apellido as nombre_apellido, c.materia as materia,(select count(Distinct legajo_alumno) from cursos_x_alumnos where id_curso = c.id and situacion = 'REGULAR') AS Regulares,(select count(Distinct legajo_alumno) from cursos_x_alumnos where id_curso = c.id and situacion = 'LIBRE') AS Libres, (select count(Distinct legajo_alumno) from cursos_x_alumnos where id_curso = c.id) AS Total from cursos as c inner join docentes as d on d.legajo = c.legajo_docente where c.semestre = "+semestre+" and c.año = "+año);
			 while(rs.next())
			 {
				 CursoReporte x = new CursoReporte();
				 x.setIdcurso(rs.getInt("id"));
				 x.setCurso(rs.getString("materia"));
				 x.setLegajo_docente(rs.getInt("legajo_docente"));
				 x.setNombreApellidoDoc(rs.getString("nombre_apellido"));
				 x.setRegulares(rs.getInt("Regulares"));
				 x.setLibres(rs.getInt("Libres"));
				 x.setTotal(rs.getInt("Total"));
				 list.add(x);
			 }
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.close();
		 }
		 return list;
	}

	@Override
	public int totalalumnos(int legajodoc) {
		int total = 0;

		cn = new Conexion();
		cn.Open();
		
		try
		{
			ResultSet rs= cn.query("select count(*) as total from cursos_x_alumnos as ca inner join cursos as c on c.id=ca.id_curso inner join alumnos as a on a.legajo=ca.legajo_alumno where a.estado = 1 and c.legajo_docente="+legajodoc);
			rs.next();
			total=rs.getInt("total");
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return total;
	}

	@Override
	public int totalalumnosdelcurso(int idCurso) {
		int total = 0;

		cn = new Conexion();
		cn.Open();
		
		try
		{
			ResultSet rs= cn.query("select count(*) as total from cursos_x_alumnos as ca inner join cursos as c on c.id=ca.id_curso inner join alumnos as a on a.legajo=ca.legajo_alumno where a.estado = 1 and ca.id_curso="+idCurso);
			rs.next();
			total=rs.getInt("total");
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return total;
	}
}
