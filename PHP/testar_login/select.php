<?php
header('Content-Type: text/html; charset=utf-8');
    
if($_SERVER['REQUEST_METHOD']=='POST'){	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);    	 
    mysqli_set_charset($conn, "utf8");
    if ($conn->connect_error) { // Será que é uma boa?
       die("Ops, falhou....: " . $conn->connect_error);
    }

$sql = "SELECT nome,preco,cod_prod,quantidade,Id_categoria_fk FROM produto ";

$result = $conn->query($sql);
$tem=array();
if ($result->num_rows >0) {
  
 while($row[] = $result->fetch_assoc()) {
 
 $tem["produtos"] = $row;
 
 $json = json_encode($tem);
 
 }
 
} else {
	$tem["mensagem"] = "Não há resultados.";

}
echo $json= json_encode($tem);
$conn->close();
}
?>