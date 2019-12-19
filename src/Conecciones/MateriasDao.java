package Conecciones;

import java.sql.ResultSet;
import java.util.ArrayList;
import dominio.Curso;
public class MateriasDao {
	
private static Conexion cn;
	
	public static ArrayList<String> obtenerMaterias() {
		
		cn = new Conexion();
		cn.Open();
		ArrayList<String> list = new ArrayList<String>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from materias");
			 while(rs.next())
			 {
				 String x = rs.getString("materia");
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
	
public static ArrayList<Curso> obtenerMateriasUno(int legajo) {
		
		cn = new Conexion();
		cn.Open();
		ArrayList<Curso> list = new ArrayList<Curso>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from cursos where legajo_docente="+legajo+" and estado=1");
			 while(rs.next())
			 {
				Curso x = new Curso();
				x.setId(Integer.parseInt(rs.getString("id")));
				x.setLegajoDoc(Integer.parseInt(rs.getString("legajo_docente")));
				x.setMateria(rs.getString("materia"));
				x.setSemestre(Integer.parseInt(rs.getString("semestre")));
				x.setAño(Integer.parseInt(rs.getString("año")));
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
}
