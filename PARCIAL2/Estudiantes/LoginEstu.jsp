<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interfaz de Estudiante</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            color: #333;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            align-items: center;
            justify-content: center;
            background-image: url('../img/estrella.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }

        /* Estilos del formulario */
        form {
            background-color: rgba(255, 255, 255, 0.7);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            text-align: center;
            margin: 50px auto;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
        }

        label {
            display: block;
            margin-bottom: 15px;
            text-align: left;
            font-size: 16px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
            font-size: 16px;
        }

        /* Estilos para los botones */
        #btnSubmit, #btnBack, #btnColorful {
            background-color: #2da78ddb;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
            font-size: 18px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s;
        }

        #btnSubmit:hover, #btnBack:hover, #btnColorful:hover {
            background-color: #333;
        }

        /* Pulsación al hacer clic */
        #btnSubmit:active, #btnBack:active, #btnColorful:active {
            transform: translateY(2px);
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <form action="" method="post" style="margin-top: 50px;">
        <h2>Iniciar Sesión como Estudiante</h2>
        <label for="usuario">Correo:</label>
        <input type="text" id="usuario" name="usuario" required>
        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required>
        <input type="hidden" name="modifica" value="SI">
        <input type="submit" id="btnColorful" value="Iniciar Sesión"><br><br>
        <a href="../index.html" style="text-decoration: none;">
            <button type="button" id="btnColorful">Regresar</button>
        </a>
    </form>

    <c:if test="${param.modifica != null}">
        <sql:query var="result" dataSource="${proyecto}">
            SELECT id, correo, contrasena FROM estudiantes WHERE correo = ? AND contrasena = ?
            <sql:param value="${param.usuario}" />
            <sql:param value="${param.contrasena}" />
        </sql:query>
        
        <c:choose>
            <c:when test="${not empty result.rows}">
            <%-- Guardar el id del estudiante en la sesión --%>
            <c:set var="idEstudiante" value="${result.rows[0].id}" scope="session" />
            <% response.sendRedirect("index.jsp"); %>
            </c:when>
            <c:otherwise>
                <%-- Mostrar un mensaje de error --%>
                <div style="margin-top: 20px; background-color: #ffdddd; border: 1px solid #f44336; color: #f44336; padding: 15px; border-radius: 5px;">
                    <strong>Error:</strong> Usuario y/o contraseña incorrectos. Inténtalo de nuevo.
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>
</body>
</html>
