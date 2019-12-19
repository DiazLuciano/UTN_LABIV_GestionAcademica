package dominio;

import java.sql.Date;
import java.time.LocalDate;

public class Alumno {
	private int id;
	private int legajo;
	private String dni;
	private String nombre_apellido;
	private LocalDate fecha_nac;
	private String direccion;
	private String localidad;
	private String provincia;
	private String email;
	private String telefono;
	private int estado;
	private static int cont = 0000;
	
	public Alumno() {}
	
	
	public Alumno(String dni, String nombre_apellido, LocalDate fecha_nac, String direccion, String localidad,
			String provincia, String email, String telefono) {
		super();
		this.legajo = cont++;
		this.dni = dni;
		this.nombre_apellido = nombre_apellido;
		this.fecha_nac = fecha_nac;
		this.direccion = direccion;
		this.localidad = localidad;
		this.provincia = provincia;
		this.email = email;
		this.telefono = telefono;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLegajo() {
		return legajo;
	}
	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getNombre_apellido() {
		return nombre_apellido;
	}
	public void setNombre_apellido(String nombre_apellido) {
		this.nombre_apellido = nombre_apellido;
	}
	public LocalDate getFecha_nac() {
		return fecha_nac;
	}
	public void setFecha_nac(LocalDate localDate) {
		this.fecha_nac = localDate;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}



	@Override
	public String toString() {
		return "Alumno [id=" + id + ", legajo=" + legajo + ", dni=" + dni + ", nombre_apellido=" + nombre_apellido
				+ ", fecha_nac=" + fecha_nac + ", direccion=" + direccion + ", localidad=" + localidad + ", provincia="
				+ provincia + ", email=" + email + ", telefono=" + telefono + ", estado="
				+ estado + "]";
	}
	
}
