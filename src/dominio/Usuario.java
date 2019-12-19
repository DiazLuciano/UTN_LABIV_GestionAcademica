package dominio;

public class Usuario {
	private int num_usuario;
	private String user_name;
	private String password;
	private int tipo_usuario;
	private int estado;
	
	public Usuario ()
	{}
	
	public Usuario (int num, String name, String pass, char tipo)
	{
		this.num_usuario = num;
		this.user_name = name;
		this.password = pass;
		this.tipo_usuario = tipo;
	}

	public int getNum_usuario() {
		return num_usuario;
	}

	public void setNum_usuario(int num_usuario) {
		this.num_usuario = num_usuario;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTipo_usuario() {
		return tipo_usuario;
	}

	public void setTipo_usuario(int i) {
		this.tipo_usuario = i;
	}

	@Override
	public String toString() {
		return "Usuario [num_usuario=" + num_usuario + ", user_name=" + user_name + ", password=" + password
				+ ", tipo_usuario=" + tipo_usuario + "]";
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}
	
}
