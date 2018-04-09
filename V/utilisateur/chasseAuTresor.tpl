<html lang="en">
<head>
<meta charset="utf-8">
<title>Map</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.css" />
 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script src="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.js"></script>
<script src="./mapJS.js"></script>
<script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.2.4"></script>
<script type="text/javascript" src="./C/mapJS.js"></script>

<style>
.ui-widget-content { width: 130px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; background-color: #ccffcc;}
#droppable { width: 100; height: 150px; padding: 0.5em; float: left; margin: 10px; }
#map { height: 600px; width:1200px;}
</style>

</head>
<body>
<div class="container">
	<div class="col-md-5">
	<form method="post" action= "<?php echo "index.php?controle=utilisateur&action=creatorMode&selecterTreasure=" . $_SESSION['tresorsOwn'][1]['IdTresor']?>">
		<p>
			<input class="btn btn-primary" type="submit" value="Mode création" />
		</p>
		</form>
		</div>
	<div class="col-md-1 col-md-offset-6">
	<form action="<?php echo "index.php?controle=utilisateur&action=disconnect" ?>">
    <p>
		<input class="btn btn-primary" type="submit" value="Deconnexion" />
    </p>
	
	</form>
	</div></div>
	 <div id="map"></div>

	
	<!--<div id="info" class="ui-widget-content">
		<p>Indice 1</p>
	</div>
	<div id="info" class="ui-widget-content">
		<p>Indice 2</p>
	</div>
	<div id="info" class="ui-widget-content">
		<p>Indice 3</p>
	</div>
	<div id="info" class="ui-widget-content">
		<p>Login Joueur</p>
	</div>
	<div id="info" class="ui-widget-content">
		<p>Trésor Choisi</p>
	</div>-->
	
		
	
	<div class="container">
		<div class="col-md-4 col-md-offset-4">
			<form method="post" action= "index.php?controle=utilisateur&action=treasureChange">
		<SELECT name="tresorCherch" size="1">
		<?php 
						
		for($i = 1; $i <= $_SESSION['tresors'][0] ; $i++){
			//$nextirl = "index.php?controle=utilisateur&action=qcmEtuV2&test=" . $tests[$i]['id_test'];
							
			echo "<OPTION value =" . $_SESSION['tresors'][$i]['IdTresor'] . ">" . $_SESSION['tresors'][$i]['Nom'] . "</OPTION>";
			
			}?>
		<input class="btn btn-primary" type="submit" value="Changer de trésor"/>
	</form>
		</div>
	</div>
	<div class="container">
		<div class="col-md-10 col-md-offset-1">
			<?php getCluesTreasure($_SESSION['treasureSelecter']); ?>
		</div>
	</div>
	<div class="treasureSelector">
	
	
	
</body>
</html>