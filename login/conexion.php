<?PHP
$hostname = "localhost";
$database = "runnatica";
$username = "root";
$password = "";

$conexion = new mysqli($hostname, $username, $password, $database);
if($conexion->connect_errno){
    echo "Una disculpa, el web service perdió conexión";
}
?>