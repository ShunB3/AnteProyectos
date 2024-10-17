<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar AnteProyecto</title>
</head>
<body>
    <h2>Editar AnteProyecto</h2>
    <div class="container">
    <c:if test="${param.Actualizar == null}">
    <sql:query var="result" dataSource="${proyecto}">
    SELECT fecha_creacion, fecha_limite FROM ideasproyecto WHERE id = ${param.id}
    </sql:query>
    </c:if>
    <c:forEach var="fila" items="${result.rows}">
        <form action="" method="post">
            <input type="hidden" id="id" name="id" value="<c:out value="${fila.id}" />">

            <label for="fechaCreacion">Fecha de Creación:</label>
            <input type="date" id="fechaCreacion" name="fechaCreacion" value="<c:out value="${fila.fecha_creacion}" />" required><br><br>

            <label for="fechaLimite">Fecha Límite de Entrega:</label>
            <input type="date" id="fechaLimite" name="fechaLimite" value="<c:out value="${fila.fecha_limite}" />" required><br><br>

            <input type="submit" value="Actualizar" name="Actualizar">
        </form>
    </c:forEach>
    <c:if test="${param.Actualizar != null}">
    <sql:update var="updateResult" dataSource="${proyecto}">
        UPDATE ideasproyecto
        SET fecha_creacion = '${param.fechaCreacion}',
            fecha_limite = '${param.fechaLimite}'
        WHERE id = ${param.id}
    </sql:update>

    <c:if test="${updateResult >= 1}">
        <% response.sendRedirect("MostrarAntepro.jsp"); %>
    </c:if>
    <c:if test="${updateResult == 0}">
        <p>No se pudo actualizar los datos.</p>
    </c:if>
    </div>
    </c:if>
</body>
</html>