<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Calificacion al Estudiante</title>
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
        .APROBADO{
font-size: 15px;
        }
        .REPROBADO{
font-size: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Calificacion al Estudiante</h1><br>
    <sql:query var="result" scope="request" dataSource="${proyecto}">
        select ideasproyecto.id, ideasproyecto.descripcion, ideasproyecto.id_director, 
        ideasproyecto.id_evaluador, ideasproyecto.id_estudiante, ideasproyecto.calificadirector , ideasproyecto.calificaevaluador , ideasproyecto.url, estudiantes.nombres from ideasproyecto
        inner join estudiantes on ideasproyecto.id_estudiante = estudiantes.id
        where ideasproyecto.calificadirector = 'APROBADO';
    </sql:query>
    <c:choose>
        <c:when test="${empty result.rows}">
            <p style="font-size: 22px;">Esperando la Calificación del Director</p><br>
            <center>
                <a href="index.jsp" class="button">Regresar</a><br>
            </center>
        </c:when>

        <c:otherwise>
            <c:forEach var="fila" items="${result.rows}">
                <c:if test="${fila.calificadirector != null}">
                    <c:if test="${fila.calificaevaluador == null}">
                        <!-- Si el campo 'url' está vacío, mostrar el formulario para ingresar una URL -->
                        <form id="form-${fila.id}" action="MostrarAntepro.jsp" method="post" class="eliminar-form">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th type="hidden">ID</th>
                                        <th>TITULO</th>
                                        <th>DIRECTOR</th>
                                        <th>EVALUADOR</th>
                                        <th>ESTUDIANTE</th>
                                        <th>NOMBRE DEL ESTUDIANTE</th>
                                        <th>CALIFICACION DEL DIRECTOR</th>
                                        <th>CALIFICACION DEL EVALUADOR</th>
                                        <th>URL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <input type="hidden" name="id" value="${fila.id}">
                                        <td type="hidden"><c:out value="${fila.id}"/></td>
                                        <td><c:out value="${fila.descripcion}"/></td>
                                        <td><c:out value="${fila.id_director}"/></td>
                                        <td><c:out value="${fila.id_evaluador}"/></td>
                                        <td><c:out value="${fila.id_estudiante}"/></td>
                                        <td><c:out value="${fila.nombres}"/></td>
                                        <td><c:out value="${fila.calificadirector}"/></td>
                                        <td>
                                            <select id="calificaevaluador" name="calificaevaluador" for="calificaevaluador">
                                                <option value="APROBADO" class="APROBADO">APROBADO</option>
                                                <option value="REPROBADO" class="REPROBADO">REPROBADO</option>
                                            </select>
                                        </td>
                                        <td><a href="${fila.url}"><c:out value="${fila.url}"/></a></td>

                                    </tr>
                                </tbody>
                            </table>
                            <center>
                                <input type="submit" value="Guardar" class="button">
                                <a href="index.jsp" class="button">Regresar</a><br>
                            </center>
                        </form>
                    </c:if>
                    <c:if test="${fila.calificaevaluador != null}">
                        <!-- Si el campo 'url' está vacío, mostrar el formulario para ingresar una URL -->
                        <form id="form-${fila.id}" action="MostrarAntepro.jsp" method="post" class="eliminar-form">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th type="hidden">ID</th>
                                        <th>TITULO</th>
                                        <th>ID_DIRECTOR</th>
                                        <th>ID_EVALUADOR</th>
                                        <th>ID_ESTUDIANTE</th>
                                        <th>NOMBRE DEL ESTUDIANTE</th>
                                        <th>CALIFICACION DEL DIRECTOR</th>
                                        <th>CALIFICACION DEL EVALUADOR</th>
                                        <th>URL</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <input type="hidden" name="id" value="${fila.id}">
                                        <td type="hidden"><c:out value="${fila.id}"/></td>
                                        <td><c:out value="${fila.descripcion}"/></td>
                                        <td><c:out value="${fila.id_director}"/></td>
                                        <td><c:out value="${fila.id_evaluador}"/></td>
                                        <td><c:out value="${fila.id_estudiante}"/></td>
                                        <td><c:out value="${fila.nombres}"/></td>
                                        <td><c:out value="${fila.calificadirector}"/></td>
                                        <td><c:out value="${fila.calificaevaluador}"/></td>
                                        <td><a href="${fila.url}"><c:out value="${fila.url}"/></a></td>

                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </c:if>
                    <!-- Actualizar la calificación del director cuando se envíe el formulario -->
                    <c:if test="${not empty param.calificaevaluador}">
                        <sql:update var="updateResult" dataSource="${proyecto}">
                            update ideasproyecto set
                            calificaevaluador = '${param.calificaevaluador}' where id_evaluador IN (SELECT p.ced FROM profesor p); 
                        </sql:update>
                        <!-- JavaScript para redireccionar después de la actualización -->
                        <script>
                            window.location.href = "index.jsp";
                        </script>
                    </c:if>
                </c:if>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <center>
        <a href="index.jsp" class="button">Regresar</a><br>
    </center>
</div>
</body>
</html>