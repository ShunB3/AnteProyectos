<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mostrar Coordinadores</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h1 {
            font-size: 32px; /* Tamaño del título */
            color: #333; /* Color del texto */
            margin-bottom: 20px; /* Espacio entre el título y la tabla */
            text-align: center; /* Centrar el texto */
            text-transform: uppercase; /* Convertir texto a mayúsculas */
            letter-spacing: 2px; /* Espaciado entre letras */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #2da78ddb;
        }

        .button {
            background-color: #2da78ddb; /* Cambia el color del botón */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 5px;
        }

        .button:hover {
            background-color: #199379; /* Cambia el color al pasar el mouse */
        }

        @media screen and (max-width: 768px) {
            table {
                width: 90%;
            }

            .button {
                padding: 8px 16px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Lista de Coordinadores</h1><br>
    <sql:query var="result" scope="request" dataSource="${proyecto}">
        Select coordinador.ced, coordinador.nombres as nombres, coordinador.apellidos as apellidos,
        coordinador.usuario as usuario, coordinador.contrasena as contrasena from coordinador
    </sql:query>
    <table border="1">
        <thead>
        <tr>
            <th>Cedula</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Usuario</th>
            <th>Contraseña</th>
            <center><th colspan="2">Acciones</th></center>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="fila" items="${result.rows}">
            <tr>
            <form id="form-${fila.ced}" action="MostrarCoordinador.jsp" method="post" class="eliminar-form">
            <input type="hidden" name="ced" value="${fila.ced}">
                <td><c:out value="${fila.ced}"/></td>
                <td><c:out value="${fila.nombres}"/></td>
                <td><c:out value="${fila.apellidos}"/></td>
                <td><c:out value="${fila.usuario}"/></td>
                <td><c:out value="${fila.contrasena}"/></td>
                <td><a href="EditarCoordinador.jsp?ced=${fila.ced}" class="button">Editar</a></td>
                <td><button type="submit" class="button eliminar-button" data-ced="${fila.ced}">Eliminar</button></td>
            </form>
            </tr>
        </c:forEach>
        </tbody>
    </table><br>
    <a href="AgregarCoordinador.jsp?id=${fila.id}" class="button">Nuevo Profesor</a><br>
    <a href="index.jsp" class="button">Regresar</a>

    <c:if test="${param.ced != null}">
    <sql:update var="result" dataSource="${proyecto}">
        DELETE FROM coordinador
        WHERE ced = '${param.ced}'
        AND id_Administrador = 101110111;
    </sql:update>
    <script>
    // Función para recargar la página
    function recargarPagina() {
        location.reload();
    }

    // Asignar la función recargarPagina al evento 'submit' del formulario
    document.querySelectorAll('.eliminar-form').forEach(form => {
        form.addEventListener('submit', recargarPagina);
    });
    </script>
</c:if>
</div>
</body>
</html>
