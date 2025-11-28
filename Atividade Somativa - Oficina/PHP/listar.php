<?php
$conn = new mysqli("localhost", "root", "senaisp", "Oficina");
$conn->set_charset("utf8");

echo "
<style>
    body { font-family: Arial, sans-serif; background-color: #f0f2f5; padding: 20px; }
    h2 { text-align: center; color: #333; margin-top: 30px; }
    table { width: 80%; margin: 20px auto; border-collapse: collapse; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05); background: #fff; border-radius: 8px; overflow: hidden; }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background-color: #007BFF; color: white; font-weight: bold; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    tr:hover { background-color: #f1f1f1; }
    td a { color: #dc3545; text-decoration: none; font-weight: bold; margin-right: 10px; }
    td a:hover { text-decoration: underline; }
    a[href='index.html'] { display: block; width: 150px; margin: 20px auto; text-align: center; }
    a[href='index.html'] button { background-color: #6c757d; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; }
    a[href='index.html'] button:hover { background-color: #5a6268; }
</style>
";

$result_cli = $conn->query("SELECT * FROM Clientes");
echo "<h2>Clientes</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Data de nascimento</th><th>CPF</th><th>Endereço</th><th colspan='2'>Ações</th></tr>";
while ($row = $result_cli->fetch_assoc()) {
    echo "<tr>
        <td>{$row['id_cliente']}</td>
        <td>{$row['nome_cliente']}</td>
        <td>{$row['data_nasc']}</td>
        <td>{$row['cpf_cliente']}</td>
        <td>{$row['endereco_cliente']}</td>
        <td><a href = 'editar.php?id={$row['id_cliente']}&tabela=Clientes'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['id_cliente']}&tabela=Clientes'>Deletar</a></td>
    </tr>";
}
echo "</table>";

$result_mec = $conn->query("SELECT * FROM Mecanicos");
echo "<h2>Mecânicos</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Data de nascimento</th><th>CPF</th><th>Endereço</th><th colspan='2'>Ações</th></tr>";
while ($row = $result_mec->fetch_assoc()) {
    echo "<tr>
        <td>{$row['id_mecanico']}</td>
        <td>{$row['nome_mec']}</td>
        <td>{$row['data_nasc_mec']}</td>
        <td>{$row['cpf_mecanico']}</td>
        <td>{$row['endereco_mec']}</td>
        <td><a href = 'editar.php?id={$row['id_mecanico']}&tabela=Mecanicos'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['id_mecanico']}&tabela=Mecanicos'>Deletar</a></td>
    </tr>";
}
echo "</table>";

$result_vei = $conn->query("SELECT * FROM Veiculos");
echo "<h2>Veículos</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Modelo</th><th>Marca</th><th>Ano</th><th>Cor</th><th colspan='2'>Ações</th></tr>"; 
while ($row = $result_vei->fetch_assoc()) {
    echo "<tr>
        <td>{$row['id_veiculo']}</td>
        <td>{$row['modelo']}</td>
        <td>{$row['marca']}</td>
        <td>{$row['ano']}</td>
        <td>{$row['cor']}</td>
        <td><a href = 'editar.php?id={$row['id_veiculo']}&tabela=Veiculos'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['id_veiculo']}&tabela=Veiculos'>Deletar</a></td>
    </tr>";
}
echo "</table>";

$result_pecas = $conn->query("SELECT * FROM Pecas");
echo "<h2>Peças</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Categoria</th><th>Descrição</th><th>Quantidade</th><th>Preço</th><th colspan='2'>Ações</th></tr>"; 
while ($row = $result_pecas->fetch_assoc()) {
    echo "<tr>
        <td>{$row['id_peca']}</td>
        <td>{$row['nome_peca']}</td>
        <td>{$row['categoria']}</td>
        <td>{$row['descricao_peca']}</td>
        <td>{$row['quantidade']}</td>
        <td>{$row['preco_peca']}</td>
        <td><a href = 'editar.php?id={$row['id_peca']}&tabela=Pecas'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['id_peca']}&tabela=Pecas'>Deletar</a></td>
    </tr>";
}
echo "</table>";

$result_serv = $conn->query("SELECT * FROM Servico");
echo "<h2>Serviços</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Tipo</th><th>Descrição</th><th>Preço</th><th colspan='2'>Ações</th></tr>"; 
while ($row = $result_serv->fetch_assoc()) {
    echo "<tr>
        <td>{$row['id_servico']}</td>
        <td>{$row['nome_servico']}</td>
        <td>{$row['tipo_servico']}</td>
        <td>{$row['descricao_servico']}</td>
        <td>{$row['preco_servico']}</td>
        <td><a href = 'editar.php?id={$row['id_servico']}&tabela=Servico'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['id_servico']}&tabela=Servico'>Deletar</a></td>
    </tr>";
}
echo "</table>";

$result_os = $conn->query("SELECT * FROM OS");
echo "<h2>Ordens de Serviço (OS)</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Descrição</th><th>Prazo Inicial</th><th>Prazo Final</th><th>Preço Total</th><th colspan='2'>Ações</th></tr>"; 
while ($row = $result_os->fetch_assoc()) {
    echo "<tr>
        <td>{$row['id_os']}</td>
        <td>{$row['descricao']}</td>
        <td>{$row['prazo_inicial']}</td>
        <td>{$row['prazo_final']}</td>
        <td>{$row['preco_os']}</td>
        <td><a href = 'editar.php?id={$row['id_os']}&tabela=OS'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['id_os']}&tabela=OS'>Deletar</a></td>
    </tr>";
}
echo "</table>";

$conn->close();
?>

<a href="index.html"><button type="button">Página Inicial</button></a>