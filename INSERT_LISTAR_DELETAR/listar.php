<?php
$conn = new mysqli("localhost", "root", "senaisp", "Livraria");
$result = $conn->query("SELECT * FROM usuarios");

echo "<h2>Usuarios</h2>";
echo "<table border = '1'>";
echo "<tr><th>ID</th><th>Nome</th><th>Email</th><th>Ações</th></tr>";

while ($row = $result->fetch_assoc()) {
    echo "<tr>
        <td>{$row['Cod_Usuario']}</td>
        <td>{$row['Nome']}</td>
        <td>{$row['Email']}</td>
        <td><a href = 'editar.php?id={$row['Cod_Usuario']}'>Editar</a></td>
        <td><a href = 'deletar.php?id={$row['Cod_Usuario']}'>Deletar</a></td>
    </tr>";
}
echo "</table>";
$conn->close();
?>

<a href="index.html"><button type="button">Página Inicial</button></a>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        padding: 20px;
    }

    h2 {
        text-align: center;
        color: #333;
    }

    table {
        width: 80%; /* Tabela ocupa 80% da tela */
        margin: 20px auto; /* Centraliza a tabela */
        border-collapse: collapse; /* Tira espaço entre células */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        background: #fff;
        border-radius: 8px;
        overflow: hidden; /* Garante que a borda arredondada funcione */
    }

    /* IMPORTANTE: Lembre-se de remover o atributo border="1" da sua tag <table> no PHP
    */
    th, td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd; /* Linha sutil entre as linhas */
    }

    th {
        background-color: #007BFF; /* Mesmo azul do form */
        color: white;
        font-weight: bold;
    }

    /* Linhas alternadas (zebra striping) */
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    /* Efeito ao passar o mouse */
    tr:hover {
        background-color: #f1f1f1;
    }

    /* Link de "Editar" */
    td a {
        color: #dc3545; /* Um tom de vermelho */
        text-decoration: none;
        font-weight: bold;
    }

    td a:hover {
        text-decoration: underline;
    }

    /* Estilo para o link/botão "Página Inicial" */
    a[href="index.html"] {
        display: block; /* Para poder centralizar */
        width: 150px;
        margin: 20px auto; /* Centraliza o botão */
        text-align: center;
    }

    a[href="index.html"] button {
        background-color: #6c757d; /* Cinza escuro */
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }

    a[href="index.html"] button:hover {
        background-color: #5a6268;
    }
</style>
