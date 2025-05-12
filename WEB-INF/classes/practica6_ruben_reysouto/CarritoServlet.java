package practica6_ruben_reysouto;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.util.*;

public class CarritoServlet extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession(true); // Lo uso para mantener los datos del carrito entre visitas

		Carrito carrito = (Carrito) sesion.getAttribute("carrito"); // Es una lista de productos que el usuario ha
																	// seleccionado
		if (carrito == null) {
			carrito = new Carrito();
			sesion.setAttribute("carrito", carrito);
		}

		String action = request.getParameter("action");
		if (action == null) {
			action = "index";
		}

		Helper helper = new Helper();

		switch (action) {
			case "add":
				helper.add(sesion, carrito, request, response);
				break;

			case "delete":
				helper.delete(sesion, carrito, request, response);
				break;

			case "pagar":
				helper.pagar(carrito, request, response);
				break;
			case "confirmar":
				helper.confirmar(sesion, carrito, request, response);
				break;

			case "registrar":
				helper.registrar(sesion, carrito, request, response);
				break;

			case "cerrar":
				helper.cerrar(sesion, request, response);
				break;

			case "index":
			default:
				helper.index(request, response);
				break;
		}
	}
	public void destroy() {
	}
}
