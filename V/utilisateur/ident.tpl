<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Projet PWEBC</title>
		<link rel="stylesheet" href="V/styleCSS/utilisateur.css"/>
		<!-- <script src="script.js"></script> -->
	</head>
	<body>
	<div class="container">
		<form action="index.php?controle=utilisateur&action=ident" method="post">
			<div class="col-md-12 col-md-offset-4"><label>Pseudonyme   :</label>
			<input name="nom" class="nom" value="<?php echo $nom ?>" /> </div>
			<div class="col-md-12 col-md-offset-4"><label>Mot de passe :</label>
			<input type="password" name="num" class="num" value="<?php echo $num ?>" /></div>
			<div class="col-md-12 col-md-offset-5"><input class="btn btn-primary"type= "submit" value= "Connexion" /></div>
		</form>
	</div>
	<br>
	<br>
	
	<div class="container">
		<form action="index.php?controle=utilisateur&action=register" method="post">
			<div class="col-md-12 col-md-offset-4"><label>Pseudonyme   :</label>
			<input name="nom" class="nom" value="<?php echo $nom ?>" /> </div>
			<div class="col-md-12 col-md-offset-4"><label>Mot de passe :</label>
			<input type="password" name="num" class="num" value="<?php echo $num ?>" /></div>
			<div class="col-md-12 col-md-offset-5"><input class="btn btn-primary"type= "submit" value= "Inscription" /></div>
		</form>
	</div>
	</body>
</html>
