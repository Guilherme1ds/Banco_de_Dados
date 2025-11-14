<?php 

// Cliente
$nome_cli = $_POST["nome_cliente"];
$id_cli = $_POST["id_cliente"];
$data_cli = $_POST["data_nasc"];
$cpf_cli = $_POST["cpf_cliente"];
$endereco_cli = $_POST["endereco_cliente"];

// Mecânicos
$nome_mec = $_POST["nome_mec"];
$id_mec = $_POST["id_mecanico"];
$data_mec = $_POST["data_nasc_mec"];
$cpf_mec = $_POST["cpf_mec"];
$endereco_mec = $_POST["endereco_mec"];

// Veículos
$modelo = $_POST["modelo"];
$marca = $_POST["marca"];
$ano = $_POST["ano"];
$cor = $_POST["cor"];
$id_veiculo = $_POST["id_veiculo"];

// Pecas
$categoria = $_POST["categoria"];
$quantidade = $_POST["quantidade"];
$preco_peca = $_POST["preco_peca"];
$id_peca = $_POST["id_peca"];
$nome_peca = $_POST["nome_peca"];
$descricao_peca = $_POST["descricao_peca"];

// Serviço
$id_servico = $_POST["id_servico"];
$descricao_servico = $_POST["descricao_servico"];
$nome_servico = $_POST["nome_servico"];
$preco_servico = $_POST["preco_servico"];
$tipo_servico = $_POST["tipo_servico"];

// OS
$prazo_inicial = $_POST["prazo_inicial"];
$descricao = $_POST["descricao"];
$id_os = $_POST["id_os"];
$

$conn = new mysqli("localhost", "root", "senaisp", "Oficina");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$sql_cliente = "INSERT INTO Clientes (nome_cliente, id_cliente, data_nasc, cpf_cliente, endereco_cliente) VALUES ('$nome_cli', '$id_cli', '$data_cli', '$cpf_cli', '$endereco_cliente')";
if ($conn->query($sql) === TRUE) {
    echo "Dados salvos com sucesso!";
} else {
    echo "Erro: " . $conn->error;
}

echo "<br><a href='index.html' class='btn-voltar'>Adicionar</a>";
exit;
$conn->close();

?>