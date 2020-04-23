<?php
$message = "";
$duration = "";
$comments = "";
$date = "";
$time = "";
$data = array();
$connection = new mysqli("localhost","student","CompSci364","rockclimb");

if($connection->connect_error){
        $message = "Cannot Connect";
        die("Connection Fail: " . $connection->connect_error);
}
if( isset($_POST['submit']))
{
	$query = "SELECT * FROM workout, user_work, user WHERE user.username=? AND user.user_id = user_work.user_id AND user_work.workout_count = workout.workout_count AND (date BETWEEN ? AND ?) ;";
	if(!($statement = $connection->prepare($query))){
                        $message = "Prepare failed: (" . $connection->errno . ") " . $connection->error;
                }else{
			$statement->bind_param('sss',$_SESSION['username'],$_POST['startDate'], $_POST['endDate']);
			$statement->execute();
			$results = $statement->get_result();
			$index = 0;
			while($row = $results->fetch_assoc()){
				$workout = array(
					$row['date'],
					$row['time'],
					$row['duration'],
					$row['comments'],
				);
				$data[$index] =$workout;
				$index = $index + 1;
			}
		}
}

