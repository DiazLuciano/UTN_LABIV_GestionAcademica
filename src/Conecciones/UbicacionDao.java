package Conecciones;

import java.sql.ResultSet;
import java.util.ArrayList;

public class UbicacionDao {
	
	private static Conexion cn;
	
	public static ArrayList<String> obtenerProvincias() {
		
		cn = new Conexion();
		cn.Open();
		ArrayList<String> list = new ArrayList<String>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from provincia");
			 while(rs.next())
			 {
				 String x = rs.getString("nombre");
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
	
	public static ArrayList<String> obtenerLocalidades() {
		
		cn = new Conexion();
		cn.Open();
		ArrayList<String> list = new ArrayList<String>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from localidad");
			 while(rs.next())
			 {
				 String x = rs.getString("nombre");
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
