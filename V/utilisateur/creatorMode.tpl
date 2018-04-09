<html lang="en">
<head>
<meta charset="utf-8">
<title>Création de trésor</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.css" />
 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script src="http://cdn.leafletjs.com/leaflet-0.7.1/leaflet.js"></script>

<script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.2.4"></script>
<script type="text/javascript" src="./C/mapJS2.js"></script>

<!--<style>
.ui-widget-content { width: 130px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; background-color: #ccffcc;}
#droppable { width: 100; height: 150px; padding: 0.5em; float: left; margin: 10px; }
#map { height: 600px; width:1200px;}
</style>-->

</head>

<body>
<div class="container">
<div class="col-md-5">
<form method="post" action="<?php echo "index.php?controle=utilisateur&action=accueil&selecterTreasure=" . $_SESSION['tresors'][1]['IdTresor']?>">
    <p>
		<input class="btn btn-primary" type="submit" value="Mode recherche" />
    </p>
	
	</form></div>
	<div class="col-md-1 col-md-offset-6">
	<form action="<?php echo "index.php?controle=utilisateur&action=disconnect" ?>">
    <p>
		<input class="btn btn-primary" type="submit" value="Deconnexion" />
    </p>
	
	</form>
	</div>
	<div id="map"></div>
	<div class="container">
		<div class="col-md-10 col-md-offset-1">
			<form method="post" action="./index.php?controle=utilisateur&action=queryCreaTresor">
			<p>
				<label>Coordonnée X</label> : <input type="text" name="coordX" />
				<label>Coordonnée Y</label> : <input type="text" name="coordY" />
				<label>Nom du trésor</label> : <input type="text" name="name" />
				<input type="hidden" name="idAuteur" value= "<?php echo $_SESSION['profil']['IdJoueur'] ?>" />
				<div class="col-md-1 col-md-offset-5"><input class="btn btn-primary" type="submit" value="Valider" id="btn"/></div>
			</p>
			</form>
		</div>
	</div>

	<div class="container">
		<div class="col-md-10 col-md-offset-3">
			<form method="post" action="./index.php?controle=utilisateur&action=queryClueLink">
			<p>
			<SELECT name="tresorPrIndice" size="1">
				<?php 
								
				for($i = 1; $i <= $_SESSION['tresorsOwn'][0] ; $i++){
					//$nextirl = "index.php?controle=utilisateur&action=qcmEtuV2&test=" . $tests[$i]['id_test'];
									
					echo "<OPTION value =" . $_SESSION['tresorsOwn'][$i]['IdTresor'] . ">" . $_SESSION['tresorsOwn'][$i]['Nom'] . "</OPTION>";
					
					}?>
				<label>Description Indice</label> : <input type="text" name="indice" />
				<input class="btn btn-primary" type="submit" value="Lier indice au trésor sélectionné" />
			</p>
			</form>
		</div>
	</div>
	<div>
	
</body>
</html>