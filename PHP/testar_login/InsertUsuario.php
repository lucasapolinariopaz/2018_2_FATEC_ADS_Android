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
	$nome = isset($_POST['login']) ? $_POST['login'] : '';
	$sen = isset($_POST['senha']) ? $_POST['senha'] : '';
	$id_fk = isset($_POST['id_fk']) ? $_POST['id_fk'] : '';	
		//Cadsstrar novo usuario
		$sql_insert_login="INSERT INTO usuario(login,senha,id_fk) values ('$nome','$sen','$id_fk')";
 
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













































