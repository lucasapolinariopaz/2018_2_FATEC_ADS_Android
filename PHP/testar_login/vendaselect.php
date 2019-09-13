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
	$fpg =  isset($_POST['fpg']) ? $_POST['fpg'] : '';
	$cpf_cliv = isset($_POST['cpfClivenda']) ? $_POST['cpfClivenda'] : '';
	
		
$sql_sel="select cod_cli from cliente where cpf_cli='$cpf_cliv'";
 	
$result = $conn->query($sql_sel);

 if ($result->num_rows > 0) 
	{
		$registro=mysqli_fetch_array($result);
        $valor=$result->num_rows;
		$valor=$registro['cod_cli'];
		
    }	
 if ($valor==''){
	  $response["mensagem_insert"]="categoria vazia";
 
 }
	else{
		$sql_insert_venda="INSERT INTO venda(form_pg,cpfClivenda,cod_cli) 
										 values ('$fpg','$cpf_cliv','$valor')";
		$query=mysqli_query($conn,$sql_insert_venda);
		if(!$query){
			
			$response["mensagem_insert"]="Ops!!Erro ao cadastrar venda";
            
				   }
				   else{
					    $response["erro"]=false;
						$response["mensagem_insert"]="Venda realizada"; 
					  
					}	
 }       
    
	echo json_encode($response);
    $conn->close();
	} 




?>