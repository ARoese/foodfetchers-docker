<html>
        <head>
                <title>php info</title>
        </head>
        <body>
            <?php
                include_once "DButils.php";
                $dbconn = getDefaultDB();
                if (pg_connection_status($dbconn) === PGSQL_CONNECTION_OK) {
                    echo "Connection status ok <br>";
                } else {
                    echo "Connection status bad <br>";
                }
                
                $query = pg_query($dbconn, "SELECT * FROM recipes");
                print_r(pg_fetch_all($query));
                pg_close($dbconn)
            ?>
        </body>
</html>
