<?php
include "conexion.php";

$items = $conexion->query("
SELECT inventario.*, carros.nombre_unidad, carros.compania
FROM inventario
JOIN carros ON inventario.carro_id = carros.id
ORDER BY carros.nombre_unidad, inventario.categoria, inventario.observaciones
");
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Descargar Inventario PDF</title>

<style>
body{
    font-family:Arial;
    background:#fff;
}

.mensaje{
    text-align:center;
    background:#f1f1f1;
    padding:12px;
    font-size:14px;
}

.hoja{
    width:210mm;
    min-height:297mm;
    margin:auto;
    padding:20mm;
}

.header{
    text-align:center;
}

.header img{
    width:90px;
}

table{
    width:100%;
    border-collapse:collapse;
    font-size:11px;
    margin-top:10px;
}

th, td{
    border:1px solid #000;
    padding:5px;
}

th{
    background:#eee;
}

.firma{
    margin-top:40px;
}

@media print{
    .mensaje{ display:none; }
}
</style>
</head>

<body onload="window.print()">

<div class="mensaje">
📄 <b>Guarde este archivo como PDF</b><br>
En el destino seleccione: <b>Guardar como PDF</b><br>
Este archivo es para <b>enviar por correo electrónico</b>
</div>

<div class="hoja">

<div class="header">
    <img src="logo.png">
    <h2>Inventario General de Carros</h2>
    <p><b>Fecha:</b> <?=date("d/m/Y")?></p>
</div>

<table>
<tr>
    <th>Carro</th>
    <th>Compañía</th>
    <th>Ubicación</th>
    <th>Categoría</th>
    <th>Ítem</th>
    <th>Cantidad</th>
    <th>Estado</th>
</tr>

<?php while($i = $items->fetch_assoc()){ ?>
<tr>
    <td><?=$i["nombre_unidad"]?></td>
    <td><?=$i["compania"]?></td>
    <td><?=$i["observaciones"]?></td>
    <td><?=$i["categoria"]?></td>
    <td><?=$i["nombre_item"]?></td>
    <td><?=$i["cantidad"]?></td>
    <td><?=$i["estado"]?></td>
</tr>
<?php } ?>

</table>

<div class="firma">
    <p><b>Firma Responsable:</b></p>
    <div style="border-bottom:1px solid #000;width:300px;"></div>
</div>

</div>

</body>
</html>
