<?PHP
include 'conexion.php';

$NombreYApellido = $_GET['NombreYApellido'];
$Email = $_GET['Email'];
$Contrasena = $_GET['Contrasena'];
$Sexo = $_GET['Sexo'];
$FechaNacimiento = $_GET['FechaNacimiento'];
$Telefono = $_GET['Telefono'];
$Terminos = $_GET['Terminos'];
$TipoUsr = 1;
$Ciudad = $_GET['Ciudad'];
$Estado = $_GET['Estado'];
$Pais = $_GET['Pais'];

$AgregarUsuario = "INSERT INTO usuario VALUES (0, null,'".$Contrasena."','".$Telefono."','".$Terminos."','".$Sexo."','".$FechaNacimiento."','".$NombreYApellido."','".$Email."','".$TipoUsr."','".$Ciudad."','".$Estado."','".$Pais."','');";
mysqli_query($conexion, $AgregarUsuario);
mysqli_close($conexion);
?>