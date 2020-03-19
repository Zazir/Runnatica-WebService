<?PHP
include 'conexion.php';

$NombreYApellido = $_GET['NombreYApellido'];
$Email = $_GET['Email'];
$Contrasena = $_GET['Contrasena'];
$Sexo = $_GET['Sexo'];
$FechaNacimiento = $_GET['FechaNacimiento'];
$FotoUrl = $_GET['FotoUrl'];
$Telefono = $_GET['Telefono'];
$Terminos = $_GET['Terminos'];

$AgregarUsuario = "INSERT INTO usuario VALUES ('".$Contrasena."','".$Telefono."','".$Terminos."','".$Sexo."','".$FechaNacimiento."','".$NombreYApellido."','".$Email."');";
mysqli_query($conexion, $AgregarUsuario);
mysqli_close($conexion);
?>