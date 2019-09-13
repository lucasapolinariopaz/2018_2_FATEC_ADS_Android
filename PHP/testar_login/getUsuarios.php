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

	$login = isset($_POST['login']) ? $_POST['login'] : '';
	$senha = isset($_POST['senha']) ? $_POST['senha'] : '';
	
		 //Logar no aplicativo
		$sql = "SELECT * FROM usuario where login='$login' and senha='$senha'"; 
		//$sql = "SELECT * FROM usuario "; 
		//if de logar	
 
		$result = $conn->query($sql);

    if ($result->num_rows > 0) 
	{
		$registro=mysqli_fetch_array($result);
        $response["registros"]=$result->num_rows;
        $response["erro"]=false;
		$response["login"]=$registro['login'];
		$response["senha"]=$registro['senha'];
		$response["perfil"]=$registro['id_fk'];
    } else {
    $response["mensagem"]="Usuário Não existe";
        
    } 
	echo json_encode($response);
    $conn->close();
   
} 
?>

