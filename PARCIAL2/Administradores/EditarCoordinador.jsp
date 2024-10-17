<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Coordinador</title>
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
            width: 50%; /* Cambiar ancho del contenedor */
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.7); /* Hacer el fondo semi-transparente */
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
            padding: 8px; /* Reducir aún más el espacio interno de los campos de entrada */
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #2da78ddb; /* Celeste suave */
            color: #fff;
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
            background-color: #2da78ddb; /* Celeste suave */
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
            background-color: #2da78ddb; /* Celeste suave */
            color: #fff;
            padding: 15px 0;
            text-align: center;
            border-radius: 0 0 10px 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Editar Coordinador</h1>
    <c:if test="${param.modifica == null}">
        <sql:query var="coordinadores" dataSource="${proyecto}">
            SELECT * FROM coordinador where ced = ?
            <sql:param value="${param.ced}">
            </sql:param>
        </sql:query>
    </c:if>
    <form action="" method="POST">
        <c:forEach var="itema" items="${coordinadores.rows}">
            <input type="hidden" id="ced" name="ced"  value="${itema.ced}" required>

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre"  value="${itema.nombres}" required>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido"  value="${itema.apellidos}" required>

            <label for="correo">Usuario:</label>
            <input type="email" id="correo" name="correo"  value="${itema.usuario}" required>
            
            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena"  value="${itema.contrasena}" required>
        </c:forEach>
        <input type="hidden" name="modifica" value="SI">
        <input type="submit" value="Guardar">
    </form>
    <c:if test="${param.modifica != null}">
        <sql:update var="result" dataSource="${proyecto}">
            update coordinador set
            nombres = '${param.nombre}',
            apellidos = '${param.apellido}',
            usuario = '${param.correo}',
            contrasena = '${param.contrasena}'
            where ced= ${param.ced}
        </sql:update>
        <%-- Redireccionar a MostrarCoordinador.jsp después de la actualización --%>
        <c:if test="${result > 0}">
        <% response.sendRedirect("MostrarCoordinador.jsp"); %>
        </c:if>
    </c:if>
</div>
</body>
</html>
