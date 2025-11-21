<?php
$title = '04 - Collaboration';
$description = "Objects working together by calling each other's methods";

include_once 'template/header.php';
echo '<section>';

class Evolve
{
    public function evolvePokemon($origin, $evolution)
    {
        echo "<ul><li>$origin ➡ $evolution</li></ul>";
    }
}
class pokemon
{
    private $origin;
    private $evolution;
    private $collaboration;

    public function __construct($origin, $evolution)
    {
        $this->origin = $origin;
        $this->evolution = $evolution;
        // collaboration
        $this->collaboration = new Evolve;
    }

    public function nextLevel()
    {
        $this->collaboration->evolvePokemon($this->origin, $this->evolution);
    }
}

$pk1 = new pokemon('Pichu','pikachu');
$pk1->nextLevel();
$pk1 = new pokemon('Pikachu','Raichu');
$pk1->nextLevel();

$pk2 = new pokemon('Squirtle','Wartortle');
$pk2->nextLevel();
$pk2 = new pokemon('Wartortle','Blastoise');
$pk2->nextLevel();

$pk3 = new pokemon('Bulbasaur','Ivysaur');
$pk3->nextLevel();
$pk3 = new pokemon('Ivysaur','Venusaur');
$pk3->nextLevel();

include_once 'template/footer.php';
