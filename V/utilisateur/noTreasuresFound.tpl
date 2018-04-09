<html lang="en">
<head>
<meta charset="utf-8">
<title>Map</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.css" />
 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script src="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.js"></script>

<script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.2.4"></script>
<script type="text/javascript" src="./C/mapJS2.js"></script>

<style>


</style>

</head>
<body onclick="mapLoader()">
	 <div id="map" onclick="mapLoader()"></div>

	Aucun trésor trouvé
	<div class="col-md-5">
	<form method="post" action= "<?php echo "index.php?controle=utilisateur&action=creatorMode&selecterTreasure=" . $_SESSION['tresorsOwn'][1]['IdTresor']?>">
    <p>
		<input class="btn btn-primary" type="submit" value="Passer en mode création" />
    </p>
	</form></div>
	<div class="col-md-1 col-md-offset-6">
	<form action="<?php echo "index.php?controle=utilisateur&action=disconnect" ?>">
    <p>
		<input class="btn btn-primary" type="submit" value="Deconnexion" />
    </p>
	
	</form>
	</div>
	
	
	
</body>
</html>