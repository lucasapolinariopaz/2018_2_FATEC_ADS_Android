<?php
header('Content-Type: text/html; charset=utf-8');

$response=array();
$tem["erro"]=true;

    
if($_SERVER['REQUEST_METHOD']=='POST'){
	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,
    	 $HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error) { // Será que é uma boa?

       die("Ops, falhou....: " . $conn->connect_error);
    }

    //$busca = isset($_POST['buscaprod']) ? $_POST['buscaprod'] : '';	
	$busca = $_POST['buscaprod'];	
	if($busca!="")
{
    //$sql = "SELECT nome,preco,cod_prod,quantidade,Id_categoria_fk  FROM produto WHERE nome like '".$busca."%'"; 
	$sql="SELECT p.cod_prod, p.nome, p.preco, c.nome_categoria, p.quantidade FROM produto p,categoria c WHERE p.id_categoria_fk=c.cod_categoria and  p.nome like '".$busca."%'";
   $result = $conn->query($sql);
       $tem=array(); 
	   if($result->num_rows > 0)
{
		while($row[] = $result->fetch_assoc()) 
{	
		$tem["produtos"] = $row;		
		$tem["erro"]=false;	
}
}  
	   else
{		
		$tem["erro"]=true;
		$tem["mensagem"]="Não há produtos";		     
}	
}
	echo json_encode($tem);
	$conn->close();
} 
?>















