<?php

//use \PDO;
//use \PDOException;

class Connect
{
    private const HOST = "localhost";
    private const DBNAME = "projeto";
    private const USER = "root";
    private const PASSWD = "";

    private const OPTIONS = [
        PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4",    // Define utf8
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Todos os erros serão tratados como exceptions
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,         // Os dados das tabelas serão retornados como objetos
        PDO::ATTR_CASE               => PDO::CASE_NATURAL       // O CASE do nome das colunas das tabelas será igual ao do banco de dados
    ];

    private static $instance;

    /**
     * @return PDO
     */
    public static function getInstance(): PDO
    {
        if (empty(self::$instance)) {
            try {
                self::$instance = new PDO(
                    "mysql:host=" . self::HOST . ";dbname=" . self::DBNAME,
                    self::USER,
                    self::PASSWD,
                    self::OPTIONS
                );

                return self::$instance;

            } catch (PDOException $exception) {
                die("<h1>Whoops... Erro ao conectar {$exception->getMessage()}</h1>");
            }
        } else {
            return self::$instance;
        }
    }

    /**
     * Bloqueia que instancias e filhas desta classe alterem o construtor e o clone.
     */

    final private function __construct()
    {
    }

    final protected function __clone()
    {
    }
}