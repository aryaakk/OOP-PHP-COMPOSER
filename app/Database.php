<?php

namespace OOP\App;

class Database{
    protected static $hostname = "localhost";
    protected static $username = "root";
    protected static $password = "";
    protected static $database = "staditek2";

    public static $conn = null;

    public function __construct(){
        Database::setConnection();
    }

    public static function setConnection(){
        self::$conn = new \PDO(
            "mysql:host=".self::$hostname.";dbname=".self::$database, 
            self::$username, 
            self::$password
        );

        self::$conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }
}