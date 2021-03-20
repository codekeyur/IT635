<?php
#  session_start();
#  //$_SESSION["fname"]=$_GET["fname"];
#  extract($_POST);
#  $_SESSION['username'] = $_POST['uname'];
#  $pass=$_POST['pwd'];
#
#  $link = pg_pconnect('host=localhost dbname=hospitaldb user=postgres password=root');

#  $result = pg_query($link, "select * from receptionist where username='{$_SESSION['username']}'");

#  $row = pg_fetch_assoc($result);

#  $message = "YOU HAVE SUCCESFULLY LOGGED IN";

  //if(strcmp($_SESSION['username'],"admin")==0)
  
#   if($pass==$row['password'])
#  {
#	 echo  $message;
#	 #header('Location: recep.html');
#  }
#  else
#  {
#	 echo "please enter valid password and id";
#	 //header('Location: userlogin.html');	
#  }
#
?>


<?php
session_start();
error_reporting(0);
include("config.php");
if(isset($_POST['submit']))
{
$ret=pg_query($link,"SELECT * FROM receptionist WHERE username='".$_POST['username']."' and password='".md5($_POST['password'])."'");
$num=pg_fetch_array($ret);


 if($ret)
  {
         echo  "Login Successful.";
         #header('Location: recep.html');
  }
  else
  {
         echo "please enter valid password and username";
         //header('Location: userlogin.html');
  }

}
?>

