package dominio;

import java.util.ArrayList;


public class Curso {
	private int id;
	private String materia;
	private int semestre;
	private int a�o;
	private int legajoDoc;
	private String[] alumnos;
	private int estado;
	
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMateria() {
		return materia;
	}
	public void setMateria(String materia) {
		this.materia = materia;
	}
	public int getSemestre() {
		return semestre;
	}
	public void setSemestre(int semestre) {
		this.semestre = semestre;
	}
	public int getA�o() {
		return a�o;
	}
	public void setA�o(int a�o) {
		this.a�o = a�o;
	}
	public int getLegajoDoc() {
		return legajoDoc;
	}
	public void setLegajoDoc(int legajoDoc) {
		this.legajoDoc = legajoDoc;
	}
	public String[] getAlumnos() {
		return alumnos;
	}
	public void setAlumnos(String[] alumnos) {
		this.alumnos = alumnos;
	}
	
	
}
