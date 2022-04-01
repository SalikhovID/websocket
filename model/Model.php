<?php

class Model
{
    private $_this;
    private $connection = 'pgsql:host=localhost;port=5432;dbname=websocket;';
    private $user = '';
    private $pass = '';

    public function __construct()
    {
        try {
            $dbh = new PDO($this->connection, $this->user, $this->pass);
            foreach($dbh->query('SELECT * from test') as $row) {
//                print_r($row);
            }
            $this->_this = $dbh;
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    public function getId($ip)
    {
        $sql = "SELECT * FROM chats WHERE remote_ip = '" . $ip. "'";
        $result = $this->_this->query($sql)->fetch(PDO::FETCH_ASSOC);

        if($result == false){
            $sql_insert = "INSERT INTO chats (remote_ip) VALUES ('".$ip."');";
            $this->_this->exec($sql_insert);
            return [
                'id' => $this->_this->lastInsertId(),
                'remote_ip' => $ip,
            ];
        }
        return $result;
    }

    public function saveMessage($message,$ip,$user_id)
    {
        $stmt = $this->_this->prepare("INSERT INTO user_messages (message,remote_ip,user_id)
                VALUES (:message,:remote_ip,:user_id)");
        $stmt->bindParam(':message', $message);
        $stmt->bindParam(':remote_ip', $ip);
        $stmt->bindParam(':user_id', $user_id);
        return $stmt->execute();
    }

    public function getAllMessages()
    {
        $sth = $this->_this->prepare('SELECT * FROM user_messages order by id ASC ');
        $sth->execute();
        return $sth->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function ipPrepare($ip)
    {
        $array = explode(':',$ip);
        return $array[0];
    }
}