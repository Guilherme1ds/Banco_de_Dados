<?php
$conn = new mysqli("localhost", "root", "senaisp", "Livraria");

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM Usuarios WHERE Cod_Usuario = '$id'");
$row = $result->fetch_assoc();
?>

<form action="atualizar.php" method="POST">
    <input type="hidden" name="id" value="<?php echo $row['Cod_Usuario']; ?>">
    Nome: <input type="text" name="nome" value="<?php echo $row['Nome']; ?>"><br>
    Email: <input type="email" name="email" value="<?php echo $row['Email']; ?>"><br>
    <input type="submit" value="Atualizar">
</form>