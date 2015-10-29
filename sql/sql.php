<!DOCTYPE html>
<html>
<head>
	<title>DB query</title>
</head>
<body>
		<form action="sql.php" method="post">
			db Name : <input type="text" name="db_name"><br/>
			Query   : <textarea rows="4" cols="100" name="query"></textarea><br/>
			<input type="submit" name="submit"/>
		</form>
		<?php
			$db_name = $_POST["db_name"];
			$db_query = $_POST["query"];
				$db = new PDO("mysql:dbname=$db_name","root","root");
				$rows = $db->query($db_query);
				foreach($rows as $row) {
					$temp='0';
					foreach($row as $r){ 
						if(!strcmp($temp,$r)){
					?>
						<ul><li><?= $r ?></li></ul>
					<?php }$temp=$r;}
				}
		?>
</body>
</html>
