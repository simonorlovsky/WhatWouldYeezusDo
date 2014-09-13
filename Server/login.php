<?php

// Create connection
$con=mysqli_connect("localhost","simonorl_dbuser","School!123","simonorl_SampleAppDB");

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

if (isset($_POST['Username']) && isset($_POST['Password']))
{
	$username = $_POST['Username'];
	$password = hash("sha256", $_POST['Password']);
	$sql= "SELECT Password FROM Users WHERE Username = '"  . $username . "'";

	$result = mysqli_query($con, $sql);

	while($row = mysqli_fetch_array($result)) 
	{
	  if ($row['Password'] == $password)
	  {
	  	echo 'Logged in!';
	  }
	  else
	  {
	  	echo 'Login failed!';
	  }
	}
}
else{
	echo 'Missing Parameters.';
}


mysqli_close($con);

?>