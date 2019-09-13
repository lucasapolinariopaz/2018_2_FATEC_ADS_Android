<?php
header('Content-Type: text/html; charset=utf-8');
 $tem["erro"]=true;   
if($_SERVER['REQUEST_METHOD']=='POST'){	
	include 'dbConnection.php';
    $conn = new mysqli($HostName, $HostUser,$HostPass, $DatabaseName);    	 
    mysqli_set_charset($conn, "utf8");
    if ($conn->connect_error) { // Será que é uma boa?
       die("Ops, falhou....: " . $conn->connect_error);
    }
$cpf_clie=$_POST['cpf_cliente'];

$sql = "SELECT cod_cli,nome_cli,cpf_cli,endereco,num_endereco,cidade_uf,bairro,telefone,celular from cliente where cpf_cli='$cpf_clie'";

$result = $conn->query($sql);
$tem=array();
if ($result->num_rows >0) {
  
 while($row[] = $result->fetch_assoc()) {
 
 $tem["cli"] = $row;
 $tem["erro"]=false;
 //$json = json_encode($tem);
 
 }
 
} else {
	$tem["erro"]=true;
	$tem["mensagem"] = "Não há resultados.";

}
echo $json= json_encode($tem);
$conn->close();
}
?>