package dominio;

public class AlumnoXcurso {
	private int idcurso;
	private int legajo;
	private String NombreApe;
	private int nota1;
	private int nota2;
	private int recu1;
	private int recu2;
	private String situacion;
	
	public int getIdcurso() {
		return idcurso;
	}
	public void setIdcurso(int idcurso) {
		this.idcurso = idcurso;
	}
	public int getLegajo() {
		return legajo;
	}
	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}
	public String getNombreApe() {
		return NombreApe;
	}
	public void setNombreApe(String nombreApe) {
		NombreApe = nombreApe;
	}
	public int getNota1() {
		return nota1;
	}
	public void setNota1(int nota1) {
		this.nota1 = nota1;
	}
	public int getNota2() {
		return nota2;
	}
	public void setNota2(int nota2) {
		this.nota2 = nota2;
	}
	public int getRecu1() {
		return recu1;
	}
	public void setRecu1(int recu1) {
		this.recu1 = recu1;
	}
	public int getRecu2() {
		return recu2;
	}
	public void setRecu2(int recu2) {
		this.recu2 = recu2;
	}
	public String getSituacion() {
		return situacion;
	}
	public void setSituacion(String situacion) {
		this.situacion = situacion;
	}
	
}
