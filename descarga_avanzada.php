<?php
include "conexion.php";

/* =========================
   FILTROS
========================= */
$filtro_carro     = $_GET["carro"] ?? "";
$filtro_categoria = $_GET["categoria"] ?? "";
$filtro_estado    = $_GET["estado"] ?? "";
$filtro_ubicacion = $_GET["ubicacion"] ?? "";

$orden = $_GET["orden"] ?? "observaciones";
$dir   = $_GET["dir"] ?? "ASC";

$permitidos = [
    "observaciones",
    "categoria",
    "nombre_item",
    "cantidad",
    "estado",
    "carro_id"
];

if (!in_array($orden, $permitidos)) {
    $orden = "observaciones";
}

/* =========================
   CONSULTA BASE
========================= */
$sql = "
SELECT inventario.*, carros.nombre_unidad
FROM inventario
JOIN carros ON inventario.carro_id = carros.id
WHERE 1=1
";

if ($filtro_carro != "") {
    $sql .= " AND carros.id = '$filtro_carro'";
}
if ($filtro_categoria != "") {
    $sql .= " AND inventario.categoria LIKE '%$filtro_categoria%'";
}
if ($filtro_estado != "") {
    $sql .= " AND inventario.estado = '$filtro_estado'";
}
if ($filtro_ubicacion != "") {
    $sql .= " AND inventario.observaciones LIKE '%$filtro_ubicacion%'";
}

$sql .= " ORDER BY $orden $dir";

$items = $conexion->query($sql);

/* =========================
   DATOS PARA SELECT
========================= */
$carros = $conexion->query("SELECT * FROM carros");
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Inventario Avanzado</title>

<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>

<style>
body{
    font-family:Arial;
    background:#f4f4f4;
}

.panel{
    background:#fff;
    padding:15px;
    margin:15px auto;
    width:950px;
    border-radius:5px;
}

.panel h2{
    margin-top:0;
}

.panel form{
    display:grid;
    grid-template-columns: repeat(3, 1fr);
    gap:10px;
}

.panel input, .panel select, .panel button{
    padding:7px;
}

.botones{
    text-align:center;
    margin:15px;
}

.hoja{
    background:#fff;
    width:950px;
    margin:auto;
    padding:25px;
}

table{
    width:100%;
    border-collapse:collapse;
    font-size:13px;
}

th, td{
    border:1px solid #000;
    padding:6px;
}

th{
    background:#eee;
}

@media print{
    .panel, .botones{ display:none; }
    body{ background:#fff; }
}
</style>
</head>

<body>

<div class="panel">
<h2>Filtros de Inventario</h2>

<form method="GET">

<select name="carro">
    <option value="">Todos los carros</option>
    <?php while($c = $carros->fetch_assoc()){ ?>
        <option value="<?=$c["id"]?>"><?=$c["nombre_unidad"]?></option>
    <?php } ?>
</select>

<input name="categoria" placeholder="Categoría" value="<?=$filtro_categoria?>">

<select name="estado">
    <option value="">Todos los estados</option>
    <option>Operativo</option>
    <option>Dañado</option>
    <option>En reparacion</option>
</select>

<input name="ubicacion" placeholder="Ubicación" value="<?=$filtro_ubicacion?>">

<select name="orden">
    <option value="observaciones">Ubicación</option>
    <option value="categoria">Categoría</option>
    <option value="nombre_item">Ítem</option>
    <option value="cantidad">Cantidad</option>
    <option value="estado">Estado</option>
    <option value="carro_id">Carro</option>
</select>

<select name="dir">
    <option value="ASC">Ascendente</option>
    <option value="DESC">Descendente</option>
</select>

<button>Aplicar filtros</button>

</form>
</div>

<div class="botones">
<button onclick="window.print()">🖨️ Imprimir</button>
<button onclick="descargarImagen()">⬇️ Descargar Imagen</button>
</div>

<div class="hoja" id="hoja">

<img src="logo.png" width="90">
<h2>Inventario General</h2>
<p><b>Fecha:</b> <?=date("d/m/Y")?></p>

<table>
<tr>
    <th>Carro</th>
    <th>Ubicación</th>
    <th>Categoría</th>
    <th>Ítem</th>
    <th>Cantidad</th>
    <th>Estado</th>
</tr>

<?php while($i = $items->fetch_assoc()){ ?>
<tr>
    <td><?=$i["nombre_unidad"]?></td>
    <td><?=$i["observaciones"]?></td>
    <td><?=$i["categoria"]?></td>
    <td><?=$i["nombre_item"]?></td>
    <td><?=$i["cantidad"]?></td>
    <td><?=$i["estado"]?></td>
</tr>
<?php } ?>

</table>

<br><br>
<p><b>Firma Responsable:</b></p>
<div style="border-bottom:1px solid #000;width:300px;height:40px;"></div>

</div>

<script>
function descargarImagen(){
    html2canvas(document.getElementById("hoja")).then(canvas=>{
        let a = document.createElement("a");
        a.download = "Inventario_Filtrado.png";
        a.href = canvas.toDataURL("image/png");
        a.click();
    });
}
</script>

<a href="dashboard.php">Regresar</a>


</body>
</html>
