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
				
				break;
			case "confirmar":
				String nombre = request.getParameter("nombre");
				String correo = request.getParameter("email");
				String contrasena = request.getParameter("contrasena");

				carrito = (Carrito) sesion.getAttribute("carrito");
				int userId = UsuarioDAO.obtenerUsuario(correo);

				if(userId == -1){
					// Usuario no existe, redirigir a registro
					request.setAttribute("email", correo);	
					request.setAttribute("contrasena", contrasena);
					gotoPage("/registro.jsp", request, response);
				} else {
					// Usuario existe, procesar el pedido
					PedidoDAO.insertarPedido(userId, carrito.getTotal());
					request.setAttribute("nombre", nombre);
					request.setAttribute("total", carrito.getTotalFormateado());
					gotoPage("/confirmacion.jsp", request, response);
					sesion.invalidate(); // reinicia el carrito
				}
				//sesion.invalidate(); // reinicia el carrito
				break;

			case "registrar":
				String nombreNuevo = request.getParameter("nombre");
				String correoNuevo = request.getParameter("email");
				String contrasenaNueva = request.getParameter("contrasena");
				String tipoTarjeta = request.getParameter("tipoTarjeta");
				String numeroTarjeta = request.getParameter("numeroTarjeta");
		
				carrito = (Carrito) sesion.getAttribute("carrito");
		
				int userIdNuevo = UsuarioDAO.insertarUsuario(nombreNuevo, correoNuevo, contrasenaNueva);
				TarjetaDAO.insertarTarjeta(userIdNuevo, tipoTarjeta, numeroTarjeta);
		
				PedidoDAO.insertarPedido(userIdNuevo, carrito.getTotal());
				request.setAttribute("nombre", nombreNuevo);
				request.setAttribute("total", carrito.getTotalFormateado());
				gotoPage("/confirmacion.jsp", request, response);
				//sesion.invalidate();
				break;

			case "cerrar":
				sesion.invalidate();
				response.sendRedirect(request.getContextPath() + "/index.html");


				break;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////7
			case "testConexion":
    			try (Connection conn = ConexionBD.getConnection()) {
        			if (conn != null && !conn.isClosed()) {
            			request.setAttribute("mensaje", "✅ Conexión exitosa con la base de datos desde Tomcat.");
        			} else {
            			request.setAttribute("mensaje", "❌ No se pudo conectar a la base de datos.");
        			}
    			} catch (Exception e) {
        			request.setAttribute("mensaje", "❌ Error al conectar: " + e.getMessage());
    			}
    			gotoPage("/resultado.jsp", request, response);
    			break;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////7
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
