<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard Inventario Bomberos</title>

<style>
body{
    font-family: Arial, sans-serif;
    background:#f4f4f4;
    margin:0;
}

/* HEADER */
header{
    background:#b30000;
    color:#fff;
    padding:15px;
    display:flex;
    align-items:center;
}

header img{
    width:60px;
    margin-right:15px;
}

header h1{
    font-size:20px;
    margin:0;
}

/* CONTENEDOR */
.contenedor{
    padding:20px;
    display:grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap:20px;
}

/* TARJETAS */
.card{
    background:#fff;
    padding:20px;
    border-radius:10px;
    box-shadow:0 2px 6px rgba(0,0,0,0.15);
    transition:0.2s;
}

.card:hover{
    transform: translateY(-5px);
}

.card h2{
    margin-top:0;
    color:#b30000;
}

.card p{
    font-size:14px;
}

/* BOTONES */
.btn{
    display:inline-block;
    margin-top:10px;
    padding:10px 14px;
    background:#b30000;
    color:#fff;
    text-decoration:none;
    border-radius:5px;
    font-size:14px;
}

.btn:hover{
    background:#8f0000;
}

/* FOOTER */
footer{
    text-align:center;
    font-size:12px;
    padding:15px;
    color:#555;
}
</style>
</head>

<body>

<header>
    <img src="logo.png" alt="Logo Bomberos">
    <h1>Sistema de Inventario – Carros de Bomberos</h1>
</header>

<div class="contenedor">

<!-- CARROS -->
<div class="card">
<h2>🚒 Carros</h2>
<p>Administrar los carros y unidades del Cuerpo de Bomberos.</p>
<a href="carros.php" class="btn">Ingresar</a>
</div>

<!-- INVENTARIO -->
<div class="card">
<h2>📦 Inventario por Carro</h2>
<p>Agregar, editar o eliminar ítems del inventario de cada carro.</p>
<a href="carros.php" class="btn">Ver inventario</a>
</div>

<!-- BUSCADOR -->
<div class="card">
<h2>🔍 Buscar Ítems</h2>
<p>Búsqueda rápida de equipos, herramientas y EPP.</p>
<a href="buscar.php" class="btn">Buscar</a>
</div>



<!-- DESCARGA AVANZADA -->
<div class="card">
<h2>📊 Descarga Avanzada</h2>
<p>Filtrar, ordenar y descargar inventario general.</p>
<a href="descarga_avanzada.php" class="btn">Acceder</a>
</div>

<!-- PDF -->
<div class="card">
<h2>📄 Descarga PDF</h2>
<p>Generar inventario general en PDF oficial.</p>
<a href="descarga_pdf.php" class="btn">Generar PDF</a>
</div>



</div>

<footer>
Sistema de Inventario Bomberos · Uso interno institucional
</footer>

</body>
</html>