<?php

// Create connection
$con=mysqli_connect("localhost","simonorl_dbuser","School!123","simonorl_SampleAppDB");

// Check connection
if (mysqli_connect_errno()) 
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

if (isset($_POST['Username']) && isset($_POST['Password']) && isset($_POST['Email']))
{
	$username= $_POST['Username'];
	$password= hash("sha256",$_POST['Password']);
	$email= $_POST['Email'];

	$sql = "INSERT INTO Users (Username, Password, Email) VALUES ('" . $username . "', '" . $password . "','" . $email . "')";

	$result= mysqli_query($con, $sql);

	if(!$result)
	{
		echo 'duplicate username detected';
	}
	else
	{
		echo 'User added!';
	}
}
else
{
	echo 'Parameters not fulfilled';
}

mysqli_close($con);


?>