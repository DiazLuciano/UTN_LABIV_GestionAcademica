package Interfaces;

import java.util.ArrayList;


import dominio.Usuario;

public interface IUsuario {
	public Usuario ValidarUsuario(String name,String pass);
	public boolean eliminarUsuario (int legajo);
	public boolean agregarUsuarioDocente(Usuario doc);
	public boolean darAlta(int legajo);
}
