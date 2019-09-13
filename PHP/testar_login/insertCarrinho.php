
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
	$cod_prod=isset($_POST['cod_prod']) ? $_POST['cod_prod'] : '';
	$cod_venda=999;
	$nome_prod =  isset($_POST['nome_prod']) ? $_POST['nome_prod'] : '';
	$qnt_prod=  isset($_POST['qnt_prod']) ? $_POST['qnt_prod'] : '';
	$valor_unitario = isset($_POST['valor_unitario']) ? $_POST['valor_unitario'] : '';
	$valor_total = $valor_unitario * $qnt_prod;
	//$valor_total = isset($_POST['valor_total']) ? $_POST['valor_total'] : '';
		
$sql_insert_produto="INSERT INTO carrinho (cod_prod, fkvenda,idpprod, valor_unitario, unidade, val_total)
		                       values('$cod_prod','$cod_venda','$nome_prod','$valor_unitario','$qnt_prod','$valor_total')";

	$query=mysqli_query($conn,$sql_insert_produto);
		if(!$query){
             $response["mensagem_insert"]="Ops!!Erro ao Cadastrar ao Carrinho";
				   }
				   else{					   
					    $response["erro"]=false;
						$response["mensagem_insert"]="Produto Adiconado ao Carrinho";
					}						
				   echo json_encode($response);
				   $conn->close();
}
?>













































