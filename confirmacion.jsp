
<%@ page isELIgnored="false" %>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page session="true" %>
<%@page import="practica6_ruben_reysouto.Producto" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Confirmacion de compra</title>
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

    table {
      margin: 20px auto;
      border: none;
    }

    th font {
      font-size: 3em;
      text-shadow: 0 0 10px #ff00ff, 0 0 20px #00ffff;
    }

    h2 {
      font-size: 2.5em;
      text-shadow: 0 0 15px #ff00ff, 0 0 30px #00ffff;
      margin-top: 50px;
    }

    p {
      font-size: 1.5em;
      text-shadow: 0 0 5px #00ffff;
      margin: 20px 0;
    }

    hr {
      border: 0;
      height: 2px;
      background: #fff;
      margin: 40px 0;
      box-shadow: 0 0 10px #ff00ff;
    }

    img {
      width: 100px;
      height: 100px;
    }
    form {
            margin: 50px auto;
            padding: 30px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 20px;
            width: 300px;
            box-shadow: 0 0 20px #00ffff;
        }

        input[type="text"], input[type="password"], select {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            font-size: 1em;
            box-shadow: 0 0 10px #00ffff;
            background-color: #222;
            color: #0ff;
        }

        input[type="submit"] {
            background: #ff00ff;
            border: none;
            padding: 15px 30px;
            border-radius: 30px;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            box-shadow: 0 0 20px #ff00ff;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        input[type="submit"]:hover {
            transform: scale(1.1);
            box-shadow: 0 0 30px #00ffff;
        }
  </style>
</head>
<body>

  <table>
    <tr> 
      <th><img src="https://cdn-icons-png.flaticon.com/512/727/727218.png" alt="Music"></th>
      <th><font>Confirmación de compra</font></th>
      <th><img src="https://cdn-icons-png.flaticon.com/512/727/727218.png" alt="Music"></th>
    </tr>
  </table>
  <hr>

  <h2>Compra confirmada</h2>
  <p>Gracias <b>${nombre}</b> por tu compra.</p>
  <p>Importe total: <b>${total} €</b></p>

  <hr>
  
  <form action="tienda" method="post">
    <input type="hidden" name="action" value="cerrar">
    <input type="submit" value="Volver al Inicio" class="boton-volver">
</form>




</body>
</html>
