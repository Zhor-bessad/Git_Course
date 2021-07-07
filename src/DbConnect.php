<?php
   
   class DbConnect {
       private $host ='172.17.0.1:8081' ;
       private $dbname ='db';
       private $user ='root';
       private $pass ='root';

       public function connect(){
           try{
               $conn = new PDO('mysql:host =' .$this->host .'; dbname=' . $this->dbname, $this->user, $this->pass) ;
               $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION) ;
               return $conn ;
           } catch(PDOException $e){
               echo 'Database error: ' . $e->getMessage();
           }
       }
   }