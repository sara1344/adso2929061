<?php 
$title = '07 - Overwrite Method';
$description = "Redefining a parent class's method in the child class.";

include_once 'template/header.php';
echo '<section>';

class VideoGame {
    protected $name;
    protected $platform;

    public function __construct($name, $platform) {
        $this->name = $name;
        $this->platform = $platform;
    }

    public function showVideoGame() {
        echo "Platform: {$this->platform}</li></ul><br> ";
    }
}

class Game2 extends VideoGame {
    public function showVideoGame() {
        echo "<ul><li>Name: {$this->name} <br>";
        parent::showVideoGame();
    }
}

$gm = new Game2('Hollow Knight: Silk Song', 'Nintendo Switch');
$gm->showVideoGame();

$gm = new Game2('Metroid Prime 4', 'Nintendo Switch');
$gm->showVideoGame();

$gm = new Game2('Death Stranding 2', 'Play Station 5');
$gm->showVideoGame();

$gm = new Game2('Expedition 33', 'Xbox Series X');
$gm->showVideoGame();


include_once 'template/footer.php';