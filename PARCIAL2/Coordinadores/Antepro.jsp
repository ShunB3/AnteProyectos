<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Asignación</title>
    <style>
        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f9f9f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('../img/traslucido.jpg'); /* Agregar fondo de página */
            background-repeat: no-repeat; /* Evitar repetición del fondo */
            background-size: cover; /* Ajustar tamaño del fondo */
        }

        form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px; /* Reducir el padding del formulario */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 800px; /* Aumentar el ancho máximo del formulario */
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px; /* Reducir el margen inferior de las etiquetas */
            font-weight: bold;
            font-size: 18px; /* Reducir el tamaño de fuente de las etiquetas */
        }

        select,
        input[type="text"],
        input[type="date"],
        input[type="submit"] {
            width: calc(100% - 32px);
            padding: 10px; /* Reducir el padding de los campos de entrada */
            margin-bottom: 15px; /* Reducir el margen inferior de los campos de entrada */
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px; /* Reducir el tamaño de fuente de los campos de entrada */
        }

        input[type="submit"] {
            background-color: #2da78ddb;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px; /* Ajustar el tamaño de fuente del botón */
            text-align: center;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #199379;
        }

        .date-input-container {
            position: relative;
        }

        .date-input-container input[type="date"] {
            width: calc(100% - 32px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .calendar-icon {
            width: 25px; /* Reducir el tamaño del icono del calendario */
            height: 25px; /* Reducir el tamaño del icono del calendario */
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
        }

        input[type="date"]::-webkit-inner-spin-button,
        input[type="date"]::-webkit-calendar-picker-indicator {
            display: none;
        }

        input[type="date"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
    </style>
</head>
<body>
<sql:query var="result" scope="request" dataSource="${proyecto}">
    Select profesor.nombre as nombre from profesor
</sql:query>
<form action="" method="post">
    <h2 style="text-align: center; font-size: 24px; margin-bottom: 20px;">Formulario de Asignación</h2>
    <label for="titulo">Título del Anteproyecto:</label>
    <input type="text" id="titulo" name="titulo" required>

    <label for="director">Director:</label>
    <select id="director" name="director" required>
        <c:forEach var="fila" items="${result.rows}">
            <option>${fila.nombre}</option>
        </c:forEach>
    </select>

    <label for="evaluador">Evaluador:</label>
    <select id="evaluador" name="evaluador" required>
        <c:forEach var="fila" items="${result.rows}">
            <option>${fila.nombre}</option>
        </c:forEach>
    </select>

    <label for="fechainicio">Fecha de Inicio:</label>
    <div class="date-input-container">
        <input type="date" id="fechainicio" name="fechainicio" required>
    </div>

    <label for="fechafinal">Fecha de Final:</label>
    <div class="date-input-container">
        <input type="date" id="fechafinal" name="fechafinal" required>
    </div>

    <input type="submit" value="Asignar">
    <input type="button" value="Regresar" onclick="window.history.back();" style="background-color: #2da78ddb; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 18px; text-align: center; width: calc(100% - 32px); padding: 10px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box;">
</form>

<c:if test="${param.titulo != null}">
    <sql:query var="directorId" dataSource="${proyecto}">
        SELECT ced FROM profesor WHERE nombre = '${param.director}';
    </sql:query>
    <sql:query var="evaluadorId" dataSource="${proyecto}">
        SELECT ced FROM profesor WHERE nombre = '${param.evaluador}';
    </sql:query>

    <c:if test="${param.director != param.evaluador}">
        <sql:update var="result" dataSource="${proyecto}">
            INSERT INTO ideasproyecto (descripcion, id_director, id_evaluador, fecha_creacion , fecha_limite)
            VALUES('${param.titulo}', '${directorId.rows[0].ced}', '${evaluadorId.rows[0].ced}', '${param.fechainicio}', '${param.fechafinal}');
        </sql:update>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                window.location.href = "MostrarAntepro.jsp";
            });
        </script>
    </c:if>
    <c:if test="${param.director == param.evaluador}">
        <script>
            alert("Seleccione datos diferentes para Evaluador y Director.");
        </script>
    </c:if>
</c:if>
</body>
</html>
