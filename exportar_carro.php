<?php
include "conexion.php";

$carro_id = $_GET["carro"];

/* DATOS DEL CARRO */
$carro = $conexion->query("SELECT * FROM carros WHERE id=$carro_id")->fetch_assoc();

/* INVENTARIO ORDENADO CON SECCIÓN */
$items = $conexion->query("
SELECT 
    CASE 

        /* DELANTE */
        WHEN LOWER(c.posicion) = 'delante izquierda arriba' THEN 'Delante Izquierda Arriba'
        WHEN LOWER(c.posicion) = 'delante izquierda abajo' THEN 'Delante Izquierda Abajo'
        WHEN LOWER(c.posicion) = 'delante derecha arriba' THEN 'Delante Derecha Arriba'
        WHEN LOWER(c.posicion) = 'delante derecha abajo' THEN 'Delante Derecha Abajo'

        /* TRASERA */
        WHEN LOWER(c.posicion) = 'trasera izquierda arriba' THEN 'Trasera Izquierda Arriba'
        WHEN LOWER(c.posicion) = 'trasera izquierda abajo' THEN 'Trasera Izquierda Abajo'
        WHEN LOWER(c.posicion) = 'trasera derecha arriba' THEN 'Trasera Derecha Arriba'
        WHEN LOWER(c.posicion) = 'trasera derecha abajo' THEN 'Trasera Derecha Abajo'

        /* GENERALES */
        WHEN LOWER(c.posicion) = 'cabina' THEN 'Cabina'
        WHEN LOWER(c.posicion) = 'superior' THEN 'Superior'
        WHEN LOWER(c.posicion) = 'delantera' THEN 'Delantera'
        WHEN LOWER(c.posicion) = 'trasera' THEN 'Trasera'

        ELSE c.posicion

    END AS seccion,

    i.categoria,
    i.nombre_item,
    i.cantidad,
    i.estado

FROM inventario i
INNER JOIN cajoneras c ON i.cajonera_id = c.id
WHERE c.carro_id = $carro_id
ORDER BY seccion, i.categoria, i.nombre_item
");
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventario Carro</title>

<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

<style>
body{
    font-family: Arial;
    background:#f4f4f4;
}

.hoja{
    background:#fff;
    width:1000px;
    margin:auto;
    padding:20px;
}

h2{
    margin:0;
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

tr:nth-child(even){
    background:#f9f9f9;
}
</style>
</head>

<body>

<div style="text-align:center; margin:10px;">
<button onclick="descargar()">📸 Descargar Imagen</button>
</div>

<div class="hoja" id="captura">

<h2>🚒 <?= $carro["nombre_unidad"] ?></h2>
<p><b>Compañía:</b> <?= $carro["compania"] ?></p>
<p><b>Fecha:</b> <?= date("d/m/Y") ?></p>

<table>
<tr>
<th>Sección</th>
<th>Categoría</th>
<th>Item</th>
<th>Cantidad</th>
<th>Estado</th>
</tr>

<?php while($i = $items->fetch_assoc()){ ?>
<tr>
<td><b><?= $i["seccion"] ?></b></td>
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
html2canvas(document.getElementById("captura"),{
    scale:2
}).then(canvas=>{
    let a = document.createElement("a");
    a.download = "inventario_carro.png";
    a.href = canvas.toDataURL();
    a.click();
});
}
</script>

</body>
</html>