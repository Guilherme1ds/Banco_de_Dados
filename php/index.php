<?php
echo "Olá, Mundo!";
?>

import mysql.connector

# Connect to the MySQL server 
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="senaisp",
    database="avaliativa"
)
cursor = conn.cursor()

# Run a query 
cursor.execute("SELECT * FROM fornecedor")