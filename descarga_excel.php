<?php
include "conexion.php";

header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
header("Content-Disposition: attachment; filename=inventario_carros.xlsx");
header("Pragma: no-cache");
header("Expires: 0");

echo "\xEF\xBB\xBF"; // BOM para acentos en Excel

$items = $conexion->query("
SELECT inventario.*, carros.nombre_unidad, carros.compania
FROM inventario
JOIN carros ON inventario.carro_id = carros.id
ORDER BY 
    inventario.observaciones,
    inventario.categoria,
    carros.nombre_unidad
");

// Encabezados
echo "Carro\tCompañía\tUbicación\tCategoría\tÍtem\tCantidad\tEstado\n";

// Datos
while($i = $items->fetch_assoc()){
    echo 
        $i["nombre_unidad"]."\t".
        $i["compania"]."\t".
        $i["observaciones"]."\t".
        $i["categoria"]."\t".
        $i["nombre_item"]."\t".
        $i["cantidad"]."\t".
        $i["estado"]."\n";
}
exit;
