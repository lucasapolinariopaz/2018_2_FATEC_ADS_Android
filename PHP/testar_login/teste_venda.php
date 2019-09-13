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
$fm_pg=$_POST['fmpag'];

$insert_venda="insert into venda (form_pg,cod_cli)values('$fm_pg','$codigo')";
	$query=mysqli_query($conn,$insert_venda);
		if(!$query){			
			$response["mensagem"]="Ops!!Erro ao realizar venda"; 
				   }
				   else{
					   $response["erro"]=false;
						$response["mensagem"]="Sucesso ao Executar venda";
					}	
				  
				   echo json_encode($response);
				   $conn->close();
}














?>