<?php

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

$conn = new mysqli("localhost", "root", "senaisp", "Livraria");
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET['id'];

// Preparar a declaração
$stmt = $conn->prepare("DELETE FROM usuarios WHERE cod_usuario = ?");
$stmt->bind_param("i", $id);

// Executar e verificar
if ($stmt->execute()) {
    echo "Usuário deletado com sucesso!";
} else {
    echo "Erro ao deletar: " . $stmt->error;
}
echo "<br><a href='listar.php' class='btn-voltar'>Voltar para a lista</a>";

$stmt->close();
$conn->close();

?>