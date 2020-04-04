<?PHP
include 'conexion.php';

$json = array();
if(isset($_GET['user']) && isset($_GET['pwd'])){
    $user = $_GET['user'];
    $pwd = $_GET['pwd'];

    $querySelect = "SELECT correo, contrasena FROM usuario WHERE correo = '{$user}' AND contrasena = '{$pwd}'";
    $resultado = mysqli_query($conexion, $querySelect);

    if($resultado){
        if($reg = mysqli_fetch_array($resultado)){
            $json['datos'][]=$reg;
        }
        mysqli_close($conexion);
        echo json_encode($json);
    }else{
        $results['user'] = "";
        $results['pwd'] = "";
        $json['datos'][] = $results;
        echo json_encode($json);
    }
}
?>