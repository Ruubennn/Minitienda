package practica6_ruben_reysouto;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class CarritoServlet extends HttpServlet {

    public void init(ServletConfig config) throws ServletException {
		super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sesion = request.getSession(true); // Lo uso para mantener los datos del carrito entre visitas
		
		Carrito carrito = (Carrito) sesion.getAttribute("carrito"); // Es una lista de productos que el usuario ha seleccionado
		if(carrito == null){
			carrito = new Carrito();
			sesion.setAttribute("carrito", carrito);
		}
	
		String action = request.getParameter("action");
		if(action == null){
			action = "index";
		}
	
		switch(action){
			case "add":
				// Recupero los datos del producto
				String cd = request.getParameter("cd");	
				int cantidad = Integer.parseInt(request.getParameter("cantidad"));
				
				// Creo un objeto producto y lo añado al carrito
				carrito.addProducto(new Producto(cd, cantidad));
				sesion.setAttribute("carrito", carrito); // Guarda el carrito de la sesión
				
				// Llamada al JSP
				request.setAttribute("carrito", carrito);
				gotoPage("/carrito.jsp", request, response);
				break;
			
			case "delete":
				int indice = Integer.parseInt(request.getParameter("index"));
				if( indice >= 0 && indice < carrito.getProductos().size()){
					carrito.removeProducto(indice); // Elimina el producto indicado por índice
				}
				sesion.setAttribute("carrito", carrito); // Se devuelve el carrito actualizado

				// Llamada al JSP
			    request.setAttribute("carrito", carrito);
			    gotoPage("/carrito.jsp", request, response);
				break;
			
			case "pagar":
				request.setAttribute("carrito", carrito);
				gotoPage("/pago.jsp", request, response);
				sesion.invalidate(); // reinicia el carrito
				break;
			
			case "index":
			default:
				gotoPage("/formulario.jsp", request, response);
				break;
		}
    }
    
    private void gotoPage(String address, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// Creamos objeto RequestDispatcher
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	dispatcher.forward(request, response);
    }
    
    public void destroy(){
    }
}
