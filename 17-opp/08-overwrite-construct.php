<?php 
$title = '08 - Overwrite Construct';
$description = 'Redefining the constructor method in a child class.';

include_once 'template/header.php';
echo '<section>';

class VideoGame {
    protected $name;
    protected $platform;
    protected $year;

    public function __construct($name, $platform) {
        $this->name = $name;
        $this->platform = $platform;
    }
}

class Game extends VideoGame {
    public function __construct($name, $platform, $year) {
        $this->name = $name;
        $this->platform = $platform;
        $this->year = $year;
    }

    public function showVideoGame() {
        echo "<ul><li>
                    Name: {$this->name} <br>
                    Platform: {$this->platform}<br>
                    Year: {$this->year}<br>
            </ul></li>";
    }
}

$gm = new Game('Hollow Knight: Silk Song', 'Nintendo Switch', 2025);
$gm->showVideoGame();

include_once 'template/footer.php';