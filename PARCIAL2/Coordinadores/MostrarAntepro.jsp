<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mostrar Anteproyectos</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
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
            background-color: #2da78ddb;
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
    <h1>Lista de AnteProyectos</h1><br>
    <sql:query var="result" scope="request" dataSource="${proyecto}">
        select ideasproyecto.id, ideasproyecto.descripcion, ideasproyecto.id_director, 
        ideasproyecto.id_evaluador, ideasproyecto.id_estudiante, ideasproyecto.fecha_creacion,
        ideasproyecto.fecha_limite from ideasproyecto 
    </sql:query>
    <table border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Titulo</th>
            <th>DIRECTOR</th>
            <th>EVALUADOR</th>
            <th>ESTUDIANTE</th>
            <th>FECHA CREACION</th>
            <th>FECHA LIMITE</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="fila" items="${result.rows}">
            <tr>
            <form id="form-${fila.id}" action="MostrarAntepro.jsp" method="post" class="eliminar-form">
            <input type="hidden" name="id" value="${fila.id}">
                <td><c:out value="${fila.id}"/></td>
                <td><c:out value="${fila.descripcion}"/></td>
                <td><c:out value="${fila.id_director}"/></td>
                <td><c:out value="${fila.id_evaluador}"/></td>
                <td><c:out value="${fila.id_estudiante}"/></td>
                <td><c:out value="${fila.fecha_creacion}"/></td>
                <td><c:out value="${fila.fecha_limite}"/></td>
                <td><button type="submit" class="button eliminar-button" data-ced="${fila.id}">Eliminar</button></td>
            </form>
            </tr>
        </c:forEach>
        </tbody>
    </table><br>
    <a href="Antepro.jsp" class="button">Nuevo AnteProyecto</a><br>
    <a href="index.jsp" class="button">Regresar</a>
    <c:if test="${param.id != null}">
    <sql:update var="result" dataSource="${proyecto}">
        DELETE FROM ideasproyecto
        WHERE id = '${param.id}'
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
