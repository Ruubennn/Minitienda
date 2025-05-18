package practica6_ruben_reysouto;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.util.*;

public class Helper {

    public void add(HttpSession sesion, Carrito carrito, HttpServletRequest request, HttpServletResponse response) {
        try {
            // Recupero los datos del producto
            String cd = request.getParameter("cd");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            // Creo un objeto producto y lo añado al carrito
            carrito.addProducto(new Producto(cd, cantidad));
            sesion.setAttribute("carrito", carrito); // Guarda el carrito de la sesión

            // Llamada al JSP
            request.setAttribute("carrito", carrito);
            gotoPage("/carrito.jsp", request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    public void delete(HttpSession sesion, Carrito carrito, HttpServletRequest request, HttpServletResponse response) {
        try{
            int indice = Integer.parseInt(request.getParameter("index"));
            if (indice >= 0 && indice < carrito.getProductos().size()) {
                carrito.removeProducto(indice); // Elimina el producto indicado por índice
            }
            sesion.setAttribute("carrito", carrito); // Se devuelve el carrito actualizado

            // Llamada al JSP
        
            request.setAttribute("carrito", carrito);
            gotoPage("/carrito.jsp", request, response);
        }catch(ServletException | IOException e){
                e.printStackTrace();
        }
        
    }

    public void pagar(Carrito carrito, HttpServletRequest request, HttpServletResponse response) {
        try{
            request.setAttribute("carrito", carrito);        
            gotoPage("/pago.jsp", request, response);
        }catch(ServletException | IOException e){
                e.printStackTrace();
        } 
    }

    public void confirmar(HttpSession sesion, Carrito carrito, HttpServletRequest request, HttpServletResponse response) {
        
        try{
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("email");
            String contrasena = request.getParameter("contrasena");


            //carrito = (Carrito) sesion.getAttribute("carrito");
            int userId = UsuarioDAO.obtenerUsuario(correo);

            if (userId == -1) {
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
        
                gotoPage("/confirmacion.jsp", request, response);
                sesion.invalidate(); // reinicia el carrito
            }
        }
        catch(ServletException | IOException e){
                e.printStackTrace();
        }         
    }

    public void registrar(HttpSession sesion, Carrito carrito, HttpServletRequest request, HttpServletResponse response) {
        try{
            String nombreNuevo = request.getParameter("nombre");
            String correoNuevo = request.getParameter("email");
            String contrasenaNueva = request.getParameter("contrasena");
            String tipoTarjeta = request.getParameter("tipoTarjeta");
            String numeroTarjeta = request.getParameter("numeroTarjeta");

            //carrito = (Carrito) sesion.getAttribute("carrito");

            int userIdNuevo = UsuarioDAO.insertarUsuario(nombreNuevo, correoNuevo, contrasenaNueva);
            TarjetaDAO.insertarTarjeta(userIdNuevo, tipoTarjeta, numeroTarjeta);

            PedidoDAO.insertarPedido(userIdNuevo, carrito.getTotal());
            request.setAttribute("nombre", nombreNuevo);
            request.setAttribute("total", carrito.getTotalFormateado());
            
            gotoPage("/confirmacion.jsp", request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public void cerrar(HttpSession sesion, HttpServletRequest request, HttpServletResponse response) {
        try{
            sesion.invalidate();
            response.sendRedirect(request.getContextPath() + "/index.html");
        }catch(IOException e){
            e.printStackTrace();
        }
    }

    public void index(HttpServletRequest request, HttpServletResponse response) {
        try{
            // Llamada al JSP
            gotoPage("/formulario.jsp", request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
        
    }

    private void gotoPage(String address, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Creamos objeto RequestDispatcher
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        //getServletContext().getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }

}
