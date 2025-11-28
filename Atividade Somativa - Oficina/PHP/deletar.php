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

$conn = new mysqli("localhost", "root", "senaisp", "Oficina"); 
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$id = $_GET['id'] ?? null;
$tabela = $_GET['tabela'] ?? null;

if (empty($id) || empty($tabela)) {
    echo "Erro: ID ou Tabela não especificados.";
    echo "<br><a href='listar.php' class='btn-voltar'>Voltar para a lista</a>";
    exit;
}

$pk_map = [
    'Clientes' => 'id_cliente',
    'Mecanicos' => 'id_mecanico',
    'Veiculos' => 'id_veiculo',
    'Pecas' => 'id_peca',
    'Servico' => 'id_servico',
    'OS' => 'id_os',
];

$pk_coluna = $pk_map[$tabela] ?? null;

if (empty($pk_coluna)) {
    echo "Erro: Tabela '$tabela' não reconhecida ou PK não mapeada.";
    echo "<br><a href='listar.php' class='btn-voltar'>Voltar para a lista</a>";
    exit;
}

$sql = "DELETE FROM $tabela WHERE $pk_coluna = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo "Registro da tabela deletado com sucesso!";
} else {
    echo "Erro ao deletar registro da tabela" . $stmt->error;
    echo "<br>Isso pode ocorrer se houver cadastros (como uma OS) vinculados a este item.";
}
echo "<br><a href='listar.php' class='btn-voltar'>Voltar para a lista</a>";

$stmt->close();
$conn->close();

?>