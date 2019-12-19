package Interfaces;

import java.util.ArrayList;

import dominio.Curso;
import dominio.CursoReporte;

public interface ICurso {
	
	public ArrayList<Curso> obtenerCursos();
	public boolean agregar(Curso c);
	public boolean agregarAlumnos(int idCurso, String legajo);
	public int obtenerID();
	public int obtenerLeg(String user);
	public int obtenerIDCurso(String materia,int semestre);
	public ArrayList<CursoReporte> obtenerCursosReporte(int año,int semestre);
	public int totalalumnos(int legajoDoc);
	public int totalalumnosdelcurso(int idCurso);
}
