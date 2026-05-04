<?php
include "conexion.php";
$cajonera_id = $_GET["cajonera"];

/* ===== ELIMINAR ===== */
if(isset($_GET["eliminar"])){
    $conexion->query("DELETE FROM inventario WHERE id=".$_GET["eliminar"]);
}

/* ===== EDITAR ===== */
$editando = false;
$datos = null;

if(isset($_GET["editar"])){
    $editando = true;
    $datos = $conexion->query("SELECT * FROM inventario WHERE id=".$_GET["editar"])->fetch_assoc();
}

/* ===== GUARDAR ===== */
if(isset($_POST["guardar"])){
$conexion->query("
INSERT INTO inventario 
(cajonera_id,categoria,nombre_item,cantidad,estado,observaciones)
VALUES
($cajonera_id,'$_POST[categoria]','$_POST[item]',$_POST[cantidad],'$_POST[estado]','$_POST[obs]')
");
}

/* ===== ACTUALIZAR ===== */
if(isset($_POST["actualizar"])){
$conexion->query("
UPDATE inventario SET
categoria='$_POST[categoria]',
nombre_item='$_POST[item]',
cantidad=$_POST[cantidad],
estado='$_POST[estado]',
observaciones='$_POST[obs]'
WHERE id=$_POST[id]
");
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inventario</title>
<link rel="stylesheet" href="estilos.css">
</head>
<body>

<header>
<h1>Inventario de Cajonera</h1>
</header>

<div class="contenedor">

<!-- FORM -->
<div class="card">
<h2><?= $editando ? "Editar Item" : "Agregar Item" ?></h2>

<form method="POST">

<input type="hidden" name="id" value="<?= $datos['id'] ?? '' ?>">

<input name="categoria" placeholder="Categoría"
value="<?= $datos['categoria'] ?? '' ?>" required>

<input name="item" placeholder="Item"
value="<?= $datos['nombre_item'] ?? '' ?>" required>

<input type="number" name="cantidad"
value="<?= $datos['cantidad'] ?? '' ?>" required>

<select name="estado">
<option>Operativo</option>
<option>Dañado</option>
<option>En reparación</option>
</select>

<textarea name="obs"><?= $datos['observaciones'] ?? '' ?></textarea>

<button name="<?= $editando ? 'actualizar' : 'guardar' ?>">
<?= $editando ? 'Actualizar' : 'Agregar' ?>
</button>

</form>
</div>

<!-- TABLA -->
<div class="card">
<h2>Lista de Items</h2>

<table class="tabla">
<tr>
<th>Categoría</th>
<th>Item</th>
<th>Cantidad</th>
<th>Estado</th>
<th>Acción</th>
</tr>

<?php
$res = $conexion->query("SELECT * FROM inventario WHERE cajonera_id=$cajonera_id");

while($i = $res->fetch_assoc()){
echo "
<tr>
<td>{$i['categoria']}</td>
<td>{$i['nombre_item']}</td>
<td>{$i['cantidad']}</td>
<td>{$i['estado']}</td>
<td>
<a href='inventario.php?cajonera=$cajonera_id&editar={$i['id']}'>✏️</a>
<a href='inventario.php?cajonera=$cajonera_id&eliminar={$i['id']}'
onclick=\"return confirm('¿Eliminar item?')\">🗑️</a>
</td>
</tr>
";
}
?>

</table>
</div>

</div>

<a href="cajoneras.php?carro=<?=$conexion->query("SELECT carro_id FROM cajoneras WHERE id=$cajonera_id")->fetch_assoc()["carro_id"]?>">⬅ Volver</a>

</body>
</html>