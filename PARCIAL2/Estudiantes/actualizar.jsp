<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<c:set var="id" value="${param.id}" />
<c:set var="idEstudiante" value="${param.id_estudiante}" />

<c:choose>
    <c:when test="${empty id or empty idEstudiante}">
        <script>alert('Parámetros incorrectos.'); window.history.back();</script>
    </c:when>
    <c:otherwise>
        <sql:update var="updateResult" dataSource="${proyecto}">
            UPDATE ideasproyecto
            SET id_estudiante = ${param.id_estudiante}
            WHERE id = ${param.id}
        </sql:update>
        
        <c:choose>
            <c:when test="${updateResult >= 1}">
                <script>alert('Proyecto seleccionado exitosamente.'); window.location.href = 'index.jsp';</script>
            </c:when>
            <c:otherwise>
                <script>alert('Error al seleccionar el proyecto.'); window.history.back();</script>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>