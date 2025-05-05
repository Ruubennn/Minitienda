<!-- pago.jsp -->
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>
<%@page import="practica6_ruben_reysouto.Producto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Pago</title>
</head>

<body bgcolor="#FDF5E6">
	<h2 style='text-align: center; font-weight: bold;'>Caja</h2>
	
		<div style='text-align: center;'>
			<table border='1' style='margin: 0 auto; background-color: #FFFFFF;'>
				<tr>
					<th>TOTAL A PAGAR</th>
				</tr>
				
				<tr>
					<td style='text-align: center; font-size: 18px;'> 
						<!-- FASE I -->
						<%--
							List<Producto> carrito = (List<Producto>) request.getAttribute("carrito");
							double total = 0;
							if(carrito != null){
								for(Producto p : carrito){
									total += p.getPrecioTotal();
								}
							}
							out.print(total);
						--%>
						
						${carrito.totalFormateado}  <!-- FASE II -->
					</td>
				</tr>
			</table>
		</div>
		
		<div style='margin-top: 10px; text-align: center;'>
			<a href='index.html' style='color: purple; font-weight: bold;'>Pagar y volver a la pagina principal</a>
		</div>
	
</body>
</html>
