<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar Anteproyectos por Estudiante</title>
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
    <h1>Lista de AnteProyectos por Estudiante</h1><br>
    <form action="" method="get" style="text-align: center;">
    <div style="display: inline-block;">
        <label for="cedula" style="font-size: 18px; color: #333; margin-bottom: 10px; display: block;">Ingrese la cédula del estudiante:</label>
        <input type="text" id="cedula" name="cedula" style="padding: 8px; font-size: 16px; border-radius: 5px; border: 1px solid #ccc; margin-bottom: 10px;">
        <br>
        <button type="submit" class="button" style="margin-right: 10px;">Buscar</button>
        <a href="index.jsp" class="button" style="margin-left: 10px;">Regresar</a>
    </div>
    </form><br>
    <c:if test="${not empty param.cedula}">
    <sql:query var="result" scope="request" dataSource="${proyecto}">
        select ideasproyecto.id, ideasproyecto.descripcion, ideasproyecto.id_director, 
        ideasproyecto.id_evaluador, ideasproyecto.id_estudiante, ideasproyecto.fecha_creacion,
        ideasproyecto.fecha_limite, ideasproyecto.estado 
        from ideasproyecto
        where ideasproyecto.id_estudiante = ${param.cedula}
    </sql:query>
    </c:if>
    <c:forEach var="fila" items="${result.rows}">
    <c:if test="${param.cedula == fila.id_estudiante}">
    <table border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Titulo</th>
            <th>ID_DIRECTOR</th>
            <th>ID_EVALUADOR</th>
            <th>ID_ESTUDIANTE</th>
            <th>FECHA CREACION</th>
            <th>FECHA LIMITE</th>
            <th>ESTADO</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><c:out value="${fila.id}"/></td>
        <td><c:out value="${fila.descripcion}"/></td>
        <td><c:out value="${fila.id_director}"/></td>
        <td><c:out value="${fila.id_evaluador}"/></td>
        <td><c:out value="${fila.id_estudiante}"/></td>
        <td><c:out value="${fila.fecha_creacion}"/></td>
        <td><c:out value="${fila.fecha_limite}"/></td>
        <td><c:out value="${fila.estado}"/></td>
        <td>
            <form action="" method="post" class="eliminar-form">
                <input type="hidden" name="id" value="${fila.id}">
                <button type="submit" class="button eliminar-button" data-ced="${fila.id}">Eliminar</button>
            </form>
        </td>
    </tr>
        </tbody>
    </table>
</c:if>
</c:forEach>
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
