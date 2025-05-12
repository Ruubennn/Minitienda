<!-- pago.jsp -->
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>
<%@page import="practica6_ruben_reysouto.Producto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE HTML>
<html>
<head>
  <title>Pago - Modo Disco</title>
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
      width: 50%;
      box-shadow: 0 0 20px #00ffff;
      color: #0ff;
    }
    th, td {
      border: 1px solid #00ffff;
      padding: 20px;
      font-size: 1.2em;
    }
    th {
      background-color: #333;
      text-shadow: 0 0 10px #ff00ff;
    }
    a {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background: #ff00ff;
      color: white;
      text-decoration: none;
      border-radius: 30px;
      box-shadow: 0 0 20px #ff00ff;
      transition: transform 0.2s, box-shadow 0.2s;
      font-weight: bold;
    }
    a:hover {
      transform: scale(1.1);
      box-shadow: 0 0 30px #00ffff;
    }
    form {
      background-color: rgba(0,0,0,0.6);
      padding: 30px;
      margin: 30px auto;
      width: 40%;
      border-radius: 20px;
      box-shadow: 0 0 30px #ff00ff;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    form label {
      margin: 10px 0 5px;
      font-weight: bold;
      text-shadow: 0 0 10px #00ffff;
    }
    form input[type="text"],
    form input[type="email"],
    form input[type="password"] {
      width: 80%;
      padding: 10px;
      border: none;
      border-radius: 15px;
      margin-bottom: 15px;
      background: #333;
      color: #0ff;
      box-shadow: inset 0 0 10px #00ffff;
      font-size: 1em;
    }
    form input[type="submit"] {
      background: #00ffff;
      color: #000;
      border: none;
      padding: 12px 30px;
      border-radius: 30px;
      font-size: 1em;
      font-weight: bold;
      cursor: pointer;
      box-shadow: 0 0 20px #00ffff;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    form input[type="submit"]:hover {
      transform: scale(1.1);
      box-shadow: 0 0 30px #ff00ff;
      background: #ff00ff;
      color: white;
    }
  </style>
</head>
<body>
  <h2>Caja</h2>

  <div>
    <table>
      <tr>
        <th>TOTAL A PAGAR</th>
      </tr>
      <tr>
        <td style='text-align: center; font-size: 18px;'>
          ${carrito.totalFormateado}
        </td>
      </tr>
    </table>
  </div>

  <form action="tienda" method="post">
    <input type="hidden" name="action" value="confirmar">
    
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" required>
    
    <label for="email">Correo Electrónico:</label>
    <input type="email" name="email" id="email" required>
    
    <label for="contrasena">Contrasena:</label>
    <input type="password" name="contrasena" id="contrasena" required>
    
    <input type="submit" value="Confirmar compra">
  </form>
</body>
</html>
