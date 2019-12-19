package Interfaces;

import java.util.ArrayList;

import dominio.Alumno;
import dominio.AlumnoXcurso;

public interface IAlumno {
	public ArrayList<Alumno> obtenerAlumnos();
	public boolean agregar(Alumno alu);
	public boolean eliminarAlumno (int legajo);
	public Alumno obtenerUno(int legajo);
	public boolean modificar (Alumno alu);
	public int obtenerLegajo();
	public ArrayList<AlumnoXcurso> obtenerAlumnosPorCurso(int idcurso);
	public boolean guardarNotas(AlumnoXcurso alu);
}
