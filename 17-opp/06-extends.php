<?php 
$title = '06 - Extends';
$description = 'Keyword for a class to inherit properties and methods from another.';

include_once 'template/header.php';
echo '<section>';

class Operation{
    protected $num1;
    protected $num2;

    public function __construct($num1,$num2)
    {
       $this->num1 = $num1;
       $this->num2 = $num2; 
    }
}

class Addition extends Operation{
    public function showResoult(){
        $resoult = $this->num1 + $this->num2;
        return "<ul><li>{$this->num1} + {$this->num2} = {$resoult}</li></ul>";
    }
}

class substraction extends Operation{
    public function showResoult(){
        $resoult = $this->num1 - $this->num2;
        return "<ul><li>{$this->num1} - {$this->num2} = {$resoult}</li></ul>";
    }
}

class Product extends Operation{
    public function showResoult(){
        $resoult = $this->num1 * $this->num2;
        return "<ul><li>{$this->num1} * {$this->num2} = {$resoult}</li></ul>";
    }
}


class Division extends Operation{
    public function showResoult(){
        $resoult = $this->num1 / $this->num2;
        return "<ul><li>{$this->num1} / {$this->num2} = {$resoult}</li></ul>";
    }
}

class Pow extends Operation{
    public function showResoult(){
        $resoult = $this->num1 ** $this->num2;
        return "<ul><li>{$this->num1} ** {$this->num2} = {$resoult}</li></ul>";
    }
}


$op1 = new Addition(16,32);
echo $op1->showResoult(); 

$op2 = new Substraction(512,256);
echo $op2->showResoult();

$op2 = new Product(16,8);
echo $op2->showResoult();

$op2 = new Division(2048,512);
echo $op2->showResoult();

$op2 = new Pow(8,4);
echo $op2->showResoult();


include_once 'template/footer.php';