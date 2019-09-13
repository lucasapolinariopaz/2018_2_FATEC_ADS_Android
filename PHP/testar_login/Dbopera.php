<?php

class DbOpe{
	private $con;
 
    function __construct()
    {
        require_once 'DbConnect.php';
        $db = new DbConnect();
        $this->con = $db->connect();
    }
	public function getProd(){
$stmt = $this->con->prepare("SELECT cod_prod,nome,preco,categoria,quantidade FROM produto");
$stmt->execute();
$stmt->bind_result($cod_prod,$nome,$preco,$categoria,$quantidade);
$prod=array();
while($stmt->fetch()){
	        $temp = array(); 
			$temp['cod_prod'] = $cod_prod; 
			$temp['nome'] = $nome; 
			$temp['preco'] = $preco;
			$temp['categoria'] = $categoria; 
			$temp['quantidade'] = $quantidade;
			array_push($prod, $temp);
}
return $prod;
}
}







?>