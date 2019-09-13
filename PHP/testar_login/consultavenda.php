<?php
header('Content-Type: text/html; charset=utf-8');

$response=array();
$tem["erro"]=true;

    
if($_SERVER['REQUEST_METHOD']=='POST'){
	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,
    	 $HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) { // Será que é uma boa?

       die("Ops, falhou....: " . $conn->connect_error);
    }
	
	$sql="SELECT cod_venda,data,form_pg,cpfClivenda FROM venda";
	$result = $conn->query($sql);
       $tem=array(); 
	   if($result->num_rows > 0)
{
		while($row[] = $result->fetch_assoc()) 
{	
		$tem["produtos"] = $row;		
		$tem["erro"]=false;	
}
}  
	   else
{		
		$tem["erro"]=true;
		$tem["mensagem"]="Não há vendas";	
		
}	
 

	echo json_encode($tem);
	$conn->close();
} 
?>