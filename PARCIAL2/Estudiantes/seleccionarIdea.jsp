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
            font-size: 32px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
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
        <c:set var="idEstudiante" value="${sessionScope.idEstudiante}" />

<sql:query var="proyectoAsignado" dataSource="${proyecto}">
    SELECT id FROM ideasproyecto WHERE id_estudiante = ${sessionScope.idEstudiante}
</sql:query>

<c:choose>
    <c:when test="${not empty proyectoAsignado.rows}">
        <h1>Ya tienes un proyecto asignado.</h1>
        <a href="index.jsp" class="button">Regresar</a>
    </c:when>
    <c:otherwise>
        <h1>Lista de AnteProyectos</h1><br>
        <sql:query var="result" scope="request" dataSource="${proyecto}">
            SELECT id, descripcion, id_director, id_evaluador, id_estudiante, estado 
            FROM ideasproyecto 
            WHERE id_estudiante IS NULL
        </sql:query>

        <c:choose>
            <c:when test="${empty result.rows}">
                <p>No hay proyectos disponibles en este momento.</p>
                <a href="index.jsp" class="button">Regresar</a>
            </c:when>
            <c:otherwise>
                <table border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Titulo</th>
                            <th>DIRECTOR</th>
                            <th>EVALUADOR</th>
                            <th>ESTUDIANTE</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="fila" items="${result.rows}">
                            <tr>
                                <td><c:out value="${fila.id}"/></td>
                                <td><c:out value="${fila.descripcion}"/></td>
                                <td><c:out value="${fila.id_director}"/></td>
                                <td><c:out value="${fila.id_evaluador}"/></td>
                                <td><c:out value="${fila.id_estudiante}"/></td>
                                <td>
                                    <form action="actualizar.jsp" method="post">
                                        <input type="hidden" name="id" value="${fila.id}">
                                        <input type="hidden" name="id_estudiante" value="${sessionScope.idEstudiante}">
                                        <button type="submit" class="button">Seleccionar</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table><br>
                <a href="index.jsp" class="button">Regresar</a>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
    </div>
</body>
</html>