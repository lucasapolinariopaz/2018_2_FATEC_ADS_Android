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
	$cod_cli = isset($_POST['cod_cli']) ? $_POST['cod_cli'] : '';
	$nome_cli = isset($_POST['nome_cli']) ? $_POST['nome_cli'] : '';
	$cpf_cli = isset($_POST['cpf_cli']) ? $_POST['cpf_cli'] : '';
	$endereco = isset($_POST['endereco']) ? $_POST['endereco'] : '';
	$num_endereco = isset($_POST['num_endereco']) ? $_POST['num_endereco'] : '';
	$cidade_uf = isset($_POST['cidade_uf']) ? $_POST['cidade_uf'] : '';
	$bairro = isset($_POST['bairro']) ? $_POST['bairro'] : '';
	$telefone = isset($_POST['telefone']) ? $_POST['telefone'] : '';
	$celular = isset($_POST['celular']) ? $_POST['celular'] : '';

		//Cadsstrar novo cliente
		$sql_insert_cli="INSERT INTO cliente(nome_cli,cpf_cli,endereco,num_endereco,cidade_uf,bairro,telefone,celular) 
		values ('$nome_cli','$cpf_cli','$endereco','$num_endereco','$cidade_uf','$bairro','$telefone','$celular')";
 
   //If de inserte novo cliente
if($nome_cli!='')	
{
	$query=mysqli_query($conn,$sql_insert_cli);
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