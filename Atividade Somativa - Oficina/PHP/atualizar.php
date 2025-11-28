<?php
$conn = new mysqli("localhost", "root", "senaisp", "Oficina"); 
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_POST["id"] ?? null;
$tabela = $_POST["tabela"] ?? null;
$pk_coluna = $_POST["pk_coluna"] ?? null;

if (empty($id) || empty($tabela) || empty($pk_coluna)) {
    die("Erro: Dados de identificação do registro ausentes.");
}

$set_clause = [];
foreach ($_POST as $coluna => $valor) {
    if ($coluna === 'id' || $coluna === 'tabela' || $coluna === 'pk_coluna') {
        continue;
    }
    
    $valor_escaped = $conn->real_escape_string($valor);
    
    $set_clause[] = "$coluna = '$valor_escaped'";
}

if (empty($set_clause)) {
    die("Erro: Nenhum campo para atualização encontrado.");
}

$set_string = implode(', ', $set_clause);

$sql = "UPDATE $tabela SET $set_string WHERE $pk_coluna = '$id'";

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

if ($conn->query($sql) === TRUE) {
    echo "Dados atualizados com sucesso!";
    echo "<br><a href='listar.php' class='btn-voltar'>Voltar para a lista</a>";
} else {
    echo "Erro ao atualizar dados: " . $conn->error;
    echo "<br><a href='editar.php?id=$id&tabela=$tabela' class='btn-voltar'>Tentar Novamente</a>";
}

$conn->close();
?>