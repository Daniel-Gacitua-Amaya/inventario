<?php
include "conexion.php";

$carro_id = $_GET["carro"];

$carro = $conexion->query("SELECT * FROM carros WHERE id=$carro_id")->fetch_assoc();

$cajoneras = $conexion->query("
SELECT * FROM cajoneras 
WHERE carro_id=$carro_id
ORDER BY posicion, numero
");

$total_cajoneras = $cajoneras->num_rows;
$contador = 0;
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventario Carro</title>

<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

<style>
body{
    font-family: "Segoe UI", Arial, sans-serif;
    background:#ccc;
    margin:0;
}

/* BOTONES */
.botones{
    text-align:center;
    padding:10px;
}

/* CONTENEDOR HOJA */
.hoja-wrapper{
    position: relative;
}

/* BOTON POR HOJA */
.btn-descargar-hoja{
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 10;
    padding: 6px 10px;
    background: #b11226;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 12px;
}

/* HOJA */
.hoja{
    width:210mm;
    min-height:297mm;
    margin:20px auto;
    padding:20mm;
    background:white;
    box-shadow:0 0 10px rgba(0,0,0,0.3);
    box-sizing:border-box;
}

/* HEADER */
.header{
    text-align:center;
    border-bottom:2px solid #000;
    margin-bottom:15px;
    padding-bottom:10px;
}

.header img{
    width:80px;
}

/* TITULO */
.titulo-cajonera{
    font-weight:bold;
    margin:10px 0;
    border-left:4px solid #b11226;
    padding-left:8px;
}

/* TABLA */
table{
    width:100%;
    border-collapse:collapse;
    font-size:12px;
}

th{
    background:#222;
    color:#fff;
    padding:6px;
}

td{
    border:1px solid #000;
    padding:5px;
}

/* FIRMA */
.firma{
    margin-top:60px;
}

/* FOOTER */
.footer{
    margin-top:20px;
    font-size:11px;
    text-align:right;
}

/* IMPRESIÓN */
@media print {
    .botones, .btn-descargar-hoja{
        display:none;
    }

    body{
        background:white;
    }

    .hoja{
        margin:0;
        box-shadow:none;
        page-break-after: always;
    }
}
</style>
</head>

<body>

<div class="botones">
<button onclick="window.print()">🖨️ Imprimir</button>
</div>

<?php while($c = $cajoneras->fetch_assoc()){ 
$contador++;

$total = $conexion->query("
SELECT COUNT(*) as total 
FROM cajoneras 
WHERE carro_id=$carro_id 
AND posicion='{$c["posicion"]}'
")->fetch_assoc()["total"];

$items = $conexion->query("
SELECT * FROM inventario 
WHERE cajonera_id={$c["id"]}
ORDER BY categoria, nombre_item
");
?>

<div class="hoja-wrapper">

<button class="btn-descargar-hoja" onclick="descargarHoja(this)">
📸 Descargar hoja
</button>

<div class="hoja">

<div class="header">
<img src="logo.png">
<h2>INVENTARIO DE MATERIAL MAYOR</h2>
<p><b>Unidad:</b> <?= $carro["nombre_unidad"] ?></p>
<p><b>Compañía:</b> <?= $carro["compania"] ?></p>
<p><b>Fecha:</b> <?= date("d/m/Y") ?></p>
</div>

<div class="titulo-cajonera">
📍 Cajonera <?= $c["posicion"] ?> 
<?= ($total > 1) ? "N° ".$c["numero"] : "" ?>
</div>

<table>
<tr>
<th>Categoría</th>
<th>Item</th>
<th>Cantidad</th>
<th>Estado</th>
</tr>

<?php 
$contadorItems = 0;

while($i = $items->fetch_assoc()){ 

if($contadorItems > 0 && $contadorItems % 18 == 0){ 
?>
</table>

<div class="footer">
Página <?= $contador ?> de <?= $total_cajoneras ?>
</div>

</div> <!-- hoja -->

</div> <!-- wrapper -->

<div class="hoja-wrapper">
<button class="btn-descargar-hoja" onclick="descargarHoja(this)">
📸 Descargar hoja
</button>

<div class="hoja">

<div class="header">
<img src="logo.png">
<h2>INVENTARIO DE MATERIAL MAYOR</h2>
<p><b>Unidad:</b> <?= $carro["nombre_unidad"] ?></p>
<p><b>Compañía:</b> <?= $carro["compania"] ?></p>
<p><b>Fecha:</b> <?= date("d/m/Y") ?></p>
</div>

<div class="titulo-cajonera">
📍 Cajonera <?= $c["posicion"] ?>
</div>

<table>
<tr>
<th>Categoría</th>
<th>Item</th>
<th>Cantidad</th>
<th>Estado</th>
</tr>
<?php } ?>

<tr>
<td><?= $i["categoria"] ?></td>
<td><?= $i["nombre_item"] ?></td>
<td><?= $i["cantidad"] ?></td>
<td><?= $i["estado"] ?></td>
</tr>

<?php 
$contadorItems++;
} 
?>

</table>

<?php if($contador == $total_cajoneras){ ?>
<div class="firma">
<p><b>Firma Responsable:</b></p>
<div style="border-bottom:1px solid #000;width:300px;height:40px;"></div>
</div>
<?php } ?>

<div class="footer">
Página <?= $contador ?> de <?= $total_cajoneras ?>
</div>

</div>
</div>

<?php } ?>

<script>
async function descargarHoja(btn){

    const hoja = btn.parentElement.querySelector(".hoja");

    const canvas = await html2canvas(hoja, {
        scale: 2,
        useCORS: true
    });

    const link = document.createElement("a");
    link.download = "Inventario_hoja.png";
    link.href = canvas.toDataURL("image/png");
    link.click();
}
</script>

</body>
</html>