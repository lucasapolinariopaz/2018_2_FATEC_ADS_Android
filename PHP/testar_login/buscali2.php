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
 $cpf_clie=$_POST['cpf_cliente'];

$sql = "SELECT * from cliente where cpf_cli='$cpf_clie'";   
 
		$result = $conn->query($sql);

    if ($result->num_rows > 0) 
	{
		$registro=mysqli_fetch_array($result);
       // $response["registros"]=$result->num_rows;
        $response["erro"]=false;
		$response["cod_clii"]=$registro['cod_cli'];
		$response["nome_clii"]=$registro['nome_cli'];
		$response["cpf_clii"]=$registro['cpf_cli'];
		$response["enderecoo"]=$registro['endereco'];
		$response["num_enderecoo"]=$registro['num_endereco'];
		$response["cidade_uff"]=$registro['cidade_uf'];
		$response["bairroo"]=$registro['bairro'];
		$response["telefonee"]=$registro['telefone'];
		$response["celularr"]=$registro['celular'];
		
    } else {
    $response["mensagem"]="Clientente Não existe";
        
    } 
	echo json_encode($response);
    $conn->close();
	} 
?>