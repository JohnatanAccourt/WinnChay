<?php
	require_once '../config/DbConnect.php';

	$conn = connect();

	if (isset($_POST["name"])):
		$search = $_POST["name"];
		$query = "SELECT * FROM CHAMPIONSHIPS INNER JOIN PICTURES INNER JOIN NUMPLAYERS WHERE CHAMPIONSHIPS.REAL_NAME LIKE '%$search%' AND CHAMPIONSHIPS.IDPICTURE = PICTURES.IDPICTURE AND NUMPLAYERS.NAME_CHAMP = CHAMPIONSHIPS.NAME ORDER BY REAL_NAME";
	else:
		$query = "SELECT * FROM CHAMPIONSHIPS INNER JOIN PICTURES INNER JOIN NUMPLAYERS WHERE CHAMPIONSHIPS.IDPICTURE = PICTURES.IDPICTURE AND NUMPLAYERS.NAME_CHAMP = CHAMPIONSHIPS.NAME ORDER BY NAME";
	endif;

	$stmt = $conn->prepare($query);
	$stmt->execute();

	if ($stmt->rowCount() > 0) {
		while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
			// echo "<div class='elementStats_Torn'>

			// 			<img src=".$row['PICTURE']." width='20%'>
						
			// 			<h2>".$row["REAL_NAME"]."</h2>
			// 			<b><h3> <i> </i></b></h3>
			// 			<b><h4></b></h4>
						

			// 			
						

			// 			
			// 	</div>";

			echo "
					<div class='card mb-3' style='max-width: 540px;'>
					<div class='row no-gutters'>
					<div class='col-md-4'>
						<img src=".$row['PICTURE']." class='card-img' alt='...'>
					</div>
					<div class='col-md-8'>
						<div class='card-body'>
						<h5 class='card-title'><b>".$row["REAL_NAME"]."</b></h5>
						<p class='card-text'>Nº DE PARTICIPANTES: ".$row['NUMPLAYERS']."</p>
						<p class='card-text'><small class='text-muted'>DATA DE ÍNICIO: ".$row["START_DATE"]."</small></p>
						</div>
					</div>
					</div>
					<button class='buttonTorn' name='btnRegister'>Inscrever-se</button>
				</div>

				

				<input type='hidden' name='value' value='".$row['NAME_CHAMP']."'>
			";
		}
	}
	else {
		echo "<b style='color: white;'>Nenhum registro localizado.</b>";
	}