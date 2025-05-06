<!-- pago.jsp -->
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>
<%@page import="practica6_ruben_reysouto.Producto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  </style>
</head>
<body>
  <h2> Caja</h2>

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

  <div>
    <a href='index.html'>Pagar y volver a la pagina principal</a>
  </div>
</body>
</html>
