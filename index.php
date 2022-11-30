<?php

// namespace OOP\App;
require_once __DIR__.'/vendor/autoload.php';

use \OOP\App\Controllers;

$controller = new Controllers();

switch (@$_GET['page']) {   
    case 'findId':
        $controller->findHeader($_GET['id']);
        break;
    default:
        // $controller->index();
        var_dump($_GET['page']);
        break;
}

// $page = $_GET['page'];
// if($page == 'show'){
//     $controller->index();
// }else{
//     var_dump($page);
// }