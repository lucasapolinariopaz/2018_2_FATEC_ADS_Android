<?php
header('Content-Type: text/html; charset=utf-8');
    
if($_SERVER['REQUEST_METHOD']=='POST'){	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);    	 
    mysqli_set_charset($conn, "utf8");
    if ($conn->connect_error) { // Será que é uma boa?
       die("Ops, falhou....: " . $conn->connect_error);
    }

$codigo=$_POST['cod_cli'];

$consulta = "delete from cliente where cod_cli='$codigo'";
$tem=array();
$tem["erro"]=true;

if(mysqli_query($conn, $consulta))
{    $tem["erro"]=false;
     $tem["Sucesso"]= "successo!";
}
else
{    $tem["Sucessoerr"]= "Erro ao deletar!";
    echo mysqli_error($conn);
}
 
echo json_encode($tem);
$conn->close();
}
?>