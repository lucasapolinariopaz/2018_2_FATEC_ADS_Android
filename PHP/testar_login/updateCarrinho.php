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
	$cod_car=isset($_POST['cod_car']) ? $_POST['cod_car'] : '';	
	$qnt_prod=  isset($_POST['qnt_prod']) ? $_POST['qnt_prod'] : '';
	
	
$sql_sel="select valor_unitario from carrinho where cod_car='$cod_car'";
 	
$result = $conn->query($sql_sel);

 if ($result->num_rows > 0) 
	{
		$registro=mysqli_fetch_array($result);
        $valor=$result->num_rows;
		$valor=$registro['valor_unitario'];
		
    }	
	
	$valor_total = $valor * $qnt_prod;
	//echo $valor_total;
//	echo $valor;
	echo $cod_car;
	if ($valor==''){
	  $response["mensagem_insert"]="campo vazio";
 }
	else{
	$sql_atualiza_carrinho=" UPDATE carrinho SET valor_unitario='$valor',
	unidade='$qnt_prod',val_total='$valor_total' WHERE cod_car='$cod_car'";
                             
	$query=mysqli_query($conn,$sql_atualiza_carrinho);
		if(!$query){
             $response["mensagem_insert"]="Ops!!Erro ao Atualizar";
				   }
				   else{					   
					    $response["erro"]=false;
						$response["mensagem_insert"]="Produto Atualizado";
					}	
	}					
				   echo json_encode($response); 
				   $conn->close();
}
?>