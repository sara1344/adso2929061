<?php
$title = '05 - parameters';
$description = 'Values passed into a method to customize its operation.';

include_once 'template/header.php';
echo '<section>';

class Country
{
    public $name;
    public function __construct($name)
    {
        $this->name = $name;
    }
}
class FifaWorldCup
{
    private $country;
    private $year;
    private $winner;

    # Country and year are mandatory parameters
    # Winner is optional
    public function __construct($country, $year, $winner = "Brazil")
    {
        $this->country = $country;
        $this->year = $year;
        $this->winner = $winner;
    }
    public function showEvent()
    {
        echo "<ul>
            <li style='display: flex; flex-direction:column'>
                <div><b>Country:</b> {$this->country->name}</div>
                <div><b>Year:</b> {$this->year}</div>
                <div><b>Winner:</b> {$this->winner}</div>
            </li>
            </ul>
            <br>";
    }
}

$country = new Country('Italy');
$worlcup = new FifaWorldCup($country, 1990, 'Germany');
$worlcup->showEvent();

$country = new Country('USA');
$worlcup = new FifaWorldCup($country, 1994);
$worlcup->showEvent();

$country = new Country('France');
$worlcup = new FifaWorldCup($country, 1998, 'France');
$worlcup->showEvent();

$country = new Country('Qatar');
$worlcup = new FifaWorldCup($country, 2012, 'Argentina');
$worlcup->showEvent();




include_once 'template/footer.php';
