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
	$nome_prod =  isset($_POST['nome_prod']) ? $_POST['nome_prod'] : '';
	$preco_prod = isset($_POST['preco_prod']) ? $_POST['preco_prod'] : '';
	$categ_prod = isset($_POST['categ_prod']) ? $_POST['categ_prod'] : '';
	$qnt_prod=    isset($_POST['qnt_prod']) ? $_POST['qnt_prod'] : '';
		
$sql_sel="select cod_categoria from categoria where nome_categoria='$categ_prod'";
 	
$result = $conn->query($sql_sel);

 if ($result->num_rows > 0) 
	{
		$registro=mysqli_fetch_array($result);
        $valor=$result->num_rows;
		$valor=$registro['cod_categoria'];		
    }	
 if ($valor==''){
	  $response["mensagem_insert"]="categoria vazia";
 
 }
	else{
		$sql_insert_produto="INSERT INTO produto(nome,preco,Id_categoria_fk,quantidade) 
		values ('$nome_prod','$preco_prod','$valor','$qnt_prod')";
		$query=mysqli_query($conn,$sql_insert_produto);
		if(!$query){
			
			$response["mensagem_insert"]="Ops!!Erro ao cadastrar cadastrar";
            
				   }
				   else{
					    $response["erro"]=false;
						$response["mensagem_insert"]="Sucesso ao cadastrar"; 
					  
					}	
 }       
    
	echo json_encode($response);
	//echo $valor;
    $conn->close();
	} 




?>