<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Usuario</title>
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
    <h1>Registro de Usuario</h1>
    <form action="tienda" method="post">
        <input type="hidden" name="action" value="registrar">
        
        <input type="text" name="nombre" placeholder="Nombre Completo" required><br>
        <input type="text" name="email" placeholder="Correo Electrónico" required><br>
        <input type="password" name="contrasena" placeholder="Contraseña" required><br>
        
        <select name="tipoTarjeta" required>
            <option value="">Seleccione tipo de tarjeta</option>
            <option value="Visa">Visa</option>
            <option value="MasterCard">MasterCard</option>
            <option value="Amex">American Express</option>
        </select><br>
        
        <input type="text" name="numeroTarjeta" placeholder="Número de Tarjeta" required><br>
        
        <input type="submit" value="Registrarse y Confirmar Compra">
    </form>

    <form action="index.html" method="get">
        <input type="submit" value="Volver al Inicio" class="boton-volver">
    </form>
    
   
</body>
</html>
