<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Coordinador</title>
    <style>
        /* Reset de estilos */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            color: #333;
            overflow-x: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('../img/traslucido.jpg'); /* Agregar fondo de página */
            background-repeat: no-repeat; /* Evitar repetición del fondo */
            background-size: cover; /* Ajustar tamaño del fondo */
        }

        /* Contenedor principal */
        .container {
            width: 40%;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.5);
        }

        /* Estilos del formulario */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 18px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select,
        textarea {
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
            width: 100%;
        }

        input[type="checkbox"] {
            margin-right: 5px;
            transform: translateY(2px);
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #2da78ddb;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #333;
        }

        /* Estilos del encabezado */
        header {
            background-color: #2da78ddb;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }

        header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        /* Estilos del pie de página */
        footer {
            background-color: #2da78ddb;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            border-radius: 0 0 10px 10px;
        }
        .button {
            background-color: #2da78ddb;
            color: #fff;
            padding: 15px 20px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Agregar Coordinador</h1>

    <form id="formProfesor" action="" method="POST">
        
        <label for="ced">Cedula:</label>
        <input type="text" id="ced" name="ced" required>

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required>

        <label for="correo">Usuario:</label>
        <input type="email" id="correo" name="correo" required>
        
        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required>
        
        <!-- Cambié el botón dentro del formulario -->
        <input type="submit" value="Guardar">
        <br>
    </form>
    <c:if test="${param.nombre != null}">
        <sql:update var="result" dataSource="${proyecto}">
            INSERT INTO
            coordinador (ced,nombres,apellidos,usuario,contrasena,id_Administrador)
            VALUES(${param.ced},
            '${param.nombre}',
            '${param.apellido}',
            '${param.correo}',
            '${param.contrasena}',
            ${101110111});
        </sql:update>
        <!-- JavaScript para redireccionar después de la actualización -->
        <script>
            // Esperar a que el documento se cargue completamente
            document.addEventListener("DOMContentLoaded", function() {
                // Enviar formulario cuando se cargue completamente la página
                document.getElementById("formProfesor").submit();
                // Redireccionar después de enviar el formulario
                window.location.href = "MostrarCoordinador.jsp";
            });
        </script>
    </c:if>
</div>
</body>
</html>
