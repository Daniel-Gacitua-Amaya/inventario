<?php
include "conexion.php";
$id = $_GET["id"];

$carro = $conexion->query("SELECT * FROM carros WHERE id=$id")->fetch_assoc();
$items = $conexion->query("SELECT * FROM inventario WHERE carro_id=$id");
?>

<!DOCTYPE html>
<html>
<head>
<title>Inventario</title>

<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

<style>
body{
    font-family: Arial;
    background:#f4f4f4;
}

.hoja{
    background:white;
    width:850px;
    margin:auto;
    padding:20px;
}

img{ width:100px; }

table{
    width:100%;
    border-collapse:collapse;
}

th, td{
    border:1px solid #000;
    padding:6px;
}

.botones{
    text-align:center;
    margin:15px;
}

@media print{
    .botones{ display:none; }
    body{ background:white; }
}
</style>
</head>

<body>

<div class="botones">
    <button onclick="window.print()">🖨️ Imprimir</button>
    <button onclick="descargarImagen()">⬇️ Descargar imagen</button>
</div>

<div class="hoja" id="hoja">
    <img src="logo.png">
    <h2>Inventario de Carro</h2>

    <p><b>Unidad:</b> <?= $carro["nombre_unidad"] ?></p>
    <p><b>Compañía:</b> <?= $carro["compania"] ?></p>
    <p><b>Fecha:</b> <?= date("d/m/Y") ?></p>

    <table>
        <tr>
            <th>Categoría</th>
            <th>Item</th>
            <th>Cantidad</th>
            <th>Estado</th>
            <th>Ubicación</th>
        </tr>

        <?php while($i = $items->fetch_assoc()){ ?>
        <tr>
            <td><?= $i["categoria"] ?></td>
            <td><?= $i["nombre_item"] ?></td>
            <td><?= $i["cantidad"] ?></td>
            <td><?= $i["estado"] ?></td>
            <td><?= $i["observaciones"] ?></td>
        </tr>
        <?php } ?>
    </table>
</div>

<script>
function descargarImagen(){
    html2canvas(document.getElementById("hoja")).then(canvas => {
        let link = document.createElement("a");
        link.download = "Inventario_<?= $carro["nombre_unidad"] ?>.png";
        link.href = canvas.toDataURL("image/png");
        link.click();
    });
}
</script>

<a href="dashboard.php">Regresar</a>


</body>
</html>
