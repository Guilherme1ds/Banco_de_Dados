<?php

$conn = new mysqli("localhost", "root", "senaisp", "Oficina"); 
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$pk_map = [
    'Clientes' => 'id_cliente',
    'Mecanicos' => 'id_mecanico',
    'Veiculos' => 'id_veiculo',
    'Pecas' => 'id_peca',
    'Servico' => 'id_servico',
    'OS' => 'id_os',
];

$id = $_GET['id'] ?? null;
$tabela = $_GET['tabela'] ?? null;

if (empty($id) || empty($tabela) || !isset($pk_map[$tabela])) {
    die("Erro: ID ou Tabela inválidos.");
}

$pk_coluna = $pk_map[$tabela];

$sql = "SELECT * FROM $tabela WHERE $pk_coluna = '$id'";
$result = $conn->query($sql);

if ($result && $row = $result->fetch_assoc()) {
} else {
    die("Registro não encontrado na tabela $tabela.");
}

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar <?php echo $tabela; ?></title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f2f5; padding: 20px; text-align: center; }
        form { background: #ffffff; padding: 25px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); max-width: 400px; margin: 20px auto; text-align: left; }
        h2 { text-align: center; color: #007BFF; }
        label { display: block; margin-bottom: 8px; font-weight: bold; color: #333; }
        input[type="text"], input[type="date"], input[type="number"], input[type="email"] { width: 100%; padding: 10px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button[type="submit"] { width: 100%; padding: 12px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; font-weight: bold; }
        button[type="submit"]:hover { background-color: #218838; }
        .btn-voltar { display: inline-block; padding: 10px 20px; margin-top: 15px; background-color: #6c757d; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; }
    </style>
</head>
<body>
    <h2>Editar Registro de <?php echo $tabela; ?> (ID: <?php echo $id; ?>)</h2>
    
    <form action="atualizar.php" method="POST">
        
        <input type="hidden" name="id" value="<?php echo $id; ?>">
        <input type="hidden" name="tabela" value="<?php echo $tabela; ?>">
        <input type="hidden" name="pk_coluna" value="<?php echo $pk_coluna; ?>">
        
        <?php
        foreach ($row as $coluna => $valor) {
            if ($coluna === $pk_coluna) {
                continue; 
            }
            
            $input_type = 'text';
            if (strpos($coluna, 'data_nasc') !== false || strpos($coluna, 'prazo') !== false) {
                $input_type = 'date';
            } elseif (strpos($coluna, 'preco') !== false || strpos($coluna, 'quantidade') !== false || strpos($coluna, 'ano') !== false || strpos($coluna, 'id_') !== false) {
                $input_type = 'number';
            }
            
            $label_text = ucfirst(str_replace('_', ' ', $coluna));
            
            $display_value = ($input_type === 'date' && empty($valor)) ? '' : $valor;

            echo "<label for='$coluna'>$label_text:</label>";
            echo "<input type='$input_type' id='$coluna' name='$coluna' value='$display_value' required><br>";
        }
        ?>
        
        <button type="submit">Atualizar <?php echo $tabela; ?></button>
    </form>
    
    <a href='listar.php' class='btn-voltar'>Voltar para a lista</a>

</body>
</html>
<?php $conn->close(); ?>