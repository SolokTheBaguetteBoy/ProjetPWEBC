<?php
	require("C:/wamp64/www/ProjetPWEBC/M/connectBD.php");
	$idNewTresorQuerry = "SELECT IdTresor FROM Tresor";
	$idNewTresor = '0';
	$res_joueur = mysqli_query($link, $idNewTresorQuerry)	
		or die (utf8_encode("erreur de requête : ") . $idNewTresorQuerry); 
		
		if (mysqli_num_rows ($res_joueur) > 0) {
			$idNewTresor = mysqli_num_rows($res_joueur);
			
		} 
		else {
			$profil = null;
			echo 'Echec de connexion';
			$idNewTresor = '0';
		}
		
	$reqAjoutTresor = "INSERT INTO tresor(IdTresor, CoordonneeX, CoordonneeY, IdJoueurAuteur, Nom) VALUES (%s, %s, %s, %s, \" %s \")";
	$reqAjoutTresorFilled = sprintf($reqAjoutTresor, $idNewTresor, $_POST["coordX"], $_POST["coordY"], $_POST["idAuteur"], $_POST["name"]);
	$res_ajout = mysqli_query($link, $reqAjoutTresorFilled) or die (utf8_encode("erreur de requête (ajout) : ") . $reqAjoutTresorFilled);

	require($_SERVER['DOCUMENT_ROOT']."/ProjetPWEBC/V/utilisateur/creatorMode.tpl");
?>