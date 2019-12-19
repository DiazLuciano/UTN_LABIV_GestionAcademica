package Conecciones;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Interfaces.IUsuario;
import dominio.Alumno;
import dominio.Usuario;


public class UsuarioDao implements IUsuario {
	
	private Conexion cn;
	
	public UsuarioDao()
	{}
	
	public boolean agregarUsuarioDocente(Usuario doc)
	{
		boolean estado=true;

		cn = new Conexion();
		cn.Open();
		
		String query = "INSERT INTO usuarios (num_usuario,name,password,tipo_usuario,estado) values ("+doc.getNum_usuario()+",'"+doc.getUser_name()+"','"+doc.getPassword()+"',2,1)";
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
	public Usuario ValidarUsuario(String name, String pass) {

		cn = new Conexion();
		cn.Open();
		Usuario us = new Usuario();
		try
		{
			ResultSet rs= cn.query("Select * from Usuarios where name='"+name+"' and password='"+pass+"' and estado=1");
			rs.next();
			us.setNum_usuario(rs.getInt("num_usuario"));
			us.setTipo_usuario(rs.getInt("tipo_usuario"));
			us.setPassword("");
			us.setUser_name(rs.getString("name"));
			return us;
		}
		catch(Exception e)
		 {
			 e.printStackTrace();
			 System.out.println("validarusuario "+e.getMessage());
		 }
		 finally
		 {
			 cn.close();
		 }
		return null;
		
	}

	@Override
	public boolean eliminarUsuario(int legajo) {
		boolean estado=true;
		cn = new Conexion();
		cn.Open();		 
		String query = "UPDATE usuarios SET estado=0 WHERE num_usuario="+legajo;
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
	public boolean darAlta(int legajo) {
		boolean estado=true;
		cn = new Conexion();
		cn.Open();		 
		String query = "UPDATE usuarios SET estado=1 WHERE num_usuario="+legajo;
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
