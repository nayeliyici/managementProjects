package mx.ulsa.controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.ulsa.modelo.Usuario;

import java.io.IOException;

public class LoginControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginControlador() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	procesar(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getPathInfo();
			System.out.println(action);
			
			switch(action) {
			case "/login" -> login(request, response);
			case "/ingresar" -> ingresar(request, response);
			default -> response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = "";
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("correo")) {
					email = cookie.getValue();
				}
			}
		}
		response.sendRedirect(request.getContextPath() + "/vista/login.jsp?email=" + email);
	}
	
	private void ingresar(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Usuario usuario = new Usuario(email, password);
		
		if(usuario.isValidEmail()) {
			response.sendRedirect(request.getContextPath()+"/vista/private/dashboard.jsp?email="+ email);
		}
		else {
			request.setAttribute("errorMessage", "Usuario o contraseña incorrecto");
			request.getRequestDispatcher("vista/login.jsp").forward(request,response);
		}
	}
}
