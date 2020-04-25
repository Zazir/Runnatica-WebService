<?PHP 
inclide 'conexion.php';

$Foto = $_GET['Foto'];
$Descripcion = $_GET['Descripcion'];
$Aval = $_GET['Aval'];
$Coordenadas = $_GET['Coordenadas'];
$Nombre_competencia = $_GET['Nombre_competencia'];
$Pais  = $_GET['Pais'];
$Colonia = $_GET['Colonia'];
$Calle = $_GET['Calle'];
$Ciudad = $_GET['Ciudad'];
$Fecha = $_GET['Fecha'];
$Resultados = $_GET['Resultados'];
$Hora = $_GET['Hora'];
$Estado = $_GET['Estado'];
$Reembolso = $_GET['Reembolso'];
$Precio = $_GET['Precio'];

//INSERT INTO competencia VALUES (1, 1, 1, "", "Esta es la descripcion", "", "uuyd53te5", "Nombre de competencia", "Pais", "Colonia", "Calle", "Ciudad", "02122000", "", 34, "Jalisco", "", "Si", "5000", 0, 0, 0, 0, "", "", 0 )
$AgregarCompetencia = "INSERT INTO competencia VALUES (0, 0, 0, "",'".$Descripcion."', "", '".$Coordenadas."', '".$Nombre_competencia."', "", '".$Colonia."', '".$Calle."', '".$Ciudad."', '".$Fecha."', "", '".$Hora."', "", "", "", '".$Precio."', 0, 0, 0, 0, "", "", 0 );";
mysqli_query($conexion, $AgregarCompetencia);
mysqli_close($conexion);

?>