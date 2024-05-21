<!DOCTYPE html>
<html>
    <head>
        <title> User-specific session information </title>
    </head>
    <body>
        
        <?php
            session_start();
            print_r($_SESSION);
            echo "<br/>";
            
            if(isset($_SESSION["userid"])){
                echo "user info in database: <br/>";
                $userid = $_SESSION["userid"];
                include_once "DButils.php";
                $db = getDefaultDB();
                
                $query = "SELECT * FROM customers WHERE userid='$userid'";
                $res = pg_query($db, $query);
                $row = pg_fetch_assoc($res);
                print_r($row);
            }
        ?>
        
    </body>
</html>