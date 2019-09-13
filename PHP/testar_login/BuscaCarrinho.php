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
	
	$sql="SELECT cod_car,cod_prod, idpprod, valor_unitario, unidade, val_total FROM carrinho";
	$sqlvltot="select sum(val_total) as valorf from carrinho";
	$result2 = $conn->query($sqlvltot);
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
		$tem["mensagem"]="Não há produtos";	
		
}	
   $totalValor=mysqli_fetch_assoc($result2);
   $totalValorf=$totalValor['valorf'];
	$tem["valor_total_carrinho"]=$totalValorf ;  

	echo json_encode($tem);
	$conn->close();
} 
?>















