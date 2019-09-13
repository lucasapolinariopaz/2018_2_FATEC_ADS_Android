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

		//Atualizar cliente
$sql_atu_cli="update cliente set nome_cli='$nome_cli',cpf_cli='$cpf_cli',endereco='$endereco',num_endereco='$num_endereco',
cidade_uf='$cidade_uf',bairro='$bairro',telefone='$telefone',celular='$celular' where cod_cli='$cod_cli'" ;

	$query=mysqli_query($conn,$sql_atu_cli);
		if(!$query){			
			$response["mensagem"]="Ops!!Erro ao Atualizar"; 
				   }
				   else{
					   $response["erro"]=false;
						$response["mensagem"]="Sucesso ao Atualizar";
					}	
				  
				   echo json_encode($response);
				   $conn->close();
}
?>