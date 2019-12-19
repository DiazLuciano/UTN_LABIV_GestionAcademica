package Interfaces;

import java.util.ArrayList;

import dominio.Docente;

public interface IProfesor {
	public ArrayList<Docente> obtenerProfesores();
	public boolean agregar(Docente doc);
	public boolean eliminarDocente (int legajo);
	public Docente obtenerUno(int legajo);
	public boolean modificar (Docente doc);
	public int obtenerLegajo();
}
