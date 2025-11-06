<?php
$title       = '25- Challenge Dates';
$description = 'crear una calculadora de edad que solicite al usuario su fecha de nacimiento y muestre su edad actual en años.';
include 'template/header.php';
echo "<section>";
?>

<body class="dates">
    <div class="container">
        <h3>Pon tu fecha de nacimiento y nosotros calcularemos la edad</h3>
        <form method="post">
            <label for="fecha_nacimiento">Fecha de nacimiento:</label>
            <input type="date" name="fecha_nacimiento" required>
            <input type="submit" value="Calcular">
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $fecha_nacimiento = new DateTime($_POST["fecha_nacimiento"]);
            $hoy = new DateTime();
            $edad = $hoy->diff($fecha_nacimiento)->y;
            echo '<div id="resultado-edad">';
            echo "<h3>Tienes $edad años.</h3>";
            echo '</div>';
            echo '<script>';
            echo 'const resultadoDiv = document.getElementById("resultado-edad");
        setTimeout(function() {
            if (resultadoDiv) {
                resultadoDiv.style.display = "none";
            }
        }, 4000);';
            echo '</script>';
        }
        ?>
        <?php include 'template/footer.php' ?>