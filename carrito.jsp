<!-- carrito.jsp -->
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>
<%@page import="practica6_ruben_reysouto.Producto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
  <title>Carrito de la compra - Modo Disco</title>
  <style>
    body {
      margin: 0;
      font-family: 'Arial', sans-serif;
      background: linear-gradient(270deg, #ff00ff, #0000ff, #00ffff);
      background-size: 600% 600%;
      animation: discoBackground 10s ease infinite;
      color: #fff;
      text-align: center;
    }
    @keyframes discoBackground {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }
    h2 {
      text-shadow: 0 0 10px #ff00ff, 0 0 20px #00ffff;
      margin-top: 20px;
    }
    table {
      background-color: #222;
      border-collapse: collapse;
      margin: 20px auto;
      width: 80%;
      box-shadow: 0 0 20px #00ffff;
    }
    th, td {
      border: 1px solid #00ffff;
      padding: 15px;
      color: #0ff;
    }
    th {
      background-color: #333;
      text-shadow: 0 0 10px #ff00ff;
    }
    a {
      color: #ff00ff;
      text-decoration: none;
      font-weight: bold;
    }
    a:hover {
      color: #00ffff;
    }
    .button-container {
      text-align: center;
      margin-top: 30px;
    }
    .disco-button {
      background: none;
      border: none;
      cursor: pointer;
      width: 100px;
      height: 100px;
      background-size: contain;
      background-repeat: no-repeat;
      margin: 0 20px;
      transition: transform 0.3s ease;
    }
    .disco-button:hover {
      transform: scale(1.1);
    }
  </style>
</head>
<body>
  <h2> Carrito de la compra</h2>

  <div>
    <table>
      <tr>
        <th>TITULO DEL CD</th>
        <th>Cantidad</th>
        <th>Importe</th>
        <th>Accion</th>
      </tr>
      <c:forEach var="producto" items="${carrito.productos}" varStatus="status">
        <tr>
          <td>${producto.nombre}</td>
          <td>${producto.cantidad}</td>
          <td>${producto.totalFormateado}</td>
          <td><a href="tienda?action=delete&index=${status.index}">Eliminar</a></td>
        </tr>
      </c:forEach>
    </table>
  </div>

  <div class="button-container">
    <form action='index.html' method='get' style='display: inline;'>
      <button type='submit' class='disco-button' style='background-image: url("imagenes/carrito.png");' title='Seguir comprando'></button>
    </form>
    <form action='tienda' method='post' style='display: inline;'>
      <input type='hidden' name='action' value='pagar'>
      <button type='submit' class='disco-button' style='background-image: url("imagenes/caja.png");' title='Pagar'></button>
    </form>
  </div>
</body>
</html>
