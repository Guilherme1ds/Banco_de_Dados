<?php 

$conn = new mysqli("localhost", "root", "senaisp", "Oficina");
$conn->set_charset("utf8"); 

if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$tabela = $_POST["tabela"] ?? '';
$sql = "";

switch ($tabela) {
    case "Clientes":
        $nome_cli = $_POST["nome_cliente"];
        $data_cli = $_POST["data_nasc"];
        $cpf_cli = $_POST["cpf_cliente"];
        $endereco_cli = $_POST["endereco_cliente"];
        $sql = "INSERT INTO Clientes (nome_cliente, data_nasc, cpf_cliente, endereco_cliente) 
                VALUES ('$nome_cli', '$data_cli', '$cpf_cli', '$endereco_cli')";
        break;

    case "Mecanicos":
        $nome_mec = $_POST["nome_mec"];
        $data_mec = $_POST["data_nasc_mec"];
        $cpf_mec = $_POST["cpf_mecanico"];
        $endereco_mec = $_POST["endereco_mec"];
        $sql = "INSERT INTO Mecanicos (nome_mec, data_nasc_mec, cpf_mecanico, endereco_mec) 
                VALUES ('$nome_mec', '$data_mec', '$cpf_mec', '$endereco_mec')";
        break;

    case "Veiculos":
        $modelo = $_POST["modelo"];
        $marca = $_POST["marca"];
        $ano = (int)$_POST["ano"];
        $cor = $_POST["cor"];
        $sql = "INSERT INTO Veiculos (modelo, marca, ano, cor) 
                VALUES ('$modelo', '$marca', $ano, '$cor')";
        break;

    case "Pecas":
        $categoria = $_POST["categoria"];
        $quantidade = (int)$_POST["quantidade"];
        $preco_peca = $_POST["preco_peca"];
        $nome_peca = $_POST["nome_peca"];
        $descricao_peca = $_POST["descricao_peca"];
        $sql = "INSERT INTO Pecas (nome_peca, categoria, descricao_peca, quantidade, preco_peca) 
                VALUES ('$nome_peca', '$categoria', '$descricao_peca', $quantidade, '$preco_peca')";
        break;

    case "Servico":
        $descricao_servico = $_POST["descricao_servico"];
        $nome_servico = $_POST["nome_servico"];
        $preco_servico = $_POST["preco_servico"];
        $tipo_servico = $_POST["tipo_servico"];
        $sql = "INSERT INTO Servico (nome_servico, tipo_servico, descricao_servico, preco_servico) 
                VALUES ('$nome_servico', '$tipo_servico', '$descricao_servico', '$preco_servico')";
        break;

    case "OS":
        $prazo_inicial = $_POST["prazo_inicial"];
        $prazo_final = $_POST["prazo_final"];
        $descricao = $_POST["descricao"];
        $preco_os = $_POST["preco_os"];
        $id_veiculo = 'NULL';
        $id_cliente = 'NULL';
        $id_mecanico = 'NULL';
        $id_peca = 'NULL';
        $id_servico = 'NULL';

        $sql = "INSERT INTO OS (descricao, prazo_inicial, prazo_final, preco_os, id_veiculo, id_cliente, id_mecanico, id_peca, id_servico) 
                VALUES ('$descricao', '$prazo_inicial', '$prazo_final', '$preco_os', $id_veiculo, $id_cliente, $id_mecanico, $id_peca, $id_servico)";
        break;
        
    default:
        echo "Erro: Tabela não especificada ou inválida.";
        exit;
}

if ($sql != "") {
    if ($conn->query($sql) === TRUE) {
        echo "Dados salvos com sucesso!";
    } else {
        echo "Erro ao salvar dados" . $conn->error;
    }
}

echo "<br><a href='index.html' class='btn-voltar'>Adicionar Mais</a>";
echo "<br><a href='listar.php' class='btn-voltar'>Ver Listagem</a>";
exit;
$conn->close();

?>