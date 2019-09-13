<?php
header('Content-Type: text/html; charset=utf-8');

$response=Array();
 $response["erro"]=true;   
//if($_SERVER['REQUEST_METHOD']=='POST'){
	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,
    	 $HostPass, $DatabaseName);
    	 
    mysqli_set_charset($conn, "utf8");

    if ($conn->connect_error)
{ // Será que é uma boa?

       die("Ops, falhou....: " . $conn->connect_error);
}
	
	$sql = "SELECT * FROM usuario  ";
	$result = $conn->query($sql);


 if ($result->num_rows < 0) 
{
	$response["mensagem"]="Nenhum resultado!";
   
}
else 
{//$response["registros"]=$result->num_rows;
//echo $response["registros"];
?>
  
  <?php  while ($dados = mysqli_fetch_array($result)) 
{
    //$dados["registros"]=$result->num_rows; 
	//$nome = $dados["login"];
	//$estrel = $dados["id_fk"];
	$response["registros"]=$result->num_rows;
	$response["erro"]=false;
        $response["login"]=$dados['login'];
		$response["id_fk"]=$dados['id_fk'];
?>

 <?php } ?> 
 <?php echo json_encode($response);} 
 
$conn->close();?>



 