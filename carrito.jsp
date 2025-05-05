<!-- carrito.jsp -->
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>
<%@page import="practica6_ruben_reysouto.Producto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Carrito de la compra</title>
</head>

<body bgcolor="#FDF5E6">
	<h2 style='text-align: center; font-weight: bold;'>Carrito de la compra</h2>
	
	<div style='display: flex; justify-content: center;'>
		<table border='1' style='background-color: white; border-collapse: collapse;'>
        		<tr>
        			<th>TITULO DEL CD</th>
        			<th>Cantidad</th>
        			<th>Importe</th>
        			<th>Accion</th>
        		</tr>
        		
        		<!--		FASE I
        		<%--
        			List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
        			double total = 0;
        			
        			for(int i=0; i < carrito.size(); i++){
        				Producto p = carrito.get(i);
        				total += p.getPrecioTotal();
        			
        		%>
        		
        		<tr>
        			<td> <%= p.getNombre() %> </td>
        			<td> <%= p.getCantidad() %></td>
        			<td> <%= p.getPrecioTotal() %></td>
        			<td> <a href="tienda?action=delete&index=<%= i %>">Eliminar</a> </td>
        		</tr>
        		
        		<%
        			}
        		--%>
        		-->
        		
        		<!-- FASE II -->
        		<c:forEach var="producto" items="${carrito.productos}" varStatus="status">
        			<tr>
        				<td>${producto.nombre}</td>
        				<td>${producto.cantidad}</td>
        				<td>${producto.totalFormateado}</td>
        				<td> <a href="tienda?action=delete&index=${status.index}">Eliminar</a> </td>
        			</tr>
        		</c:forEach>	
        		
        </table>
	</div>
	
	<div style='text-align: center; margin-top: 30px;'>
		<form action='index.html' method='get' style='display: inline;'>
			<input type='submit' value='' style='background: url("imagenes/carrito.png") no-repeat center; background-size: contain; width: 100px; height: 100px; border: none;' title='Seguir comprando'>
		</form>
		
		<form action='tienda' method='post' style='display: inline; margin-left: 20px;'>
			<input type='hidden' name='action' value='pagar'>
			<input type='submit' value='' style='background: url("imagenes/caja.png") no-repeat center; background-size: contain; width: 100px; height: 100px; border: none;' title='Pagar'>
		</form>
	</div>
</body>
</html>
