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
		//Cadastrar novo produto
		$sql_insert_produto="INSERT INTO produto(nome,preco,Id_categoria_fk,quantidade) 
		values ('$nome_prod','$preco_prod','$categ_prod','$qnt_prod')";
 
   //If de insert do novo produto
//if($nome_prod!='')	
//{
	$query=mysqli_query($conn,$sql_insert_produto);
		if(!$query){
			
			//$response["mensagem_erro_insert"]="Ops!!Erro ao cadastrar";
             $response["mensagem_insert"]="Ops!!Erro ao cadastrar cadastrar";
				   }
				   else{
					   
					   //$response["erro"]=false;
						$response["mensagem_insert"]="Sucesso ao cadastrar";
					}	
//}				  
				   echo json_encode($response);
				   $conn->close();

}


?>













































