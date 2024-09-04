package mx.ulsa.modelo;

public class Usuario {
	private String password;
	private String email;
	
	public Usuario() {}
	
	public Usuario(String email, String password) {
		super();
		this.password = password;
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public boolean isValidEmail() {
		return "admin@gmail.com".equals(email) && "1234".equals(password);
	}
}
