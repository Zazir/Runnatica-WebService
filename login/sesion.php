<?PHP
$hostname = "localhost";
$database = "runnatica";
$username = "root";
$password = "";

$json = array();
if(isset($_GET["user"]) && isset($_GET["pwd"])){
    $user = $_GET["user"];
    $pwd = $_GET["pwd"];

    $conexion = mysqli_connect($hostname, $username, $password, $database);
    $querySelect = "SELECT correo, contrasena FROM usuario WHERE correo = '{$user}' AND contrasena = '{$pwd}'";
    $resultado = mysqli_query($conexion, $querySelect);

    if($resultado){
        if($reg = mysqli_fetch_array($resultado)){
            $json['datos'][]=$reg;
        }
        mysqli_close($conexion);
        echo json_encode($json);
    }
}
>