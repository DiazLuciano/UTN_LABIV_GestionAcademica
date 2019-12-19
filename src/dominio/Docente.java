package dominio;

import java.time.LocalDate;

public class Docente {
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
	
	public Docente() {}
	
	
	


	public Docente(int id, int legajo, String dni, String nombre_apellido, LocalDate fecha_nac, String direccion,
			String localidad, String provincia, String email, String telefono, int estado) {
		super();
		this.id = id;
		this.legajo = legajo;
		this.dni = dni;
		this.nombre_apellido = nombre_apellido;
		this.fecha_nac = fecha_nac;
		this.direccion = direccion;
		this.localidad = localidad;
		this.provincia = provincia;
		this.email = email;
		this.telefono = telefono;
		this.estado = estado;
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


	public void setFecha_nac(LocalDate fecha_nac) {
		this.fecha_nac = fecha_nac;
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
	
	
}
