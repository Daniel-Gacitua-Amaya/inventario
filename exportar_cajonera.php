<?php
include "conexion.php";

$cajonera_id = $_GET["cajonera"];

$cajonera = $conexion->query("
SELECT c.*, ca.nombre_unidad, ca.compania
FROM cajoneras c
JOIN carros ca ON c.carro_id = ca.id
WHERE c.id = $cajonera_id
")->fetch_assoc();

$items = $conexion->query("
SELECT * FROM inventario
WHERE cajonera_id = $cajonera_id
ORDER BY categoria, nombre_item
");
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

<style>
body{font-family:Arial;background:#f4f4f4;}

.hoja{
background:#fff;
width:800px;
margin:auto;
padding:20px;
}

table{
width:100%;
border-collapse:collapse;
margin-top:15px;
}

th{
background:#b11226;
color:#fff;
padding:8px;
}

td{
border:1px solid #ccc;
padding:6px;
}
</style>
</head>

<body>

<div style="text-align:center;margin:10px;">
<button onclick="descargar()">📸 Descargar Imagen</button>
</div>

<div class="hoja" id="captura">

<h2>🗄️ <?= $cajonera["posicion"] ?> Nº <?= $cajonera["numero"] ?></h2>

<p><b>Carro:</b> <?= $cajonera["nombre_unidad"] ?></p>
<p><b>Compañía:</b> <?= $cajonera["compania"] ?></p>
<p><b>Fecha:</b> <?= date("d/m/Y") ?></p>

<table>
<tr>
<th>Categoría</th>
<th>Item</th>
<th>Cantidad</th>
<th>Estado</th>
</tr>

<?php while($i = $items->fetch_assoc()){ ?>
<tr>
<td><?= $i["categoria"] ?></td>
<td><?= $i["nombre_item"] ?></td>
<td><?= $i["cantidad"] ?></td>
<td><?= $i["estado"] ?></td>
</tr>
<?php } ?>

</table>

</div>

<script>
function descargar(){
html2canvas(document.getElementById("captura"),{scale:2})
.then(canvas=>{
let a=document.createElement("a");
a.download="cajonera.png";
a.href=canvas.toDataURL();
a.click();
});
}
</script>

</body>
</html>