package dominio;

public class CursoReporte {
	private int idcurso;
	private String curso;
	private int legajo_docente;
	private String nombreApellidoDoc;
	private int regulares;
	private int libres;
	private int total;
	
	public String getCurso() {
		return curso;
	}
	public void setCurso(String curso) {
		this.curso = curso;
	}
	public int getIdcurso() {
		return idcurso;
	}
	public void setIdcurso(int idcurso) {
		this.idcurso = idcurso;
	}
	public int getLegajo_docente() {
		return legajo_docente;
	}
	public void setLegajo_docente(int legajo_docente) {
		this.legajo_docente = legajo_docente;
	}
	public String getNombreApellidoDoc() {
		return nombreApellidoDoc;
	}
	public void setNombreApellidoDoc(String nombreApellidoDoc) {
		this.nombreApellidoDoc = nombreApellidoDoc;
	}
	public int getRegulares() {
		return regulares;
	}
	public void setRegulares(int regulares) {
		this.regulares = regulares;
	}
	public int getLibres() {
		return libres;
	}
	public void setLibres(int libres) {
		this.libres = libres;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
