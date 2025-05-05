<!-- formulario.jsp -->
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Musica para DAA</title>
</head>

<body bgcolor="#FDF5E6">
	<h2> Tienda de CDs </h2>
	
	<form action='tienda' method='post'>
    	<input type='hidden' name='action' value='add'>
            CD: <select name='cd'>
            	<option>Yuan | The Guo Brothers | China | $14.95</option>
				<option>Drums of Passion | Babatunde Olatunji | Nigeria | $16.95</option>
				<option>Kaira | Tounami Diabate| Mali | $16.95</option>
				<option>The Lion is Loose | Eliades Ochoa | Cuba | $13.95</option>
				<option>Dance the Devil Away | Outback | Australia | $14.95</option>
				<option>Record of Changes | Samulnori | Korea | $12.95</option>
				<option>Djelika | Tounami Diabate | Mali | $14.95</option>
				<option>Rapture | Nusrat Fateh Ali Khan | Pakistan | $12.95</option>
				<option>Cesaria Evora | Cesaria Evora | Cape Verde | $16.95</option>
				<option>DAA | GSTIC | Spain | $50.00</option>
            </select>
            
        Cantidad: <input type='text' name='cantidad' value='1'>
    	<input type='submit' value='Añadir al carrito'>
    </form>
    <a href='tienda?action=view'>Ver carrito</a>
        	

</body>
</html>
