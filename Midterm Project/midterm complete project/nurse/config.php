<?php
   #$host        = "host = 127.0.0.1";
   #$port        = "port = 5432";
   #$dbname      = "dbname = hospitaldb";
   #$user        = "user = postgres";
   #$password    = "password = root";
   

   $link = pg_pconnect('host=localhost dbname=hospitaldb user=postgres password=root');
   #$db = pg_connect( "$host $port $dbname $user $password"  );

   //if(!$link) {
   //   echo "Error : Unable to open database\n";
   //} else {
   //   echo "Opened database successfully\n";
   //}
?>
