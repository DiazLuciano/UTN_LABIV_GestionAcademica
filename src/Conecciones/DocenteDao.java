package Conecciones;

import java.sql.ResultSet;
import java.util.ArrayList;

import Interfaces.IProfesor;
import dominio.Alumno;
import dominio.Docente;

public class DocenteDao implements IProfesor {
	private Conexion cn;

	@Override
	public ArrayList<Docente> obtenerProfesores() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Docente> list = new ArrayList<Docente>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from docentes");
			 while(rs.next())
			 {
				 Docente x = new Docente();
				 x.setId(rs.getInt("id"));
				 x.setDni(rs.getString("DNI"));
				 x.setLegajo(rs.getInt("legajo"));
				 x.setNombre_apellido(rs.getString("nombre_apellido"));
				 x.setFecha_nac(rs.getDate("fecha_nac").toLocalDate());
				 x.setDireccion(rs.getString("direccion"));
				 x.setLocalidad(rs.getString("localidad"));
				 x.setProvincia(rs.getString("provincia"));
				 x.setEmail(rs.getString("email"));
				 x.setTelefono(rs.getString("telefono"));
				 x.setEstado(rs.getInt("estado"));
				 
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
	public boolean agregar(Docente doc) {
		boolean estado=true;

		cn = new Conexion();
		cn.Open();

		java.sql.Date sqlDateNacimiento = java.sql.Date.valueOf(doc.getFecha_nac());
		
		String query = "INSERT INTO docentes (DNI,legajo,nombre_apellido,fecha_nac,direccion,localidad,provincia,email,telefono,estado) VALUES ('"+doc.getDni()+"',"+doc.getLegajo()+",'"+doc.getNombre_apellido()+"', '"+sqlDateNacimiento+"', '"+doc.getDireccion()+"', '"+doc.getLocalidad()+"', '"+doc.getProvincia()+"', '"+doc.getEmail()+"', '"+doc.getTelefono()+"', 1)";
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
	public boolean eliminarDocente(int legajo) {
		
		boolean estado=true;
		cn = new Conexion();
		cn.Open();		 
		String query = "UPDATE docentes SET estado=0 WHERE legajo="+legajo;
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
	public Docente obtenerUno(int legajo) {
		cn = new Conexion();
		cn.Open();
		Docente x = new Docente();
		try
		 {
			 ResultSet rs= cn.query("Select * from docentes where legajo="+legajo);
			 rs.next();
			 
			 x.setId(rs.getInt("id"));
			 x.setDni(rs.getString("DNI"));
			 x.setLegajo(rs.getInt("legajo"));
			 x.setNombre_apellido(rs.getString("nombre_apellido"));
			 x.setFecha_nac(rs.getDate("fecha_nac").toLocalDate());
			 x.setDireccion(rs.getString("direccion"));
			 x.setLocalidad(rs.getString("localidad"));
			 x.setProvincia(rs.getString("provincia"));
			 x.setEmail(rs.getString("email"));
			 x.setTelefono(rs.getString("telefono"));
			 x.setEstado(rs.getInt("estado"));
			 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 finally
		 {
			 cn.close();
		 }
		return x;
	}

	@Override
	public boolean modificar(Docente doc) {
		boolean estado=true;

		cn = new Conexion();
		cn.Open();	
		
		java.sql.Date sqlDateNacimiento = java.sql.Date.valueOf(doc.getFecha_nac());
		
		String query = "UPDATE docentes SET DNI='"+doc.getDni()+"' ,nombre_apellido ='"+doc.getNombre_apellido()+"',fecha_nac='"+sqlDateNacimiento+"',direccion='"+doc.getDireccion()+"' ,localidad='"+doc.getLocalidad()+"', provincia='"+doc.getProvincia()+"' ,email='"+doc.getEmail()+"' ,telefono='"+doc.getTelefono()+"' ,estado="+doc.getEstado()+" WHERE legajo ="+doc.getLegajo();
		try
		 {
			estado=cn.execute(query);
		 }
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("modificar "+e.getMessage());
		}
		finally
		{
			cn.close();
		}
		return estado;
	}

	@Override
	public int obtenerLegajo() {
		int leg = 0;
		cn = new Conexion();
		cn.Open();

		try
		 {
			ResultSet rs= cn.query("select MAX(legajo)+1 as legajo from docentes");
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
	
}
