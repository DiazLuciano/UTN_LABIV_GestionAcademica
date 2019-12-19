package Conecciones;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Interfaces.IAlumno;
import dominio.Alumno;
import dominio.AlumnoXcurso;

public class AlumnoDao implements IAlumno {
	
	private static Conexion cn;
	
	@Override
	public ArrayList<Alumno> obtenerAlumnos() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Alumno> list = new ArrayList<Alumno>();
		 try
		 {
			 ResultSet rs= cn.query("Select * from Alumnos");
			 while(rs.next())
			 {
				 Alumno x = new Alumno();
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
	public boolean eliminarAlumno(int legajo) {
		boolean estado=true;
		cn = new Conexion();
		cn.Open();		 
		String query = "UPDATE alumnos SET estado=0 WHERE legajo="+legajo;
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
	public Alumno obtenerUno(int legajo) {
		cn = new Conexion();
		cn.Open();
		Alumno x = new Alumno();
		try
		 {
			 ResultSet rs= cn.query("Select * from alumnos where legajo="+legajo);
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
	public boolean modificar(Alumno alu) {
		boolean estado=true;

		cn = new Conexion();
		cn.Open();	
		
		java.sql.Date sqlDateNacimiento = java.sql.Date.valueOf(alu.getFecha_nac());
		
		String query = "UPDATE alumnos SET DNI='"+alu.getDni()+"' ,nombre_apellido ='"+alu.getNombre_apellido()+"',fecha_nac='"+sqlDateNacimiento+"',direccion='"+alu.getDireccion()+"' ,localidad='"+alu.getLocalidad()+"', provincia='"+alu.getProvincia()+"' ,email='"+alu.getEmail()+"' ,telefono='"+alu.getTelefono()+"' ,estado="+alu.getEstado()+" WHERE legajo ="+alu.getLegajo();
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
	public boolean agregar(Alumno alu) {
		boolean estado=true;

		cn = new Conexion();
		cn.Open();

		java.sql.Date sqlDateNacimiento = java.sql.Date.valueOf(alu.getFecha_nac());
		
		String query = "INSERT INTO alumnos (DNI,legajo,nombre_apellido,fecha_nac,direccion,localidad,provincia,email,telefono,estado) VALUES ('"+alu.getDni()+"',"+alu.getLegajo()+",'"+alu.getNombre_apellido()+"', '"+sqlDateNacimiento+"', '"+alu.getDireccion()+"', '"+alu.getLocalidad()+"', '"+alu.getProvincia()+"', '"+alu.getEmail()+"', '"+alu.getTelefono()+"', 1)";
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
	public int obtenerLegajo() {
		int leg = 0;
		cn = new Conexion();
		cn.Open();

		try
		 {
			ResultSet rs= cn.query("select MAX(legajo)+1 as legajo from alumnos");
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
	public ArrayList<AlumnoXcurso> obtenerAlumnosPorCurso(int idcurso) {
		
			cn = new Conexion();
			cn.Open();
			ArrayList<AlumnoXcurso> list = new ArrayList<AlumnoXcurso>();
			 try
			 {
				 ResultSet rs= cn.query("Select * from alumnos as A inner join cursos_x_alumnos as c on legajo_alumno = A.legajo where c.id_curso ="+idcurso+" and estado=1");
				 while(rs.next())
				 {
					 AlumnoXcurso x = new AlumnoXcurso();
					 
					 x.setLegajo(rs.getInt("legajo_alumno"));
					 x.setIdcurso(rs.getInt("id_curso"));
					 x.setNombreApe(rs.getString("nombre_apellido"));
					 
					 x.setNota1(rs.getInt("nota1"));
					 x.setNota2(rs.getInt("nota2"));
					 x.setRecu1(rs.getInt("recu1"));
					 x.setRecu2(rs.getInt("recu2"));
					 x.setSituacion(rs.getString("situacion"));
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
	public boolean guardarNotas(AlumnoXcurso alu) {
		boolean estado=true;

		cn = new Conexion();
		cn.Open();
		
		String query = "UPDATE cursos_x_alumnos SET nota1="+alu.getNota1()+", nota2="+alu.getNota2()+", recu1="+alu.getRecu1()+",  recu2="+alu.getRecu2()+", situacion='"+alu.getSituacion()+"' where legajo_alumno="+alu.getLegajo();
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
}
