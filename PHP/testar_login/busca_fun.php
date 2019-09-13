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

    $login = isset($_POST['cpf_func']) ? $_POST['cpf_func'] : '';
	$senha = isset($_POST['senha_fun']) ? $_POST['senha_fun'] : '';
	//$login = isset($_POST['cpf_func']) ? $_POST['cpf_func'] : '';
	//$senha = isset($_POST['senha_fun']) ? $_POST['senha_fun'] : '';
	
		 //Logar no aplicativo
        $sql = "SELECT * FROM funcionario where cpf_func='$login'"; 
   
 
		$result = $conn->query($sql);

    if ($result->num_rows > 0) 
	{
		$registro=mysqli_fetch_array($result);
       // $response["registros"]=$result->num_rows;
        $response["erro"]=false;
		$response["login"]=$registro['cpf_func'];
		$response["senha"]=$registro['senha_fun'];
		$response["perfil"]=$registro['id_per_fk'];
		$response["id_fun"]=$registro['id_fun'];
		$response["nome"]=$registro['nome'];
		
    } else {
    $response["mensagem"]="Usuário Não existe";
        
    } 
	echo json_encode($response);
    $conn->close();
	} 
?>















