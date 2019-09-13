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
	$cpf = isset($_POST['cpf']) ? $_POST['cpf'] : '';
	$sen = isset($_POST['senha']) ? $_POST['senha'] : '';
	$id_fk = isset($_POST['id_fk']) ? $_POST['id_fk'] : '';
	$nome = isset($_POST['nome']) ? $_POST['nome'] : '';
		//Cadsstrar novo usuario
		$sql_insert_login="INSERT INTO funcionario(cpf_func,senha_fun,id_per_fk,nome) 
		                                   values ('$cpf','$sen','$id_fk','$nome')";
 
   //If de inserte novo usuario
if($nome!='')	
{
	$query=mysqli_query($conn,$sql_insert_login);
		if(!$query){
			
			$response["mensagem_erro_insert"]="Ops!!Erro ao cadastrar";
 
				   }
				   else{
					   $response["erro"]=false;
						$response["mensagem_insert"]="Sucesso ao cadastrar";
					}	
}				  
				   echo json_encode($response);
				   $conn->close();

}


?>













































