<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interfaz de Administrador</title>
    <style>
        /* Reset de estilos */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Estilos generales */
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-image: url('../img/traslucido.jpg'); /* Fondo de imagen */
            background-size: cover; /* Ajusta el tamaño de la imagen para cubrir todo el fondo */
            color: #333;
            overflow-x: hidden;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Contenedor principal */
        .container {
            max-width: 1200px;
            margin: auto;
            padding: 100px;
            flex: 1;
        }

        /* Estilos de la tabla */
        table {
            width: 100%; /* Ajuste del ancho de la tabla */
            margin: 50px auto; /* Centrar la tabla en el contenedor */
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden; /* Oculta el contenido que se desborde */
        }
        th, td {
            border: 1px solid #ddd;
            padding: 0; /* Elimina el padding */
            transition: background-color 0.3s ease; /* Transición de color al pasar el ratón */
        }
        th {
            background-color: #2da78ddb; /* #2da78ddb */
            color: #fff;
        }
        td {
            background-color: #f5f5f5; /* Gris claro */
            cursor: pointer; /* Cambia el cursor al pasar por encima */
            border-radius: 10px; /* Borde redondeado */
            transition: box-shadow 0.3s ease; /* Transición de sombra al pasar el ratón */
        }
        td:hover {
            background-color: #ddd; /* Gris más oscuro al pasar el ratón */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Sombra al pasar el ratón */
        }

        /* Estilos del recuadro del título */
        h1 {
            background-color: #2da78ddb; /* Cambio del fondo a color #2da78ddb */
            color: #fff; /* Cambio del texto a color #2da78ddb */
            border: 2px solid #2da78ddb; /* Borde rosa */
            border-radius: 10px; /* Borde redondeado */
            padding: 10px 20px; /* Espaciado interno */
            text-align: center; /* Centra el texto */
        }

        /* Estilos del contenedor dentro de la celda */
        .cell-container {
            padding: 20px; /* Agrega un espacio interno */
            text-align: center; /* Centra el texto */
        }

        /* Estilos del enlace dentro del contenedor */
        .cell-container a {
            text-decoration: none; /* Elimina el subrayado del enlace */
            color: inherit; /* Hereda el color del texto */
        }

        /* Estilos del botón */
        .btn-container {
            text-align: center; /* Centra el botón */
            padding-top: 20px; /* Espacio superior */
        }

        .btn {
            background-color: #2da78ddb; /* Verde */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #199379; /* Verde más oscuro al pasar el ratón */
        }
    </style>
</head>
<body>

<div class="container">
    <h1>CONFIGURACION DE CUENTAS</h1> <!-- Cambio del título -->
    <table>
        <tr>
            <td>
                <div class="cell-container">
                    <a href="MostrarProfesor.jsp">Agregar Profesor</a>
                </div>
            </td>
            <td>
                <div class="cell-container">
                    <a href="MostrarCoordinador.jsp">Agregar Coordinador</a>
                </div>
            </td>
            <td>
                <div class="cell-container">
                    <a href="MostrarAlumno.jsp">Agregar Alumno</a>
                </div>
            </td>
            <td>
          <!--      <div class="cell-container">
                    <a href="MostrarDirector.jsp">Agregar Director</a>
                </div>-->
            </td>
        </tr>
    </table><br><center>
    <td colspan="3" class="btn-container">
        <a href="../index.html"><button class="btn">Cerrar Sesion</button></a>
    </td></center>
</div>

</body>
</html>
