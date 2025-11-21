<?php 
$title = '09 - Class Abstract';
$description = 'A class that cannot be instantiated, only extended from.';

include_once 'template/header.php';
echo '<section>';

abstract class HumanBeing {

} 

$hm = new HumanBeing();


include_once 'template/footer.php';