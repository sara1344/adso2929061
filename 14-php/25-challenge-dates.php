<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcular Edad</title>
    <style>
        /* Estilos Generales y del Cuerpo */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6; /* Fondo gris muy claro para sobriedad */
            color: #333; /* Texto principal oscuro */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        /* Contenedor Principal para centrar el contenido y darle un marco */
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Sombra suave para elevación */
            max-width: 450px;
            width: 100%;
            text-align: center;
        }

        /* Títulos */
        h2 {
            color: #1a73e8; /* Un azul corporativo y sobrio */
            margin-bottom: 5px;
            font-weight: 600;
        }
        h2:first-of-type {
             margin-top: 0;
        }

        /* Párrafo de Instrucción */
        p {
            color: #555;
            margin-bottom: 25px;
            font-size: 1.1em;
        }

        /* Formulario */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px; /* Espacio entre elementos del formulario */
            align-items: stretch;
        }

        /* Etiqueta */
        label {
            font-weight: 500;
            color: #444;
            text-align: left;
            margin-bottom: -10px; /* Acercar la etiqueta al input */
        }

        /* Campo de Fecha */
        input[type="date"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
            transition: border-color 0.3s;
            cursor: pointer;
        }

        input[type="date"]:focus {
            border-color: #1a73e8; /* Borde azul al enfocar */
            outline: none;
        }

        /* Botón de Calcular */
        input[type="submit"] {
            background-color: #1a73e8;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 1.1em;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.1s;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #155cb7; /* Color más oscuro al pasar el ratón */
        }

        input[type="submit"]:active {
            transform: scale(0.99); /* Efecto de "presión" al hacer clic */
        }
        
        /* Resultado */
        .resultado {
            margin-top: 30px;
            padding: 15px;
            background-color: #e6f0ff; /* Fondo azul claro para destacar el resultado */
            border-radius: 8px;
            border-left: 5px solid #1a73e8; /* Borde de color para énfasis */
        }

        .resultado h3 {
            color: #1a73e8;
            margin: 0;
            font-size: 1.5em;
            font-weight: 700;
        }

    </style>
</head>
<body>
    <div class="container">
        <h2>¿No sabes qué edad tienes?</h2>
        <h2>¿Quieres saber cuántos años tienen tus amigos, familiares o pareja?</h2>
        <p>Introduce la fecha de nacimiento y calcularemos la edad exacta.</p>

        <form method="post">
            <label for="fecha_nacimiento">Fecha de nacimiento:</label>
            <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
            <input type="submit" value="Calcular Edad">
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            // Asegúrate de que el campo no esté vacío (aunque "required" lo maneja en el cliente, es buena práctica)
            if (!empty($_POST["fecha_nacimiento"])) {
                try {
                    $fecha_nacimiento = new DateTime($_POST["fecha_nacimiento"]);
                    $hoy = new DateTime();
                    $edad = $hoy->diff($fecha_nacimiento)->y;

                    echo '<div class="resultado">';
                    echo "<h3>Tienes $edad años.</h3>";
                    echo '</div>';
                } catch (Exception $e) {
                    // Manejo de errores por si la fecha es inválida
                    echo '<div class="resultado" style="background-color: #ffcccc; border-left-color: #cc0000;">';
                    echo '<h3>Error: Fecha no válida.</h3>';
                    echo '</div>';
                }
            }
        }
        ?>
    </div>
</body>
</html>