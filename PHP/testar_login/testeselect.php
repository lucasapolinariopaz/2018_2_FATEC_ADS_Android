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
	
	$sql = "SELECT cod_prod,nome,preco,categoria,quantidade FROM produto"; 
			
$result = $conn->query($sql);
if ($result->num_rows > 0) { 
   while ($registro=mysqli_fetch_array($result)) 
	{
		    $temp = array(); 
			$temp['cod_prod'] = $registro['cod_prod']; 
			$temp["nome"] = $registro['nome'];
			$temp['preco'] = $registro['preco'];
			$temp['categoria'] = $registro['categoria'];
			$temp['quantidade'] = $registro['quantidade'];
			array_push($response, $temp);
           
            $response["erro"]=false;
		    
			
	}
	mysqli_free_result($result);	
}  
else{
	$response["mensagem"]="Não ha produtos";
} 
     echo json_encode($response);
	
    $conn->close();
	} 
?>