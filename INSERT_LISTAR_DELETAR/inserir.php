<?php

$nome = $_POST["Nome"];
$email = $_POST["Email"];

$conn = new mysqli("localhost", "root", "senaisp", "Livraria");

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

echo "
<style>
    .btn-voltar {
        display: inline-block;
        padding: 10px 20px;
        margin-top: 15px;
        background-color: #007BFF;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-family: Arial, sans-serif;
        font-weight: bold;
        border: none;
        cursor: pointer;
    }
    .btn-voltar:hover {
        background-color: #0056b3;
    }
</style>
";

$sql = "INSERT INTO usuarios (nome, email) VALUES ('$nome', '$email')";
if ($conn->query($sql) === TRUE) {
    echo "Dados salvos com sucesso!";
} else {
    echo "Erro: " . $conn->error;
}

echo "<br><a href='index.html' class='btn-voltar'>Adicionar</a>";
echo "<br><a href='listar.php' class='btn-voltar'>Ir para a lista</a>";
// header("Location: index.html"); // ou index.php, dependendo do seu arquivo principal 
exit;
$conn->close();

?>

