<?php
$title = '09 - Class Abstract Renombrado';
$description = 'A class that cannot be instantiated, only extended from.';

include_once 'template/header.php';
echo '<section>';


abstract class BaseDeDatos {
    private $host = 'localhost';
    private $dbname = 'pokeadso';
    private $user = 'root';
    private $pass = '';
    protected $conexion;

    public function __construct() {
        $this->conectar();
    }

    protected function conectar() {
        $dsn = "mysql:host={$this->host};dbname={$this->dbname};charset=utf8mb4";

        try {
            $this->conexion = new PDO($dsn, $this->user, $this->pass);
            $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Error de conexión: " . $e->getMessage());
        }
    }

    protected function desconectar(){
        $this->conexion = null;
    }
}

class GestorPokemones extends BaseDeDatos {

    public function listarPokemones() {
        try {
            $sql = "SELECT id, name, type FROM pokemons ORDER BY id";
            $stmt = $this->conexion->query($sql);
            $pokemones = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $salida="<table class='nuevetable'>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Tipo</th>
                            </tr>
                        </thead>
                        <tbody>";

            foreach ($pokemones as $pk){
                $salida.="<tr>
                            <td>{$pk['id']}</td>
                            <td>{$pk['name']}</td>
                            <td>{$pk['type']}</td>
                        </tr>";
            }

            $salida.='</tbody></table>';

            return $salida;
        } catch (PDOException $e) {
            return "Error al consultar datos: " . $e->getMessage();
        } finally {
            $this->desconectar();
        }
    }
}

$gestor = new GestorPokemones();
echo $gestor->listarPokemones();



include_once 'template/footer.php';
?>