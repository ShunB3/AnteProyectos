<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mostrar Alumnos</title>
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
            font-size: 32px; /* Ajusta el tamaño del título */
            color: #333; /* Cambia el color del texto */
            margin-bottom: 20px; /* Ajusta el margen inferior */
            text-align: center; /* Centra el texto horizontalmente */
            text-transform: uppercase; /* Convierte el texto en mayúsculas */
            letter-spacing: 2px; /* Ajusta el espaciado entre letras */
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
            background-color: #2da78ddb;
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
            background-color: #199379;
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
    <h1>Lista de Alumnos</h1><br>
    <sql:query var="result" scope="request" dataSource="${proyecto}">
        Select estudiantes.id, estudiantes.nombres as nombres, estudiantes.apellidos as apellidos,
        estudiantes.correo as correo, estudiantes.contrasena as contrasena
        from estudiantes
    </sql:query>
    <table border="1">
        <thead>
        <tr>
            <th>Cedula</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Correo</th>
            <th>Contraseña</th>
            <center><th colspan="2">Acciones</th></center>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="fila" items="${result.rows}">
            <tr>
            <form id="form-${fila.id}" action="MostrarAlumno.jsp" method="post" class="eliminar-form">
            <input type="hidden" name="id" value="${fila.id}">
                <td><c:out value="${fila.id}"/></td>
                <td><c:out value="${fila.nombres}"/></td>
                <td><c:out value="${fila.apellidos}"/></td>
                <td><c:out value="${fila.correo}"/></td>
                <td><c:out value="${fila.contrasena}"/></td>
                <td><a href="EditarAlumno.jsp?ced=${fila.id}" class="button">Editar</a></td>
                <td><button type="submit" class="button eliminar-button" data-ced="${fila.id}">Eliminar</button></td>
            </form>
            </tr>
        </c:forEach>
        </tbody>
    </table><br>
    <a href="AgregarAlumno.jsp?id=${fila.id}" class="button">Nuevo Alumno</a><br>
    <a href="index.jsp" class="button">Regresar</a>

    <c:if test="${param.id != null}">
    <sql:update var="result" dataSource="${proyecto}">
        DELETE FROM estudiantes
        WHERE id = '${param.id}'
        AND id_administrador = 101110111;
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
