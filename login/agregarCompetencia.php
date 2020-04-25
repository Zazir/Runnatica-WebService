<?PHP 
inclide 'conexion.php';

$Foto = $_GET[''];
$Descripcion = $_GET[''];
$Aval = $_GET[''];
$Coordenadas = $_GET[''];
$Nombre_competencia = $_GET[''];
$Pais  = $_GET[''];
$Colonia = $_GET[''];
$Calle = $_GET[''];
$Ciudad = $_GET[''];
$Fecha = $_GET[''];
$Resultados = $_GET[''];
$Hora = $_GET[''];
$Estado = $_GET[''];
$Reembolso = $_GET[''];
$Precio = $_GET[''];

//INSERT INTO competencia VALUES (1, 1, 1, "", "Esta es la descripcion", "", "uuyd53te5", "Nombre de competencia", "Pais", "Colonia", "Calle", "Ciudad", "02122000", "", 34, "Jalisco", "", "Si", "5000", 0, 0, 0, 0, "", "", 0 )
$AgregarCompetencia = "INSERT INTO competencia VALUES (0, 0, 0, "",'".$Descripcion."', "", '".$Coordenadas."', '".$Nombre_competencia."', "", '".$Colonia."', '".$Calle."', '".$Ciudad."', '".$Fecha."', "", '".$Hora."', "", "", "", '".$Precio."', 0, 0, 0, 0, "", "", 0 );";
mysqli_query($conexion, $AgregarCompetencia);
mysqli_close($conexion);

?>