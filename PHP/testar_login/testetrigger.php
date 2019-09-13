<?php
header('Content-Type: text/html; charset=utf-8');

$response=array();
$response["erro"]=true;

    
if($_SERVER['REQUEST_METHOD']=='POST'){
	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,
    	 $HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) { // Será que é uma boa?

       die("Ops, falhou....: " . $conn->connect_error);
    }
	
		//Cadsstrar novo usuario
		$sql_insert_login="INSERT INTO carrinho ( cod_prod, fkvenda, idpprod, unidade, val_total, valor_unitario)
		VALUES ('2', '1', 'fffffffffffffff', '3', '30.00', '4)";

	$query=mysqli_query($conn,$sql_insert_login);
		if(!$query){
			
			$response["mensagem_erro_insert"]="Ops!!Erro ao cadastrar";
 
				   }
				   else{
					   $response["erro"]=false;
						$response["mensagem_insert"]="Sucesso ao cadastrar";
					}	
			  
				   echo json_encode($response);
				   $conn->close();

}


?>