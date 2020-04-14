<?PHP
include 'conexion.php';

$consulta = "SELECT * FROM competencia";
$resultado = $conexion -> query($consulta);

while($fila = $resultado -> fetch_array()){
    $competencia[] = array_map('utf8_encode', $fila);
}

echo json_encode($competencia);
$resultado -> close();
?>