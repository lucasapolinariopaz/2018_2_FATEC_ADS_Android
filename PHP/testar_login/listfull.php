<?php
header('Content-Type: text/html; charset=utf-8');

//$response=array();
//$response["erro"]=true;

    
if($_SERVER['REQUEST_METHOD']=='POST'){
	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,
    	 $HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error)
{ // Será que é uma boa?

       die("Ops, falhou....: " . $conn->connect_error);
}	

$sql = "SELECT id_usu, login FROM usuario";
$query = $conn->query($sql);
while ($row = mysqli_fetch_assoc($query)) {
	$data[] = $row;
}
	$json =json_encode($data);
    echo $json;
 	 $conn->close();
}	
?>
