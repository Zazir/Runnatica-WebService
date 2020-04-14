<?PHP
include 'conexion.php';

$NombreCompetencia = $_GET['NombreCompetencia'];
$Descripcion = $_GET['Descripcion'];
$Precio = $_GET['Precio'];

$InsertarCompetencia = 'INSERT INTO competencia VALUES ("'.$FOTO.'", )';

//Insert con el método mysqli_query, parámetro 1 conexión, parámetro 2 string(cadena de texto con valores concatenados)
mysqli_query($conexion, $InsertarCompetencia);

//Métdo para cerrar conexión, bastante importante NO SE TE OLVIDE CERRAR
mysqli_close($conexion);
?>